local dap = require("dap")

local function get_module_and_asset_name(file_path)
  local script_name = file_path:match("([^/]+)%.py$")
  local module_name = "orchestration"
  return module_name, script_name
end

-- Define a function to launch the Dagster process
local function dagster_launch_configuration()
  local file_path = vim.fn.expand("%")
  local module_name, script_name = get_module_and_asset_name(file_path)
  local dagster_command = string.format("dagster asset materialize -m %s --select %s", module_name, script_name)

  print("Running Dagster command:", dagster_command) -- For debugging, remove or comment out if not needed

  -- This will run the Dagster command and print the output to Neovim's command line
  vim.fn.jobstart(dagster_command, {
    on_exit = function(j, return_val)
      if return_val == 0 then
        print("Dagster materialization completed successfully")
      else
        print("Dagster materialization failed")
        print(dagster_command)
      end
    end,
  })
end

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Dagster Launch",
    program = "${env:DAGSTER_PROJECT_HOME}",
    custom_launch = dagster_launch_configuration, -- Change here to reference the function directly
  },
}

return {}
