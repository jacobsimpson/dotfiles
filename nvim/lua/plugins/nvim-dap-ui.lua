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
    ' dr',
    require'dap'.run_last,
    { desc = 'Rerun last debug.', remap = false }
)

vim.keymap.set(
    'n',
    ' dt',
    require'dap'.continue,
    { desc = 'Start debugging a test.', remap = false }
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
        command = '/home/jacobsimpson/src/llvm-project/build/bin/lldb-vscode',
        name = 'lldb'
    }

    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
    -- :h dap-configuration
    dap.configurations.rust = {
      {
        name = "Launch file",
        type = 'lldb',
        request = 'launch',
        -- This is the executable to be debugged. Everything is an executable, even a test.
        -- Run `cargo test --no-run` to see the names of the executable file printed beside each
        -- test.
        program = function()
            --local current_file = vim.fn.getbufinfo()[1].name
            --local cwd = vim.fn.getcwd()
            --if current_file:sub(1, cwd:len()) == cwd then
            --    print("the current file is a child of the current directory.")
            --    -- local file = io.popen('cargo test --no-run', 'r')
            --    local file = io.popen('echo something is here', 'r')
            --    local output = file:read('*all')
            --    file:close()
            --    print(output)
            --    -- print("And the output should be visible")
            --end
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
            -- return "target/debug/deps/intro_apache_arrow-e98157beb4437341"
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
        port = 49153;       -- port to connect to.
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
