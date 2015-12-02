# Description:
#   A way to interact with the Google Images API.
#
# Configuration
#   HUBOT_GOOGLE_CSE_KEY - Your Google developer API key
#   HUBOT_GOOGLE_CSE_ID - The ID of your Custom Search Engine
#   HUBOT_MUSTACHIFY_URL - Optional. Allow you to use your own mustachify instance.
#   HUBOT_GOOGLE_IMAGES_HEAR - Optional. If set, bot will respond to any line that begins with "image me" or "animate me" without needing to address the bot directly
#   HUBOT_GOOGLE_SAFE_SEARCH - Optional. Search safety level.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.

module.exports = (robot) ->

  robot.hear /(image|img)( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[3], (url) ->
      msg.send url

  robot.hear /animate( me)? (.*)/i, (msg) ->
    imageMe msg, msg.match[2], true, (url) ->
      msg.send url

  # pro feature, not added to docs since you can't conditionally document commands
  if process.env.HUBOT_GOOGLE_IMAGES_HEAR?
    robot.hear /^(image|img) me (.*)/i, (msg) ->
      imageMe msg, msg.match[1], (url) ->
        msg.send url

    robot.hear /^animate me (.*)/i, (msg) ->
      imageMe msg, msg.match[1], true, (url) ->
        msg.send url

  robot.respond /(?:mo?u)?sta(?:s|c)h(?:e|ify)?(?: me)? (.*)/i, (msg) ->
    mustacheBaseUrl =
      process.env.HUBOT_MUSTACHIFY_URL?.replace(/\/$/, '') or
      "http://mustachify.me"
    mustachify = "#{mustacheBaseUrl}/rand?src="
    imagery = msg.match[1]

    if imagery.match /^https?:\/\//i
      encodedUrl = encodeURIComponent imagery
      msg.send "#{mustachify}#{encodedUrl}"
    else
      imageMe msg, imagery, false, true, (url) ->
        encodedUrl = encodeURIComponent url
        msg.send "#{mustachify}#{encodedUrl}"

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
      "Yout chance for filth is high.",
      "Welp, good luck with this one.",
      "Boobs.",
      "Fuckit, we're going raw.",
      "Fuck off. :finger:",
      "Hey, guess what? FUCK YOU. ",
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
