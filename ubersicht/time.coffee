command: "date +\"%-I:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="time"
    <span></span>
    <i class="icon"></i>
    <span class="time-content"></span>
  </div>
  """

update: (output, el) ->
    $(".time-content").text("  #{output}")
    $icon = $(".time i.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fas fa-clock")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 12px Fira Code
  right: 30px
  top: 10px
"""
