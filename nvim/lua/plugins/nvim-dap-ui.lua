vim.keymap.set(
    'n',
    ' dv',
    require'dapui'.toggle,
    { desc = 'Toggle debug view.', remap = false }
)

vim.keymap.set(
    'n',
    ' db',
    require'dap'.toggle_breakpoint,
    { desc = 'Toggle debug breakpoint.', remap = false }
)

vim.keymap.set(
    'n',
    ' dl',
    function()
        require'dap'.toggle_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end,
    { desc = 'Toggle log message.', remap = false }
)

vim.keymap.set(
    'n',
    ' dc',
    require'dap'.continue,
    { desc = 'Continue debugging.', remap = false }
)

vim.keymap.set(
    'n',
    ' dr',
    require'dap'.run_last,
    { desc = 'Rerun last debug.', remap = false }
)

vim.keymap.set(
    'n',
    ' ds',
    function() dap_start() end,
    { desc = 'Start debugging.', remap = false }
)

vim.keymap.set(
    'n',
    ' dt',
    require'dap'.terminate,
    { desc = 'Terminate any running debug sessions.', remap = false }
)

vim.keymap.set(
    'n',
    ' de',
    require'dap'.terminate,
    { desc = 'Terminate the current debug session.', remap = false }
)

vim.keymap.set(
    'n',
    '<C-A-B>',
    require'dap'.toggle_breakpoint,
    { desc = 'Toggle debug breakpoint.', remap = false }
)

vim.keymap.set(
    'n',
    '<C-A-J>',
    '<cmd>DapStepOver<cr>',
    { desc = 'Step over.', remap = false }
)

vim.keymap.set(
    'n',
    '<C-A-K>',
    require'dap'.step_back,
    { desc = 'Step back.', remap = false }
)

vim.keymap.set(
    'n',
    '<C-A-H>',
    '<cmd>DapStepOut<cr>',
    { desc = 'Step out.', remap = false }
)

vim.keymap.set(
    'n',
    '<C-A-L>',
    '<cmd>DapStepInto<cr>',
    { desc = 'Step into.', remap = false }
)


vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

local function list_executables()
    local result = {}

    local Job = require'plenary.job'
    -- `cargo test --no-run` shows the executables produced by the build for each test.
    -- The actual executable is necessary to be passed to the debugger.
    Job:new({
        -- This execution has always failed without a complete path.
        command = '/home/jacobsimpson/.cargo/bin/cargo',
        args = { 'test', '--no-run' },
        on_exit = function(j, return_val)
            for _, line in ipairs(j:stderr_result()) do
                if string.find(line, "Executable ") ~= nil then
                    _, loc_start = string.find(line, "%(")
                    loc_end, _ = string.find(line, "%)")
                    if loc_start ~= nil and loc_end ~= nil then
                        table.insert(result, string.sub(line, loc_start+1, loc_end-1))
                    end
                end
            end
        end,
    }):sync()

    table.insert(result, "target/debug/data_load")

    -- Plus, add the binaries generated for the 'build' target.
    -- Job:new({
    --     -- This execution has always failed without a complete path.
    --     command = '/usr/bin/find',
    --     args = { 'target/debug', '-maxdepth', '1', '-type', 'f', '-executable' },
    --     on_exit = function(j, return_val)
    --         put(vim.inspect(j))
    --         for _, line in ipairs(j:stdout_result()) do
    --             table.insert(result, line)
    --             -- if string.find(line, "Executable ") ~= nil then
    --             --     _, loc_start = string.find(line, "%(")
    --             --     loc_end, _ = string.find(line, "%)")
    --             --     if loc_start ~= nil and loc_end ~= nil then
    --             --         table.insert(result, string.sub(line, loc_start+1, loc_end-1))
    --             --     end
    --             -- end
    --         end
    --     end,
    -- }):sync()

    return result
end

-- I haven't found a nice summary blog, and the example in the docs didn't work for me.
-- This play list takes you through it one at a time.
-- https://www.youtube.com/watch?v=sHF-LX7FcKM&list=PLOe6AggsTaVsMfLjXeavVwzkmOfAZnfQb&index=4
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()

    require('dap').run({
        name = "Launch file",
        type = 'lldb',
        request = 'launch',
        -- This is the executable to be debugged. Everything is an executable, even a
        -- test. Run `cargo test --no-run` to see the names of the executable file
        -- printed beside each test.
        program = selected[1],
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    })

    actions.close(prompt_bufnr)
end

local function rfind(subject, pattern)
    local s = nil
    local e = nil
    local i = 0
    local j = 0
    while true do
        print("i = ", i)
        i, j = string.find(subject, pattern, i+1)
        if i == nil then
            if s == nil then return nil end
            return s, e
        end
        s = i
        e = j
    end
end

-- Uses the name of the current buffer and the list of available targets to guess a
-- possible execution target. The idea is, if you are in a file, and want to debug
-- that file, there is a reasonable chance you want to debug the tests in that file.
-- The tests will be compiled into a special executable target named after that file.
local function get_default_text(executable_targets)
    local f = vim.api.nvim_buf_get_name(0)

    -- Trim off all the path.
    local _, e = rfind(f, "/")
    if e ~= nil then 
        f = string.sub(f, e+1)
    end

    -- Trim off the file extension.
    local s, _ = rfind(f, "%.")
    if s ~= nil then
        f = string.sub(f, 1, s-1)
    end

    return f
