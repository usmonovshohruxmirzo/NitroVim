require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".next",
      "bin",
      "obj",
      "dist",
      "build",
      "vendor",
      "*.lock",
      "__pycache__",
      ".venv",
      ".idea",
      ".vscode"
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
