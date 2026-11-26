local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local memory = sbar.add("item", "widgets.memory", {
  position = "right",
  icon = {
    string = icons.memory,
    color = colors.grey,
  },
  label = {
    string = "??%",
    padding_right = 10,
    font = { family = settings.font.numbers },
  },
  update_freq = 5,
})

local cpu = sbar.add("graph", "widgets.cpu", 42, {
  position = "right",
  graph = { color = colors.blue },
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = {
    string = icons.cpu,
    color = colors.grey,
    padding_left = 10,
  },
  label = {
    string = "cpu ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 9.0,
    },
    align = "right",
    padding_right = 0,
    width = 0,
    y_offset = 4
  },
  padding_right = settings.paddings + 6
})

local function load_color(percent)
  if percent >= 80 then return colors.red end
  if percent >= 60 then return colors.orange end
  if percent >= 30 then return colors.yellow end
  return colors.blue
end

cpu:subscribe("cpu_update", function(env)
  local load = tonumber(env.total_load)
  cpu:push({ load / 100. })
  cpu:set({
    graph = { color = load_color(load) },
    label = "cpu " .. env.total_load .. "%",
  })
end)

memory:subscribe({ "forced", "routine", "system_woke" }, function()
  sbar.exec("memory_pressure -Q", function(result)
    local free = tonumber(result:match("free percentage: (%d+)%%"))
    if not free then return end
    local used = 100 - free
    memory:set({
      label = {
        string = string.format("%02d%%", used),
        color = used >= 80 and load_color(used) or colors.white,
      },
    })
  end)
end)

local function open_activity_monitor()
  sbar.exec("open -a 'Activity Monitor'")
end

cpu:subscribe("mouse.clicked", open_activity_monitor)
memory:subscribe("mouse.clicked", open_activity_monitor)

sbar.add("bracket", "widgets.cpu.bracket", { cpu.name, memory.name }, {
  background = { color = colors.pill.bg }
})

sbar.add("item", "widgets.cpu.padding", {
  position = "right",
  width = settings.group_paddings
})
