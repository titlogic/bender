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
#
# Author:
#  TITLOGIC

Array::shuffle = -> @sort -> 0.5 - Math.random()
module.exports = (robot) ->

  client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID

  # Maping of keyword triggers to imgur subredits:
  termToGaleries = (term) ->
    galleries = if /\b(ass)\b/.test(term)
      ["ass", "butt", 'girlsinyogapants', 'assinthong', 'TightShorts', 'twerking', 'twerk', 'assinthong', 'TightShorts', 'panties', 'panty', 'thong']
    else if /\b(tit|boob)\b/.test(term)
      ["titties", "naturaltitties", "boobgifs", 'boobbounce', 'ToplessInJeans', 'GoneMild', 'OnOff', 'realgirls', 'rule34', 'hugeboobs', 'ToplessInJeans', 'underboob', 'sideboob']
    else if /\b(redhead)\b/.test(term)
      ["redhead", "redheads", 'ginger']
    else if /\b(weed|bud|grass|dank)\b/.test(term)
      ["marijuana", "weed", "420", "trees"]
    else
      []
    return galleries

  image_bomb = (msg, gallery, term, count) ->
    robot.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        if err
          str = "FML. Error: #{err}"
        else
          images = JSON.parse(body).data # Full list of images
          images = images.shuffle() # Randomize
          images = images.slice(0,count) # Limit
          if images && images.length > 0 && gallery
            msg.send "OOh, lets go with: " + gallery
            str = ''
            for image in images
              msg.send image.link
          else
            term = term.replace /bender /, ''
            str = ''
            for i in [1..count]
              msg.send imgur_me(msg, term)

  image_me = (msg, gallery, term) ->
    msg.send "gallery: "+gallery
    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        if err
          str = "FML. Error: #{err}"
        else
          images = JSON.parse(body).data # Full list of images
          images = images.shuffle() # Randomize
          str = images[0].link
        msg.send(str)

  imgur_me = (msg, term) ->
    msg.http('https://api.imgur.com/3/gallery/r/'+term)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        if err
          str = "FML. Error: #{err}"
        else
          images = JSON.parse(body).data # Full list of images
          images = images.shuffle() # Randomize
          str = images[0].link
        msg.send(str)

  cock_bomb = (msg, cock) ->
    cocks = [".", "...", ". ", ".....", "  ", "   ", "", "    ",
      "cock.", "COCK", "Cock. Cock. Cock.", "COOOOCK!", 'COOOOOOCCCCCCCKKKK',
      ':rooster:', ':shirt: :rooster:', ':eggplant:', ':banana:', ':horse: :rooster:', ':snake:', ':chicken:', ':rage1:', ':droplet:', ':crying_cat_face:', ':poop: :rooster:', ':sweat_drops:', ':sweat_smile:', ':sweat:', ':stuck_out_tongue_winking_eye:', ':lollipop:', ':dildo:', ':heavy_exclamation_mark:', ':fried_shrimp: :rooster:', ':open_mouth:', ':fist:', ':fist: :briefcase:',
      'cockadoodledoo', 'c o c k', 'small cock', 'LARGE COCK', '#8@!$', 'meh', 'dick dragon', 'chicago black cocks', 'oyster cocks', 'frozen mixed vegitable cocks', 'cocktastrophy', 'cock-con', 'slum cock', 'posh cock', 'tiananmen square cock', 'flaming cock', 'jew cock', 'orthodox cocks', 'orthodix jews... cocks',
      'the cock awakens', 'return of the cock', 'the cock strikes back!!!!!!', 'the phantom ....   cock', 'attack of the cocks', 'revenge of the cocks', 'a new hope.... for cocks. ', 'cock wars', 'cock 1: a cock story',
      'black cock down', 'random cock', 'famous cock',
      '200: cock OK', '201: cock created', '301: cock moved', '404: cock not found', '406: cock not acceptable', '500: internal cock error', '503: cock unavailable',
      'cockblock'
    ]
    cock_bank = ''
    for n in [1..cock]
      cock_count = Math.random() * cocks.length
      random_cocks = cocks.shuffle()
      cock_bank = cock_bank + ' ' + cocks[0]
    return cock_bank

  # BOMBS! (titty bomb 5)
  robot.hear /\b(.*?)\b bomb( (\d+))?/i, (msg) ->
    term = msg.match[1]
    count = msg.match[3] || 5
    if count > 20
      count = 20
      msg.send 'You greedy bastard. I work for free god damnit.'
      return
    gallery = msg.random(termToGaleries(term))
    if term != 'cock' && term != 'bender cock'
      image_bomb(msg, gallery, term, count)
    else
      msg.send(cock_bomb(msg, count))

  # Single images (bender boob me)
  robot.respond /(.*?) me/i, (msg) ->
    term = msg.match[1]
    gallery = msg.random(termToGaleries(term))
    image_me(msg, gallery, term)
