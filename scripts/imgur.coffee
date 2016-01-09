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
#   hubot <keyword> me - Maps <keyword> to list of known kick ass galleries & returns 1 image. Example keywords are: [ass|boob|redhead]
#   <keyword> bomb <n> - Maps <keyword> to list of known kick ass galleries & returns N images. Example keywords are: [ass|tit|redhead]
#   imgur me <query> - Searches imgur for <query> and returns 1 images
#
# Author:
#  MCDIZZLE-MAFK!

Array::shuffle = -> @sort -> 0.5 - Math.random()
module.exports = (robot) ->

  # Maping of keyword triggers to imgur subredits:
  termToGaleries = (term) ->
    galleries = if /weed/.test(term)
      ["weed"]
    else if /ass/.test(term)
      ["ass", "twerk"]
    else if /tit|titty|boob|boobie/.test(term)
      ["titties", "naturaltitties", "boobgifs"]
    else if /redhead/.test(term)
      ["redhead"]
    else if /unicorn/.test(term)
      ["unicorn"]
    return galleries

  # BOMBS! (titty bomb 5)
  robot.hear /(.*?) bomb( (\d+))?/i, (msg) ->
    term = msg.match[1]
    count = msg.match[3] || 5
    client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
    gallery = msg.random(termToGaleries(term))
    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        images = images.slice(0,count) # Limit
        msg.send "Gallery: " + gallery
        if images.length > 0
          msg.send image.link for image in images

  # Single images (bender boob me)
  robot.respond /(.*?) me/i, (msg) ->
    term = msg.match[1]
    msg.send "termz: "+term
    client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
    gallery = msg.random(termToGaleries(term))
    msg.send "gallery: "+gallery
    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        msg.send images[0].link

  # Imgur me command
  robot.hear /imgur me (.*)/i, (msg) ->
    term = msg.match[1]
    client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
    msg.http('https://api.imgur.com/3/gallery/r/'+term)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        msg.send images[0].link









