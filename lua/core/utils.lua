local M = {}

M.on_file_open = function(plugin_name)
  M.lazy_load {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = "BeLazyOnFileOpen" .. plugin_name,
    plugin = plugin_name,
    condition = function()
      local file = vim.fn.expand "%"
      return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
    end,
  }
end

return M
