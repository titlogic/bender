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
      "https://media.giphy.com/media/g5zvwUa9720pO/giphy.gif",
      "https://i.ytimg.com/vi/FiTaK3Fyj0k/hqdefault.jpg",
      "http://i.imgur.com/qGCwdFX.gif",
      "http://i.ebayimg.com/00/s/MjU4WDI1OA==/z/1tcAAOxyY9VRO3zM/$T2eC16JHJGkE9no8gJ!EBRO3zLn-Hw~~60_1.JPG?set_id=8800004005",
      "http://ecx.images-amazon.com/images/I/51GOQV%2BlqtL._SY344_BO1,204,203,200_.jpg",
      "https://s-media-cache-ak0.pinimg.com/236x/62/82/b8/6282b86816003fce4e70d6a2620b7e85.jpg",
      "http://resources1.news.com.au/images/2014/03/06/1226847/119857-8f1b8e56-a4c8-11e3-900e-99186aa12c4d.jpg",
      "http://i.telegraph.co.uk/multimedia/archive/02808/MMsum_2808459b.jpg",
      "http://www.slate.com/content/dam/slate/blogs/browbeat/2014/03/14/alright_alright_alright_is_not_all_right_how_to_spell_matthew_mcconaughey/476470529-matthew-mcconaughey-celebrates-in-the-press-room-after.jpg.CROP.promovar-mediumlarge.jpg",
      "http://media1.popsugar-assets.com/files/2014/11/04/839/n/1922398/c370e9247ac19fd4_thumb_temp_facebook_post_image_file8453151415126499.fbshare.jpg",
      "http://www.vh1.com/news/wp-content/uploads/blog.vh1.com/2015/01/mcconaughey-dazed-feat.jpg",
      "http://25.media.tumblr.com/tumblr_lq4ujbUD841qiv2j8o1_400.gif"

    ]
    msg.send msg.random response


  robot.hear /(wi+oo+h)/i, (msg) ->
    response = [
      "https://images.rapgenius.com/f0a9c81851ac310f1e8a745173b17126.500x373x17.gif",
      "WIOOOH!!!!",
      "https://s-media-cache-ak0.pinimg.com/736x/86/a3/c8/86a3c846b0ecdc82f1c86fb305239ead.jpg",
      "tits."
    ]
    msg.send msg.random response
