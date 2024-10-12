return {
  -- dashboard to greet
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      -- https://www.patorjk.com/software/taag/#p=display&f=Graceful&t=Neovim
      -- big, Doh, Doom, Epic, Shaded Blocky, Standard, Bolger, Broadway, Collosal,
      -- Cybermedium (Maybe doesn't work, esc chars), Double, Georgia11, Roman

      -- a list of headers


      dashboard.section.header.val = {
        "b.             8 8 8888888888       ,o888888o.  `8.`888b           ,8'  8 8888          ,8.       ,8.          ",
        "888o.          8 8 8888          . 8888     `88. `8.`888b         ,8'   8 8888         ,888.     ,888.         ",
        "Y88888o.       8 8 8888         ,8 8888       `8b `8.`888b       ,8'    8 8888        .`8888.   .`8888.        ",
        ".`Y888888o.    8 8 8888         88 8888        `8b `8.`888b     ,8'     8 8888       ,8.`8888. ,8.`8888.       ",
        "8o. `Y88888o. 8  8 888888888888 88 8888         88  `8.`888b   ,8'      8 8888      ,8'8.`8888,8^8.`8888.      ",
        "8`Y8o. `Y88888o8 8 8888         88 8888         88   `8.`888b ,8'       8 8888     ,8' `8.`8888' `8.`8888.     ",
        "8   `Y8o. `Y8888 8 8888         88 8888        ,8P    `8.`888b8'        8 8888    ,8'   `8.`88'   `8.`8888.    ",
        "8      `Y8o. `Y8 8 8888         `8 8888       ,8P      `8.`888'         8 8888   ,8'     `8.`'     `8.`8888.   ",
        "8         `Y8o.` 8 8888          ` 8888     ,88'        `8.`8'          8 8888  ,8'       `8        `8.`8888.  ",
        "8            `Yo 8 888888888888     `8888888P'           `8.`           8 8888 ,8'         `         `8.`8888. ",
        }
      --  local banner = {

      --     "░   ░░░  ░░        ░░░      ░░░  ░░░░  ░░        ░░  ░░░░  ░",
      --     "▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒   ▒▒   ▒",
      --     "▓  ▓  ▓  ▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓▓  ▓▓  ▓▓▓▓▓▓  ▓▓▓▓▓        ▓",
      --     "█  ██    ██  ████████  ████  ████    ███████  █████  █  █  █",
      --     "█  ███   ██        ███      ██████  █████        ██  ████  █",
      -- }

      -- dashboard.section.header.val ={banner[1], banner[2], banner[3], banner[4], banner[5]}

      -- Set men
      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '󰈞  > Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
        -- workspaces
        dashboard.button('w', '  > Workspaces', ':Telescope workspaces<CR>'),
        -- bookmarks
        dashboard.button('b', '󰅚  > Bookmarks', ":lua require('ezbookmarks').OpenBookmark()<CR>"),
        -- line marks
        dashboard.button('m', '󰅚  > Line marks', ':Telescope marks<CR>'),
        dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h<cr>'),
        dashboard.button('q', '󰅚  > Quit', ':qa<CR>'),
      }

--      local fortune = require 'alpha.fortune'
--      dashboard.section.footer.val = fortune {
--        fortune_list = {
--          { 'You otter be proud of yourself!', '', '— 🦦' },
--          { 'Hello from the otter slide!', '', '— Otterdele' },
--          { 'To otter space!', '', '— 🦦' },
--          { "What if I say I'm not like the otters?", '', '— Foo Fighters' },
--          { 'Nothing is im-paw-sible 🐾', '', '— 🐕' },
--        },
--      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)
    end,
  },
}
