command: """
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell')"
echo "$theArtist - $theName"
"""

refreshFrequency: 2000

style: """
  -webkit-font-smoothing: antialiased
  font: 12px Fira Code
  top: 5px
  left: 0px
  right: 0px
  text-align: center
  position: absolute
  color: #d5c4a1
  line-height: 25px
  vertical-align: top
  i
    color: #d5c4a1
    margin-right: 8px
    font-size: 16px
    vertical-align: top
    top: 3px
    position: relative
"""

render: (output) -> """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="some-class"><i class="fab fa-spotify"></i>#{output}</div>
"""