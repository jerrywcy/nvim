if not require("core.utils").plugin_loaded("coc") then
    return
end

local coc_path = "plugins.configs.coc/"
require(coc_path .. "extensions")
require(coc_path .. "options")
require(coc_path .. "mappings")
require(coc_path .. "commands")
