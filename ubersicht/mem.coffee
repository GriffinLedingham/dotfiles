command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="mem"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".mem span:first-child", el).text("  #{output}%")
    $icon = $(".mem span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fas fa-memory")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 10px Input
  left: 80px
  top: 6px
"""
