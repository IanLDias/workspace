return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python"
    },
    keys = {
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run Current File Tests" },
        { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest Test" },
        { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop Nearest Test" },
        { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to Nearest Test" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    -- Extra arguments for nvim-dap configuration
                    -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                    dap = { justMyCode = false },
                    -- Command line arguments for runner
                    -- Can also be a function to return dynamic values
                    args = {"--log-level", "DEBUG"},
                    -- Runner to use. Will use pytest if available by default.
                    -- Can be a function to return dynamic value.
                    runner = "pytest",
                    -- Custom python path for the runner.
                    -- Can be a string or a list of strings.
                    -- Can also be a function to return dynamic value.
                    -- If not provided, the path will be inferred by checking for 
                    -- virtual envs in the local directory and for Pipenev/Poetry configs
                    -- Returns if a given file path is a test file.
                    -- NB: This function is called a lot so don't perform any heavy tasks within it.
                    -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
                    -- instances for files containing a parametrize mark (default: false)
                    pytest_discover_instances = true,
                })
            }
        })
    end
}
