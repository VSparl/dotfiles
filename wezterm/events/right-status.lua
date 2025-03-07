local wezterm = require('wezterm')
local umath = require('utils.math')
local Cells = require('utils.cells')
local colorscheme = require('colors.custom')

local nf = wezterm.nerdfonts
local attr = Cells.attr

local M = {}

local ICON_SEPARATOR = nf.oct_dash
local ICON_DATE = nf.fa_calendar

---@type string[]
local discharging_icons = {
   nf.md_battery_10,
   nf.md_battery_20,
   nf.md_battery_30,
   nf.md_battery_40,
   nf.md_battery_50,
   nf.md_battery_60,
   nf.md_battery_70,
   nf.md_battery_80,
   nf.md_battery_90,
   nf.md_battery,
}
---@type string[]
local charging_icons = {
   nf.md_battery_charging_10,
   nf.md_battery_charging_20,
   nf.md_battery_charging_30,
   nf.md_battery_charging_40,
   nf.md_battery_charging_50,
   nf.md_battery_charging_60,
   nf.md_battery_charging_70,
   nf.md_battery_charging_80,
   nf.md_battery_charging_90,
   nf.md_battery_charging,
}

-- stylua: ignore
local colors = {
   date      = { fg = colorscheme.ansi[7], bg = 'rgba(0, 0, 0, 1)' },
   battery   = { fg = colorscheme.ansi[3], bg = 'rgba(0, 0, 0, 1)' },
   separator = { fg = 'rgba(0, 0, 0, 1)', bg = 'rgba(0, 0, 0, 1)' }
}

local cells = Cells:new(colors)

cells
    :push('date_icon', ICON_DATE .. '  ', 'date', attr(attr.intensity('Bold')))
    :push('date_text', '', 'date', attr(attr.intensity('Bold')))
    :push('separator', ' ' .. ICON_SEPARATOR .. '  ', 'separator')
    :push('battery_icon', '', 'battery')
    :push('battery_text', '', 'battery', attr(attr.intensity('Bold')))

---@return string, string
local function battery_info()
   -- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html

   local charge = ''
   local icon = ''

   for _, b in ipairs(wezterm.battery_info()) do
      local idx = umath.clamp(umath.round(b.state_of_charge * 10), 1, 10)
      charge = string.format('%.0f%%', b.state_of_charge * 100)

      if b.state == 'Charging' then
         icon = charging_icons[idx]
      else
         icon = discharging_icons[idx]
      end
   end

   return charge, icon .. ' '
end

M.setup = function()
   wezterm.on('update-right-status', function(window, _pane)
      local battery_text, battery_icon = battery_info()

      cells
          :update_segment_text('date_text', wezterm.strftime('%a %H:%M:%S'))
          :update_segment_text('battery_icon', battery_icon)
          :update_segment_text('battery_text', battery_text)

      window:set_right_status(
         wezterm.format(
            cells:render({ 'date_icon', 'date_text', 'separator', 'battery_icon', 'battery_text' })
         )
      )
   end)
end

return M
