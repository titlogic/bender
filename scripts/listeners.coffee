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
    if Math.random() < 0.5
      msg.send msg.random response


  robot.hear /(tits|I approve)/i, (msg) ->
    response = [
      "did someone say tits?",
      "TITS! ",
      "Woohoo!!! ... tits. ",
      "I may be a bot but I do love tits.",
      "@bender: image me boobies",
      "woohoo! tits! animate me boobies",
      "Boobies!",
      ":tits:",
      ":ass:",
      ":eggplant: :fist: :sweat_drops: :open_mouth:"
    ]
    if Math.random() < 0.9
      msg.send msg.random response


  robot.hear /(alright)/i, (msg) ->
    response = [
      "alright3x!",
      "alright, alright, alright!",
      "http://boomtownroi.com/wp-content/uploads/2015/01/All-right-all-right-all-riiiiiight-e1421264150820.jpg",
      "https://media.giphy.com/media/g5zvwUa9720pO/giphy.gif"
    ]
    if Math.random() < 0.5
      msg.send msg.random response


  robot.hear /(wi+oo+h)/i, (msg) ->
    response = [
      "https://images.rapgenius.com/f0a9c81851ac310f1e8a745173b17126.500x373x17.gif",
      "WIOOOH!!!!",
      "https://s-media-cache-ak0.pinimg.com/736x/86/a3/c8/86a3c846b0ecdc82f1c86fb305239ead.jpg",
      "tits."
    ]
    msg.send msg.random response
