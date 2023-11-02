return {
    "glepnir/coman.nvim",
    config = function()
        vim.keymap.set('n', 'gcc', '<cmd>ComComment<cr>', { noremap = true, silent = true })
        vim.keymap.set('x', 'gcc', ':ComComment<cr>', { noremap = true, silent = true })
        vim.keymap.set('n','gcj','<cmd>ComAnnotation<Cr>',{noremap = true,silent = true})
    end
}
