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
    galleries = if /\b(ass)\b/.test(term)
      ["ass", "butt", 'girlsinyogapants', 'assinthong', 'TightShorts', 'twerking', 'twerk', 'assinthong', 'TightShorts']
    else if /\b(tit|boob)\b/.test(term)
      ["titties", "naturaltitties", "boobgifs", 'boobbounce', 'ToplessInJeans', 'GoneMild', 'OnOff', 'realgirls', 'rule34', 'hugeboobs', 'ToplessInJeans']
    else if /\b(redhead)\b/.test(term)
      ["redhead", "redheads", 'ginger']
    else if /\b(weed)\b/.test(term)
      ["weed", 'trees', ]
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
          for i in [1..count]
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

  cock_bomb = (msg, cock) ->
    cocks = ["cock.", "COCK", ".", "...", ". ", ".....", "Cock. Cock. Cock.", "COOOOCK!", 'COOOOOOCCCCCCCKKKK', 'cockadoodledoo', 'c o c k', 'small cock', 'LARGE COCK', '#8@!$', 'meh', 'dick dragon', ':dragon:', ':rooster:'
    ]
    for n in [1..cock]
      cock_count = Math.random() * cocks.length
      random_cocks = cocks.shuffle()
      train_of_cocks = cocks[..cock_count].join(' ')
      msg.send train_of_cocks


  # BOMBS! (titty bomb 5)
  robot.hear /\b(.*?)\b bomb( (\d+))?/i, (msg) ->
    term = msg.match[1]
    count = msg.match[3] || 5
    gallery = msg.random(termToGaleries(term))
    if term != 'cock'
      image_bomb(msg, gallery, term, count)
    else
      cock_bomb(msg, count)

  # Single images (bender boob me)
  robot.respond /(.*?) me/i, (msg) ->
    term = msg.match[1]
    gallery = msg.random(termToGaleries(term))
    image_me(msg, gallery, term)

  # Imgur me command
  robot.hear /imgur me (.*)/i, (msg) ->
    term = msg.match[1]
    imgur_me(msg, term)









