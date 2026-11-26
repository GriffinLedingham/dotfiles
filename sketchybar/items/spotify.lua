local colors = require("colors")
local settings = require("settings")

sbar.add("event", "spotify_change", "com.spotify.client.PlaybackStateChanged")

local spotify = sbar.add("item", "spotify", {
  position = "right",
  drawing = false,
  icon = {
    string = ":spotify:",
    font = "sketchybar-app-font:Regular:15.0",
    color = colors.green,
    padding_left = 10,
  },
  label = {
    max_chars = 40,
    padding_right = 10,
  },
})

local bracket = sbar.add("bracket", "spotify.bracket", { spotify.name }, {
  background = { color = colors.pill.bg },
})

local padding = sbar.add("item", "spotify.padding", {
  position = "right",
  drawing = false,
  width = settings.group_paddings,
})

local function render(state, artist, title)
  local drawing = state == "playing" or state == "paused"
  spotify:set({
    drawing = drawing,
    icon = { color = state == "playing" and colors.green or colors.grey },
    label = {
      string = artist .. " - " .. title,
      color = state == "playing" and colors.white or colors.grey,
    },
  })
  bracket:set({ drawing = drawing })
  padding:set({ drawing = drawing })
end

spotify:subscribe("forced", function()
  sbar.exec([[osascript -e 'if application "Spotify" is running then tell application "Spotify" to return (player state as string) & "|" & artist of current track & "|" & name of current track']], function(result)
    local state, artist, title = result:match("^(%a+)|([^|]*)|(.-)%s*$")
    render(state, artist or "", title or "")
  end)
end)

spotify:subscribe("spotify_change", function(env)
  render(string.lower(env.INFO["Player State"] or ""), env.INFO.Artist or "", env.INFO.Name or "")
end)

spotify:subscribe("mouse.clicked", function(env)
  if env.BUTTON == "right" then
    sbar.exec([[osascript -e 'tell application "Spotify" to next track']])
  else
    sbar.exec([[osascript -e 'tell application "Spotify" to playpause']])
  end
end)
