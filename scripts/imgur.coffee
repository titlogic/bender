# Description:
# Searches imgur.com for a gif
#
# Dependencies:
# None
#
# Configuration:
# Store your imgur.com application client id in an environment
# variable called IMGUR_CLIENT_ID. To get api access, visit
# http://api.imgur.com and register an application.
#

Array::shuffle = -> @sort -> 0.5 - Math.random()

module.exports = (robot) ->



  # # Titty bomb....
  # robot.hear /(tit|titty|boob|boobie) bomb( (\d+))?/i, (msg) ->
  #   count = msg.match[3] || 5
  #   search_terms = [
  #     "titty", "boobs"
  #   ]
  #   client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
  #   msg.http('https://api.imgur.com/3/gallery/search')
  #     .headers(Authorization: client_id)
  #     .query(q: msg.random(search_terms))
  #     .get() (err, res, body) ->
  #       images = JSON.parse(body).data.slice(0,count)
  #       if images.length > 0
  #         msg.send image.link for image in images


  # robot.hear /imgur me (.*))?/i, (msg) ->
  #   count = msg.match[3] || 5
  #   search_terms = [
  #     "titty", "boobs"
  #   ]
  #   client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID
  #   msg.http('https://api.imgur.com/3/gallery/search')
  #     .headers(Authorization: client_id)
  #     .query(q: msg.random(search_terms), perPage: 200)
  #     .get() (err, res, body) ->
  #       images = JSON.parse(body).data # Full list of images
  #       images = images.shuffle() # Randomize
  #       images = images.slice(0,count) # Limit

  #       if images.length > 0
  #         msg.send image.link for image in images


  robot.hear /(.*?) bomb( (\d+))?/i, (msg) ->
    keyword = msg.match[1]
    count = msg.match[3] || 5
    client_id = 'Client-ID ' + process.env.IMGUR_CLIENT_ID

    # Map keyword to list of galleries.
    galleries = if /tit|titty|boob|boobie/.test(keyword)
      ["titties", "naturaltitties", "boobgifs", ""]
    else if /redhead/.test(keyword)
      ["redhead"]
    else if /unicorn/.test(keyword)
      ["unicorn"]

    gallery = msg.random galleries
    # msg.send "Keyword: " + keyword

    msg.http('https://api.imgur.com/3/gallery/r/'+gallery)
      .headers(Authorization: client_id)
      .get() (err, res, body) ->
        images = JSON.parse(body).data # Full list of images
        images = images.shuffle() # Randomize
        images = images.slice(0,count) # Limit
        msg.send "Gallery: " + gallery
        if images.length > 0
          msg.send image.link for image in images
