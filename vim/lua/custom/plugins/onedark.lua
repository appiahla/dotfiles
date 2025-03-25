return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup {
      style = 'cool',
      toggle_style_key = "colorscheme onedark",
      toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'},
    }
  end,
}
