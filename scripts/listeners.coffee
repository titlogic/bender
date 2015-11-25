# Description:
#   I gonna stuff a bunch of responses here based on what people say.

module.exports = (robot) ->

  robot.hear /(whistles)/i, (msg) ->
    response = [
      "its dat woo wooooo",
      "https://soundcloud.com/vibesquad/the-whistles",
      "http://i.imgur.com/KeepBS0.jpg",
      "http://24.media.tumblr.com/tumblr_lx31kykJQX1r2tufko1_400.jpg"
    ]

    if Math.random() < 0.2
      msg.send msg.random response


  robot.hear /(tits|I approve)/i, (msg) ->
    response = [
      "did someone say tits?",
      "TITS! ",
      "Woohoo!!! ... tits. ",
      "tits!",
      "tits!",
      "tits!",
      "tits! image me boobies",
      "woohoo! tits! animate me boobies"
      "Boobies!"
    ]
    if Math.random() < 0.8
      msg.send msg.random response
