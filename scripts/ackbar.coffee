# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   [trap|ackbar] - Display an Admiral Ackbar piece of wonder.
#
#
# Author:
#   brilliantfantastic

ackbars = [
  "http://i.imgur.com/OTByx1b.jpg",
  "http://farm4.static.flickr.com/3572/3637082894_e23313f6fb_o.jpg",
  "http://6.asset.soup.io/asset/0610/8774_242b_500.jpeg",
  "http://files.g4tv.com/ImageDb3/279875_S/steampunk-ackbar.jpg",
  "http://farm6.staticflickr.com/5126/5725607070_b80e61b4b3_z.jpg",
  "http://farm6.static.flickr.com/5291/5542027315_ba79daabfb.jpg",
  "http://farm6.staticflickr.com/5250/5216539895_09f963f448_z.jpg",
  "http://static.fjcdn.com/pictures/Its_2031a3_426435.jpg",
  "http://www.millionaireplayboy.com/mpb/wp-content/uploads/2011/01/1293668358_bottom_trappy.jpeg",
  "http://31.media.tumblr.com/tumblr_lqrrkpAqjf1qiorsyo1_500.jpg",
  "https://i.chzbgr.com/maxW500/4930876416/hB0F640C6/",
  "http://i.qkme.me/356mr9.jpg",
  "http://24.media.tumblr.com/e4255aa10151ebddf57555dfa3fc8779/tumblr_mho9v9y5hE1r8gxxfo1_500.jpg",
  "http://farm2.staticflickr.com/1440/5170210261_fddb4c480c_z.jpg",
  "http://fashionablygeek.com/wp-content/uploads/2010/02/its-a-mouse-trap.jpg?cb5e28",
  "http://31.media.tumblr.com/tumblr_lmn8d1xFXN1qjs7yio1_500.jpg",
  "https://media.giphy.com/media/r35VO5DnOV8ty/giphy.gif",
  "https://i.ytimg.com/vi/iFwk3W7Laxs/maxresdefault.jpg",
  "http://laurasblog.edenreign.net/wp-content/uploads/2014/03/keep-calm-wait-its-a-trap.png",
  "http://www.gameindustry.com/wp-content/uploads/2015/05/it__s_a_trap_by_chrono_strife-d42ac7o.jpg",
  "http://www.tubefilter.com/wp-content/uploads/2015/08/truth-its-a-trap.jpg",
  "http://static.neatorama.com/images/2013-10/Its-A-Trap-l.jpg",
  "http://ia.media-imdb.com/images/M/MV5BMTU2NjYxODk5NV5BMl5BanBnXkFtZTcwMzEyMDg4NA@@._V1_SY317_CR16,0,214,317_AL_.jpg",
  "http://www.rifuture.org/wp-content/uploads/its-a-trap.jpg",
  "http://cdn.meme.am/instances/500x/55206332.jpg",
  "http://pre08.deviantart.net/d8b8/th/pre/f/2012/259/c/5/it__s_a_trap___by_otakun6990-d5eyrth.jpg",
  "http://image.cdn.ispot.tv/ad/AVn0/truth-its-a-trap-song-by-zeds-dead-and-loudpvck-large-6.jpg",
  "http://static.fjcdn.com/pictures/It+s+a+trap_8d7482_5380598.jpg",
  "http://i0.kym-cdn.com/photos/images/facebook/000/032/972/its_a_trap.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/77/95/bd/7795bd093ff992360ebe9c171c9ef4b5.jpg",
  "http://www.mindskin.com/p/654/Evolution+of+Man.jpg+",
  "http://i2.kym-cdn.com/photos/images/facebook/000/218/908/uZPGG.jpg",
  "http://i3.kym-cdn.com/photos/images/newsfeed/000/590/532/908.jpg",
  "http://www.tshirtpusher.com/media/catalog/product/cache/1/image/440x460/c9354b6265fe5f75922567a040b40065/i/t/itsatrap_art_navy.png",
  "http://cdn.meme.am/instances/400x/38541114.jpg",
  "https://download.manycam.com/effects/get?f=l&i=4860&v=1.00",
  "http://cdn.lolzbook.com/wp-content/uploads/2013/04/Its-a-Trap.jpeg",
  "https://c2.staticflickr.com/6/5126/5382206321_1b07d92ce6_b.jpg",
  "http://cdn.iwastesomuchtime.com/February-05-2012-20-09-37-trap.jpg",
  "http://i3.kym-cdn.com/photos/images/newsfeed/000/001/386/Rap_ackbar.jpg",
  "http://sd.keepcalm-o-matic.co.uk/i/keep-calm-and-it-s-a-trap-3.png",
  "http://www.conferencesthatwork.com/wp-content/uploads/2015/10/Its-a-trap.gif",
  "http://dc492.4shared.com/img/vEJQtCWU/s3/trap.gif",
  "http://i1.kym-cdn.com/photos/images/masonry/000/055/441/itsatrip.gif",
  "http://media.giphy.com/media/rNuFu17JzbWaQ/giphy.gif",
  "http://www.threadbombing.com/data/media/59/Trap.gif",
  "http://imgur.com/4snW1zl.gif",
  "http://3.bp.blogspot.com/-hSqvv5OGY8I/UWRpqHek4hI/AAAAAAAAAFQ/qR6dAQQQdRw/s320/tumblr_me947oJJZ01ro8zn7o1_400.gif",
  "http://vignette3.wikia.nocookie.net/wildonesgame/images/5/53/Beartrap.gif/revision/latest?cb=20110804160438"
]

module.exports = (robot) ->
  robot.hear /trap|ackbar|it['’]?s a trap\b/i, (msg) ->
    msg.send msg.random ackbars
