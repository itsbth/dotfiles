(module magic.plugin.org-mode
        {autoload {nvim aniseed.nvim
                   : orgmode
                   : org-bullets
                   : headlines
                   treesitter-parsers nvim-treesitter.parsers}})

(orgmode.setup_ts_grammar)
(orgmode.setup)
(when (. packer_plugins :org-bullets)
  (org-bullets.setup {:symbols ["◉" "○" "✸" "✿"]}))
(when (. packer_plugins :headlines.nvim)
  (headlines.setup))