end

function dap_start()
    local dap = require('dap')

    if dap.status() ~= "" then dap.terminate() end

    if vim.bo.filetype ~= "rust" then
        print("Unable to detect debug targets for file type " .. vim.bo.filetype)
        return
    end

    local executable_targets = list_executables()
    local default_text = get_default_text(executable_targets)

    local opts = {
        layout_strategy = "vertical",
        layout_config = {
            height = 0.7,
            width = 0.9,
            prompt_position = "top",
        },

        sorting_strategy = "ascending",

        prompt_title = "Select executable to debug",
        prompt_prefix = "🔍 ",

        default_text = default_text,

        finder = finders.new_table(executable_targets),
        sorter = sorters.get_generic_fuzzy_sorter({}),

        attach_mappings = function(prompt_bufnr, map)
            map("i", "<CR>", enter)
            return true
        end
    }

    local target_selector = pickers.new(opts)
    target_selector:find()
end


--vim.api.nvim_create_user_command({name}, {command}, {opts})
vim.api.nvim_create_user_command('DapStart', dap_start, {})


-- Most of the online instructions for building `llvm-vscode` are conflicting and wrong, even the
-- ones in different places in the LLVM documentation.
--
-- Try this one:
--
-- https://llvm.org/docs/GettingStarted.html
--
-- It basically boils down to:
--
-- sudo apt-get install -y cmake ninja-build
-- git clone git@github.com:llvm/llvm-project.git
-- cd llvm-project
-- mkdir build
-- cd build
-- cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lldb" ../llvm
-- cmake --build .

return function()
    local debug_target_cache = {}

    local dap = require('dap')
    dap.adapters.lldb = {
        type = 'executable',
        -- adjust as needed, must be absolute path. Instructions above on building this.
        command = '/home/jacobsimpson/.local/bin/lldb-vscode',
        name = 'lldb'
    }

    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
    -- :h dap-configuration
    dap.configurations.rust = {
      {
        name = "Launch file",
        type = 'lldb',
        request = 'launch',
        -- This is the executable to be debugged. Everything is an executable, even a
        -- test. Run `cargo test --no-run` to see the names of the executable file
        -- printed beside each test.
        program = function()
            -- This function gets called if no program was supplied to require('dap').run().
            -- Ideally this function would invoke the Telescope chooser, however Telescope
            -- is async and I was unable to find a way to invoke it and get the response from
            -- within this function. So I wrap the start of debugging with Telepscope and
            -- specify a string for the `program` value. If all goes well, this function will
            -- never be called.

            if debug_target_cache["rust"] == nil then
                debug_target_cache["rust"] = {}
            end
            local suggestion = vim.fn.getcwd() .. '/'
            if debug_target_cache["rust"][vim.fn.getcwd()] ~= nil then
                suggestion = debug_target_cache["rust"][vim.fn.getcwd()]
            end
            local requested = vim.fn.input('Path to executable: ', suggestion, 'file')
            debug_target_cache["rust"][vim.fn.getcwd()] = requested
            return requested
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }

    ----------------------------------------------------------------------------------
    --
    -- Python debugger configuration.
    --

    -- The implementation of the debugging protocol is here:
    -- https://github.com/microsoft/debugpy
    -- That page includes different mechanisms for connecting to the debugger, including over TCP.
    -- The best description of how to set this up is here:
    -- https://github.com/mfussenegger/nvim-dap-python
    dap.adapters.python = {
        type = 'executable';
        command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python';
        args = { '-m', 'debugpy.adapter' };
    }

    --
    -- For remote debugging Python.
    --
    -- 1. Install the debugger on the interpreter where the script will execute.
    --     pip install debugpy
    -- 2. Expose the port from Docker. In `docker compose` add this section to the
    --    appropriate service in the docker-compose.yml file:
    --     ports:
    --         - "5678:5678"
    --    `expose` only makes it available to other services, not to the host.
    -- 3. Start the interpreter with the debugger active and waiting for connection.
    --     cd storage/release  # <- that is the directory containing the script.
    --     python -m debugpy --listen :5678 --wait-for-client test_one_time_updates.py --dry-run

    -- :lua require('dap').set_log_level('TRACE')
    --  Available log levels: TRACE, DEBUG, INFO, WARN, ERROR
    --      :lua print(vim.fn.stdpath('cache'))
    --  The filename is `dap.log`
    dap.adapters.pythonremote = {
        type = 'server';
        host = '127.0.0.1'; -- host to connect to, defaults to 127.0.0.1
        port = 5678;        -- port to connect to.
                            -- If "${port}" nvim-dap resolves a free port.
                            -- This is intended to be used with
                            -- `executable.args` further below below
    }

    dap.configurations.python = {
      {
          type = 'python';
          request = 'launch';
          name = "Launch file";
          program = "${file}";
          pythonPath = function()
              return '/usr/bin/python3'
          end;
      },
      {
          type = 'pythonremote';
          request = 'attach';
          name = "Attach to existing process.";
          program = "${file}";
          pythonPath = function()
              return '/usr/bin/python3'
          end;
          pathMappings = {
              {
                  --localRoot  = "${workspaceFolder}";
                  localRoot  = "/home/jacobsimpson/src/gro";
                  remoteRoot = "/app";
              }
          };
      },
    }

    local dapui = require('dapui')
    dapui.setup()
end
