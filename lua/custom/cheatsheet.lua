-- Beginner-friendly Vim keymap cheat sheet for your Kickstart setup.

local function open_cheat_sheet()
  local lines = {
    'NEOVIM CHEATSHEET (BEGINNER FRIENDLY)',
    '',
    'What is <leader>?  It is the Space key in your config.',
    'How to use it: press Space, then the next key sequence.',
    'Example: Space then s then f  =>  Telescope find files.',
    '',
    '[N] BASIC NAVIGATION',
    '  h j k l             left/down/up/right',
    '  gg / G              jump to top / bottom of file',
    '  0 / ^ / $          start / first word / end of line',
    '  w / b               jump forward / backward by word',
    '  Ctrl-u / Ctrl-d     move up / down half a screen',
    '  Ctrl-f / Ctrl-b     move full page down / up',
    '  %                   jump between matching brackets',
    '  Ctrl-o / Ctrl-i     jump back / forward in jump history',
    '',
    '[W] WINDOW & CURSOR HELPERS',
    '  Ctrl-h / Ctrl-l     move to left / right split',
    '  Ctrl-j / Ctrl-k     move to lower / upper split',
    '  Alt-j / Alt-k       move 10 lines down / up',
    '  / and ?             search forward / backward in file',
    '  n / N               next / previous search result',
    '',
    '[E] MODE SWITCHING',
    '  i                   enter insert mode',
    '  I                   insert at line start',
    '  a                   append after cursor',
    '  A                   append at line end',
    '  o / O               open new line below / above',
    '  jk                  exit insert mode (customized in your setup)',
    '  ;                   open command line (:)',
    '',
    '[C] FILES (OPEN / SAVE / CLOSE)',
    '  :e path/to/file     edit existing or create new file at that path',
    '  :e .                open file browser (netrw) in current folder',
    '  :w                  save current file',
    '  :w path/to/file     save as new file in a specific location',
    '  Space nn            open file by typed path (prompt)',
    '  Space nw            save current file to a typed path (prompt)',
    '  Space w             save current file',
    '  Space wq            save and quit',
    '  Space wa            save all buffers',
    '  :q                  quit current window',
    '  :qa                 quit all windows',
    '',
    '[Y] YANK / DELETE / PASTE',
    '  y                   yank selected text / motion target',
    '  yy                  yank whole line',
    '  yw / yiw            yank to end of word / inside word',
    '  d                   delete selected text / motion target (also yanks)',
    '  dd                  delete current line',
    '  p / P               paste after / before cursor',
    '  u / Ctrl-r          undo / redo',
    '',
    '[L] LEADER KEYS',
    '  Space f        Format current buffer (conform)',
    '  Space q        Open diagnostic list',
    '  Space ?        Open this cheat sheet',
    '  Space a        Harpoon: add current file',
    '  Space h        Harpoon: toggle quick menu',
    '  Space j / k / l / ;',
    '                 Harpoon: jump to slot 1 / 2 / 3 / 4',
    '',
    '[S] SEARCH PREFIX (all start with Space + s)',
    '  Space sh       Search Neovim help',
    '  Space sk       Search keymaps',
    '  Space sf       Search files',
    '  Space ss       Search Telescope built-in pickers',
    '  Space sw       Search current word',
    '  Space sg       Search by grep',
    '  Space sd       Search diagnostics',
    '  Space sr       Resume last search',
    '  Space s.       Search recent files',
    '  Space sn       Search Neovim config files',
    '',
    '[LSP] LSP SHORTCUTS (when cursor is on code and language server is active)',
    '  grn            Rename symbol',
    '  gra            Code action',
    '  grr            Go to references',
    '  gri            Go to implementation',
    '  grd            Go to definition',
    '  grD            Go to declaration',
    '  grt            Go to type definition',
    '  gO             Open document symbols',
    '  gW             Open workspace symbols',
    '  Space th      Toggle inlay hints',
    '',
    '[P] PRO TIPS',
    '  Space ?  opens this sheet anytime.',
    '  If something still feels unclear: type commands in order, not together.',
    '  Example: press Space, then s, then f.',
    '',
    "Tip: In command mode, press Tab to auto-complete files/paths while typing :e or :w.",
  }

  vim.cmd('botright 30new [vim-cheatsheet]')
  local buf = vim.api.nvim_get_current_buf()

  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].bufhidden = 'wipe'
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true
  vim.bo[buf].readonly = false
  vim.bo[buf].filetype = 'markdown'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
end

local function create_prompted_file()
  local path = vim.fn.input('Edit file path: ', '', 'file')
  if not path or path == '' then
    return
  end

  vim.cmd('edit ' .. vim.fn.fnameescape(path))
end

local function write_file_as_prompt()
  local path = vim.fn.input('Save file to path: ', '', 'file')
  if not path or path == '' then
    return
  end

  local ok, err = pcall(function()
    vim.cmd('write ' .. vim.fn.fnameescape(path))
  end)
  if not ok then
    vim.notify('Could not save file: ' .. err, vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command('Cheat', open_cheat_sheet, { desc = 'Open a beginner Vim cheat sheet' })
vim.keymap.set('n', '<leader>?', open_cheat_sheet, { desc = 'Open Vim cheat sheet' })
vim.keymap.set('n', '<leader>nn', create_prompted_file, { desc = 'Create/open file at typed path' })
vim.keymap.set('n', '<leader>nw', write_file_as_prompt, { desc = 'Write file to typed path' })
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Write current buffer' })
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', { desc = 'Write and quit current buffer' })
vim.keymap.set('n', '<leader>wa', '<cmd>wa<cr>', { desc = 'Write all buffers' })
