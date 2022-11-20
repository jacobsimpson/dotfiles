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


-- Most of the online instructions for building `llvm-vscode` are conflicting and wrong, even the
-- ones in different places in the LLVM documentation.
-- 
-- Try this one:
-- 
-- https://llvm.org/docs/GettingStarted.html
-- 
-- It basically boils down to:
--
-- sudo apt install cmake ninja-build
-- cd llvm-project
-- mkdir build
-- cd build
-- cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lldb" ../llvm
-- cmake --build .

return function()
    local dap = require('dap')
    dap.adapters.lldb = {
        type = 'executable',
        command = '/home/jsimpson/src/llvm-project/build/bin/lldb-vscode', -- adjust as needed, must be absolute path
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
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- return "target/debug/deps/intro_apache_arrow-e98157beb4437341"
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }

    local dapui = require('dapui')
    dapui.setup()
end
