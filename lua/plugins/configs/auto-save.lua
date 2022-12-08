if not require("core.utils").plugin_loaded("auto-save") then
	return
end

require("auto-save").setup({
	trigger_events = { "BufLeave" },
})
