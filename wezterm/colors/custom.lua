local nord = {
   -- Nord - Polar Night theme colors
   nord0 = '#2e3440',
   nord1 = '#3b4252',
   nord2 = '#434c5e',
   nord3 = '#4c566a',
   -- Nord - Snow Storm theme colors
   nord4 = '#d8dee9',
   nord5 = '#e5e9f0',
   nord6 = '#eceff4',
   -- Nord - Frost theme colors
   nord7 = '#8fbcbb',
   nord8 = '#88c0d0',
   nord9 = '#81a1c1',
   nord10 = '#5e81ac',
   -- Nord - Aurora theme colors
   nord11 = '#bf616a',
   nord12 = '#d08770',
   nord13 = '#ebcb8b',
   nord14 = '#a3be8c',
   nord15 = '#b48ead',
}

local colorscheme = {
   background = 'rgba(0, 0, 0, 1)',
   foreground = nord.nord6,
   cursor_bg = nord.nord4,
   cursor_border = nord.nord4,
   cursor_fg = nord.nord1,
   selection_bg = nord.nord2,
   selection_fg = nord.nord4,
   -- PowerShell uses some kind of weird mix between all these colors, so I adapted them all to the Nord scheme
   ansi = {
      nord.nord0,  -- black
      nord.nord11, -- red
      nord.nord14, -- green
      nord.nord13, -- yellow
      nord.nord10, -- blue
      nord.nord15, -- magenta/purple
      nord.nord8,  -- cyan
      nord.nord6,  -- white
   },
   brights = nil,  -- Will point to the same thing as colorscheme.ansi later
   tab_bar = {
      background = nord.nord0,
      active_tab = {
         bg_color = nord.nord2,
         fg_color = nord.nord6,
      },
      inactive_tab = {
         bg_color = nord.nord1,
         fg_color = nord.nord6,
      },
      inactive_tab_hover = {
         bg_color = nord.nord3,
         fg_color = nord.nord6,
      },
      new_tab = {
         bg_color = nord.nord0,
         fg_color = nord.nord6,
      },
      new_tab_hover = {
         bg_color = nord.nord3,
         fg_color = nord.nord6,
         italic = true,
      },
   },
   visual_bell = nord.nord6,
   indexed = {
      [16] = nord.nord12,
      [17] = nord.nord11,
   },
   scrollbar_thumb = nord.nord6,
   split = nord.nord3,
   compose_cursor = nord.nord15,
}

colorscheme.brights = colorscheme.ansi

return colorscheme
