command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="cpu"
    <span></span>
    <i class="icon"></i>
    <span class="cpu-content"></span>
  </div>
  """

update: (output, el) ->
    $(".cpu-content").html("  #{output}")
    $icon = $(".cpu i.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fas fa-microchip")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 12px Fira Code
  left: 30px
  top: 10px
"""
