local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = dap.configurations.python or {}
table.insert(dap.configurations.python, {
  type = "python",
  request = "launch",
  name = "Dagster Dev",
  module = "dagster",
  args = { "dev", "-m", "orchestration" },
  cwd = "${workspaceFolder}/dagster",
  env = {
    PYTHONPATH = "${workspaceFolder}",
  },
  console = "integratedTerminal",
})

return {}
