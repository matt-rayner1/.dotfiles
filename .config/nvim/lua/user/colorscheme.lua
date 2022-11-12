--vim.cmd [[colorscheme gruvbox]]
vim.cmd [[let g:gruvbox_italic=1]]
vim.cmd [[let g:gruvbox_bold=1]]
vim.cmd [[autocmd vimenter * ++nested colorscheme gruvbox]]

--local colorscheme = gruvbox
--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--
--if not status_ok then
--    vim.notify("colorscheme " .. colorscheme .. " not found!")
--    return
--end
