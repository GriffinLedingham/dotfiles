command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="mem"
    <span></span>
    <i class="icon"></i>
    <span class="mem-content"></span>
  </div>
  """

update: (output, el) ->
    $(".mem-content").html("  #{output}")
    $icon = $(".mem i.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fas fa-memory")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 12px Fira Code
  left: 110px
  top: 10px
"""
