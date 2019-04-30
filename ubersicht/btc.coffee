command: ""

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/all.min.css" />
  <div class="time"
    <span></span>
    <i class="icon"></i>
    <span class="btc-content"></span>
  </div>
  """

update: (output, el) ->
    $(".btc-content").html("  #{JSON.parse($.ajax({url:'https://blockchain.info/ticker',async: false}).responseText)['USD']['last']}")
    $icon = $(".time i.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fab fa-btc")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 12px Fira Code
  left: 180px
  top: 10px
"""
