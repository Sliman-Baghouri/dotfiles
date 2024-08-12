return {
  -- install with yarn or npm
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }


    -- vim.g.mkdp_highlight_css = "/home/rodya/.dotfiles/.config/mdStyle.css"
    -- vim.g.mkdp_markdown_css = "/home/rodya/.dotfiles/.config/mdStyle.css"
       vim.g.mkdp_theme = 'light'
  end,
  ft = { "markdown" },
}
