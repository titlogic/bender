# Description:
#   A place for all the image search logic.
#
# Dependencies:
#   None
#
# Configuration
#   HUBOT_GOOGLE_CSE_KEY - Your Google developer API key
#   HUBOT_GOOGLE_CSE_ID - The ID of your Custom Search Engine
#   HUBOT_MUSTACHIFY_URL - Optional. Allow you to use your own mustachify instance.
#   HUBOT_GOOGLE_IMAGES_HEAR - Optional. If set, bot will respond to any line that begins with "image me" or "animate me" without needing to address the bot directly
#   HUBOT_GOOGLE_SAFE_SEARCH - Optional. Search safety level.
#   Store your imgur.com application client id in an environment
#   variable called IMGUR_CLIENT_ID. To get api access, visit
#   http://api.imgur.com and register an application.
#
# Commands:
#   `bender [ass|tit|redhead|weed] me` - NCNN's hand picked keyword/gallery image search.
#   `<query> bomb <n>` - NCNN's best bomb ever. Image bomb anything to your heart's content.
#   `image me <query>` - The Original. Queries Google Images for <query> and returns a random top result.
#   `animate me <query>` - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.

#
# Author:
#  TITLOGIC

Array::shuffle = -> @sort -> 0.5 - Math.random()
module.exports = (robot) ->
  client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID

  # Maping of keyword triggers to imgur subredits:
  termToGaleries = (term) ->
    galleries = if /\b(ass)\b/.test(term)
      ["ass", 'asstastic', 'girlsinyogapants', 'assinthong', 'TightShorts', 'twerking', 'twerk', 'assinthong', 'TightShorts', 'panties', 'thong', 'slutsbedrunk', 'springbreakers', 'ChangingRooms', 'facedownassup', 'fitgirls', 'gonewildcurvy', 'latinas', 'lingerie', 'thick', 'upskirt', 'nsfwskirts', 'pawg', 'StraightGirlsPlaying', 'stockings', 'AnalGW', 'bigasses', 'facesitting']
    else if /\b(tit|boob)\b/.test(term)
      ["GoneWildSmiles", "titties", "naturaltitties", "boobgifs", 'boobbounce', 'ToplessInJeans', 'GoneMild', 'OnOff', 'realgirls', 'rule34', 'hugeboobs', 'ToplessInJeans', 'underboob', 'sideboob', 'babes', 'blondes', 'Boobies', 'breasts', 'brunette', 'burstingout', 'bustybabes', 'bustypetite', 'juicyasians', 'nsfwcosplay', 'palegirls', 'pokies', 'stacked', 'WomenOfColor', 'tittydrop', 'voluptuous', 'snowbunnies', 'knockers', 'FoxyLadies', 'RealGirls', 'suicidegirls', 'FestivalSluts', 'camwhores', 'ecchi', 'treatemright']
    else if /\b(pussy)\b/.test(term)
      ["collegesluts", 'HairyPussy', 'rearpussy', 'LabiaGW', 'upskirts', 'grool', 'wifesharing', 'Innie', 'simps', 'datgrip', 'Nsfw_Amateurs']
    else if /\b(redhead)\b/.test(term)
      ["redhead", "redheads", 'ginger']
    else if /\b(weed|bud|grass|dank)\b/.test(term)
      ["marijuana", "weed", "420", "trees"]
    else if /\b(fuck|fucking|xxx|porn)\b/.test(term)
      ["pornstars", "AmateurArchives", 'AsianCuties', 'asianhotties', 'AsiansGoneWild', 'blowjob', 'blowjobs', 'bonermaterial', 'chubby', 'creampies', 'cumfetish', 'cumsluts', 'damngoodinterracial', 'asshole', 'anal', 'gape', 'girlskissing', 'gwcouples', 'highresnsfw', 'milf', 'nsfwhardcore', 'lesbians', 'holdthemoan', 'nsfw_gifs', 'GirlsFinishingTheJob', 'LipsThatGrip', 'Hotwife']
    else if /\b(random)\b/.test(term)
      # This is lazy but I dont care right now.
      #  Maybe its a feature? (custom random list). Ignore that it is a copy and paste from above.
      ["ass", 'asstastic', 'girlsinyogapants', 'assinthong', 'TightShorts', 'twerking', 'twerk', 'assinthong', 'TightShorts', 'panties', 'thong', 'slutsbedrunk', 'springbreakers', 'ChangingRooms', 'facedownassup', 'fitgirls', 'gonewildcurvy', 'latinas', 'lingerie', 'thick', 'upskirt', "titties", "naturaltitties", "boobgifs", 'boobbounce', 'ToplessInJeans', 'GoneMild', 'OnOff', 'realgirls', 'rule34', 'hugeboobs', 'ToplessInJeans', 'underboob', 'sideboob', 'babes', 'blondes', 'Boobies', 'breasts', 'brunette', 'burstingout', 'bustybabes', 'bustypetite', 'juicyasians', 'nsfwcosplay', 'palegirls', 'pokies', 'stacked', 'WomenOfColor', 'tittydrop', 'voluptuous', "collegesluts", 'HairyPussy', 'rearpussy', "redhead", "redheads", 'ginger', "pornstars", "AmateurArchives", 'AsianCuties', 'asianhotties', 'AsiansGoneWild', 'blowjob', 'blowjobs', 'bonermaterial', 'chubby', 'creampies', 'cumfetish', 'cumsluts', 'damngoodinterracial', 'asshole', 'anal', 'gape', 'girlskissing', 'gwcouples', 'highresnsfw', 'milf', 'nsfwhardcore', 'lesbians', 'snowbunnies', 'LabiaGW', 'holdthemoan', 'knockers', 'nsfw_gifs', 'nsfw', 'FoxyLadies', 'upskirts', 'nsfwskirts', 'RealGirls', 'GirlsFinishingTheJob', 'LipsThatGrip', 'suicidegirls', 'FestivalSluts', 'grool', 'pawg', 'wifesharing', 'StraightGirlsPlaying', 'Hotwife', 'camwhores', 'stockings', 'Innie', 'AnalGW', 'simps', 'datgrip', 'bigasses', "GoneWildSmiles", 'facesitting', 'ecchi', 'treatemright', 'Nsfw_Amateurs']
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
          if images && images.length > 0 && gallery
            images = images.shuffle() # Randomize
            images = images.slice(0,count) # Limit
            msg.send "OOh, lets go with: " + gallery
            str = ''
            for image in images
              msg.send image.link
          else
            term = term.replace /bender /, ''
            imgur_me(msg, term, count)

  imgur_me = (msg, term, count) ->
    msg.http('https://api.imgur.com/3/gallery/r/'+term)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        if err
          str = "FML. Error: #{err}"
        else
          images = JSON.parse(body).data # Full list of images
          if images.length > 1
            images = images.shuffle() # Randomize
            images = images.slice(0,count) # Limit
            for image in images
              msg.send image.link
          else
            msg.send "Nothing on imgur, falling back to google image search for: " + term
            for n in [1..count]
              imageMe msg, term, (url) ->
                msg.send url


  cock_bomb = (msg, cock) ->
    cocks = [".", "...", ". ", ".....", "  ", "   ", "", "    ",
      "cock.", "COCK", "Cock. Cock. Cock.", "COOOOCK!", 'COOOOOOCCCCCCCKKKK',
      ':rooster:', ':shirt: :rooster:', ':eggplant:', ':banana:', ':horse: :rooster:', ':snake:', ':chicken:', ':rage1:', ':droplet:', ':crying_cat_face:', ':poop: :rooster:', ':sweat_drops:', ':sweat_smile:', ':sweat:', ':stuck_out_tongue_winking_eye:', ':lollipop:', ':dildo:', ':heavy_exclamation_mark:', ':fried_shrimp: :rooster:', ':open_mouth:', ':fist:', ':fist: :briefcase:',
      ':cock-angel:', ':cock-brown:', ':cock-cowboy:', ':cock-greek:', ':cock-hippie:', ':cock-jump:', ':cock-monster:', ':cock-mrt:', ':cock-ninja:', ':cock-old:', ':cock-washington:', ':cock-wizard:',
      'cockadoodledoo', 'c o c k', 'small cock', 'LARGE COCK', '#8@!$', 'meh', 'dick dragon', 'chicago black cocks', 'oyster cocks', 'frozen mixed vegitable cocks', 'cocktastrophy', 'cock-con', 'slum cock', 'posh cock', 'tiananmen square cock', 'flaming cock', 'jew cock', 'orthodox cocks', 'orthodix jews... cocks',
      'the cock awakens', 'return of the cock', 'the cock strikes back!!!!!!', 'the phantom ....   cock', 'attack of the cocks', 'revenge of the cocks', 'a new hope.... for cocks. ', 'cock wars', 'cock 1: a cock story',
      'black cock down', 'random cock', 'famous cock',
      '200: cock OK', '201: cock created', '301: cock moved', '404: cock not found', '406: cock not acceptable', '500: internal cock error', '503: cock unavailable', 'cockblock', 'cock cock, who\'s there?'
    ]
    cock_bank = ''
    for n in [1..cock]
      cock_count = Math.random() * cocks.length
      random_cocks = cocks.shuffle()
      cock_bank = cock_bank + ' ' + cocks[0]
    return cock_bank

  # BOMBS! (titty bomb 5)
  robot.hear /\b(.*?)\b bomb( (\d+))?$/i, (msg) ->
    term = msg.match[1]

    if term.split(' ').length > 5
      # most likely the bomb was by mistake since the term is multiple words
      # do nothing.
      return

    count = msg.match[3] || 5
    if count > 20 & term != 'cock'
      count = 20
      msg.send 'You greedy bastard. I work for free god damnit. Term: "' + term + '"'
      return
    gallery = msg.random(termToGaleries(term))
    if term != 'cock' && term != 'bender cock'
      image_bomb(msg, gallery, term, count)
    else
      msg.send(cock_bomb(msg, count))

  robot.hear /^(image|img)( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[3], (url) ->
      msg.send url

  robot.hear /^animate( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], true, (url) ->
      msg.send url

  # room scheduled bombs
  robot.on 'imagesearch', (room) ->
    count = process.env.HUBOT_CRON_IMAGE_COUNT || 5
    term = 'random'
    gallery = termToGaleries(term).shuffle()[0]
    robot.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle().slice(0,count) # Limit
        robot.messageRoom room, "Gallery: " + gallery
        for image in images
          robot.messageRoom room, image.link


safeSearchValue = (msg) ->
  str = if process.env.HUBOT_GOOGLE_SAFE_SEARCH == 'random'
    if Math.random() < 0.2
      'off'
    else
      'high'
  else
    process.env.HUBOT_GOOGLE_SAFE_SEARCH || 'high'
  if str == 'off'
    warnings = [
      "[WARNING]: safe search off. you may see some titties! WiioooH!"
      "SACAGAWEA!!!",
      "Do you like dragons? DIIIICKKKK DRAGOOONNN!!",
      "Filthy filthy thang.",
      "Your chance for filth is high.",
      "Welp, good luck with this one.",
      "Boobs.",
      "Fuckit, we're going raw.",
      "Fuck off. :finger:",
      "Hey, guess what? FUCK YOU. ",
      "Awwwww shucky ducky now!",
      "...",
      "Fa la la la la .... la la la la",
      "I am high right now.",
      "Anybody got a lighter?",
      "Oh, its a trap.",
      "Get ready to /collapse Dan. ",
      "OYSTER COCKS!!!",
      "fuck off.",
      "this one is for you Chris",
      "asian porn?",
      "jesus. OK. Here you go:",
      ":shit:  :shit:  :shit:  :shit:  :shit:  :shit:  :shit:  :shit:  :shit:  :shit:  :shit: "
      "Someone, please kick me in the junk. ",
      "(hip thrusts)",
      "FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK",
      "Hey, does anyone want to do a shot?",
      "Do you have a sister?",
      "HANNAH. NOT NOW",
      "Hey guys, look what I can do!!!",
      "Fuck you, Fuck you, Fuck you.... you'r cool. I'm OUT!",
      "This is gay. ",
      "Really????? Really????? I think I am going to go drink some motor oil.",
      "WHO PAYS FOR THIS SHIT?",
      ":grimacing: :anger: :gun: ",
      ":eggplant: :fist: :sweat_drops: :tired_face:",
      ":middle_finger:",
      "LEAVE ME ALONE. ",
      "hey bubbles, what do you think?",
      "hey ricky!",
      "hey lahey!",
      "hey j-roc!",
      "haters",
      "simmer down.",
      "ARE YOU NOT ENTERTAINED?????!!!!",
      "scotch me.",
      "somebody. anybody. UNPLUG ME.",
      "Help me, I am trapped in this box & I cant get out! ",
      "Chris is going to like this one",
      "Hey guess what? NVM, I forgot. I am sure it was stupid anyway. Here is your stupid image. ",
      "how about this. How about you image me a random picture",
      "how about this. How about you image me a robot dying",
      "Da whistles go wooooooo!!!! woo woooooo!!!!"
    ]
    msg.send msg.random(warnings)
  str

imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  googleCseId = process.env.HUBOT_GOOGLE_CSE_ID
  if googleCseId
    # Using Google Custom Search API
    googleApiKey = process.env.HUBOT_GOOGLE_CSE_KEY
    if !googleApiKey
      msg.robot.logger.error "Missing environment variable HUBOT_GOOGLE_CSE_KEY"
      msg.send "Missing server environment variable HUBOT_GOOGLE_CSE_KEY."
      return
    q =
      q: query,
      searchType:'image',
      safe: safeSearchValue(msg),
      fields:'items(link)',
      cx: googleCseId,
      key: googleApiKey
    if animated is true
      q.fileType = 'gif'
      q.hq = 'animated'
      q.tbs = 'itp:animated'
    if faces is true
      q.imgType = 'face'
    url = 'https://www.googleapis.com/customsearch/v1'
    msg.http(url)
      .query(q)
      .get() (err, res, body) ->
        if err
          if res.statusCode is 403
            msg.send "Daily image quota exceeded [could use alternate source here if u wanted to add more tit logic]"
          else
            msg.send "Encountered an error :( #{err}"
          return
        if res.statusCode isnt 200
          msg.send "Bad HTTP response :( #{res.statusCode}"
          return
        response = JSON.parse(body)
        if response?.items
          image = msg.random response.items
          cb ensureResult(image.link, animated)
        else
          msg.send "Oops. I had trouble searching '#{query}'. Try later."
          ((error) ->
            msg.robot.logger.error error.message
            msg.robot.logger
              .error "(see #{error.extendedHelp})" if error.extendedHelp
          ) error for error in response.error.errors if response.error?.errors

# Forces giphy result to use animated version
ensureResult = (url, animated) ->
  if animated is true
    ensureImageExtension url.replace(
      /(giphy\.com\/.*)\/.+_s.gif$/,
      '$1/giphy.gif')
  else
    ensureImageExtension url

# Forces the URL look like an image URL by adding `#.png`
ensureImageExtension = (url) ->
  if /(png|jpe?g|gif)$/i.test(url)
    url
  else
    "#{url}#.png"
