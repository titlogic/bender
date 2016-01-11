# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   Store your imgur.com application client id in an environment
#   variable called IMGUR_CLIENT_ID. To get api access, visit
#   http://api.imgur.com and register an application.
#
# Commands:
#   `bender [ass|tit|redhead|weed] me` - NCNN's hand picked keyword/gallery image search.
#   `<query> bomb <n>` - NCNN's best bomb ever. Image bomb anything to your heart's content.
#   `imgur me <query>` - NCNN's imgur search.
#
# Author:
#  MCDIZZLE-MAFK!

Array::shuffle = -> @sort -> 0.5 - Math.random()
module.exports = (robot) ->

  client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID

  # Maping of keyword triggers to imgur subredits:
  termToGaleries = (term) ->
    galleries = if /\b(weed)\b/.test(term)
      ["weed", 'trees', ]
    else if /\b(ass|butt)\b/.test(term)
      ["ass", "butt", 'girlsinyogapants', 'assinthong', 'TightShorts']
    else if /\b(tit|titty|boob|boobie)\b/.test(term)
      ["titties", "naturaltitties", "boobgifs", 'boobbounce', 'ToplessInJeans']
    else if /\btwerk\b/.test(term)
      ['twerking', 'twerk', ]
    else if /\b(redhead)\b/.test(term)
      ["redhead", "redheads"]
    else if /\b(weed|bud)\b/.test(term)
      ["marijuana|weed|420"]
    else
      []
    return galleries

  image_bomb = (msg, gallery, term, count) ->
    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        images = images.slice(0,count) # Limit
        if images && images.length > 0 && gallery
          msg.send "Hand picked gallery: " + gallery
          msg.send image.link for image in images
        else
          term = term.replace /bender /, ''
          for i in [0..count]
            imgur_me(msg, term)

  image_me = (msg, gallery, term) ->
    msg.send "gallery: "+gallery
    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        msg.send images[0].link

  imgur_me = (msg, term) ->
    msg.http('https://api.imgur.com/3/gallery/r/'+term)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        msg.send images[0].link

  # BOMBS! (titty bomb 5)
  robot.hear /\b(.*?)\b bomb( (\d+))?/i, (msg) ->
    term = msg.match[1]
    count = msg.match[3] || 5
    gallery = msg.random(termToGaleries(term))
    image_bomb(msg, gallery, term, count)

  # Single images (bender boob me)
  robot.respond /(.*?) me/i, (msg) ->
    term = msg.match[1]
    gallery = msg.random(termToGaleries(term))
    image_me(msg, gallery, term)

  # Imgur me command
  robot.hear /imgur me (.*)/i, (msg) ->
    term = msg.match[1]
    imgur_me(msg, term)









