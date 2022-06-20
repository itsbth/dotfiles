(module magic.plugin.catppuccin
  {autoload {nvim aniseed.nvim
             cp catppuccin}})

(cp.setup {:integrations {:lsp_trouble true
                          :lsp_saga true
                          :which_key true
                          :neogit true
                          :lightspeed true}})
