# Description:
#   Dumping ground for random homemade dscripts
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   `hey bender` - See what bender has to say to you...
#   `[tits|boobs]` - A lazy boob response.
#   `[alright]` - A lazy McConaughey response.
#   `[whistles|whistlers|wh*?i+oo+h|woo+ woo+]` - A lazy Bubb Rubb!
#   `[chris|dan|hannah|shannon]` - A lazy quote from one of the mentioned MAFKs.
#
# Notes:
#   None
#
# Author:
#   TITLOGIC
module.exports = (robot) ->

  # HEY BENDER
  robot.hear /bender/i, (msg) ->
    response = [
      "bite my shiny metal ass",
      "*fap* *fap* *fap* *fap* ...",
      "WHAT? ",
      "not now, busy.",
      "bender is not here right now. ",
      "bender is not man.",
      "http://www.citizenbrooklyn.com/wp-content/uploads/2012/08/robots-sex-web.jpg",
      "http://www.returnofkings.com/wp-content/uploads/2014/08/Sexy-Robot.jpg",
      "http://cdn.thedailybeast.com/content/dailybeast/articles/2014/05/07/poll-finds-1-in-5-people-would-have-sex-with-a-robot/jcr:content/image.img.2000.jpg/1399455944991.cached.jpg",
      "http://bbsimg.ngfiles.com/1/19839000/ngbbs4a8a58422c8c8.jpg",
      "This is the worst kind of discrimination there is: the kind against me!",
      "You know what cheers me up? Other people’s misfortune.",
      "Anything less than immortality is a complete waste of time.",
      "Blackmail is such an ugly word. I prefer extortion. The ‘x’ makes it sound cool.",
      "Have you tried turning off the TV, sitting down with your children, and hitting them?",
      "Fry cracked corn and I don’t care/Leela cracked corn I still don’t care/Bender cracked corn and he is great/ Take that you stupid corn!",
      "Oh, your God!",
      "You’re a pimple on society’s ass and you’ll never amount to anything!",
      "Shut up baby, I know it!",
      "I’m so embarrassed. I wish everyone else was dead!",
      "I got ants my butt, and I needs to strut!",
      "I guess if you want children beaten, you have to do it yourself.",
      "Afterlife? If I thought I had to live another life, I’d kill myself right now!",
      "Hahahahaha. Oh wait you’re serious. Let me laugh even harder.",
      "There. Now no one can say I don’t own John Larroquette’s spine.",
      "I’ll build by own theme park. With black jack, and hookers. In fact, forget the park!",
      "The game’s over. I have all the money. Compare your lives to mine and then kill yourselves!",
      "That’s closest thing to ‘Bender is great’ that anyone other me has ever said.",
      "I’m Bender, baby! Oh god, please insert liquor!",
      "Hey sexy mama, wanna kill all humans?",
      "That is one crazy, uncircumcised man.",
      "It's not just safe it's 40% safe!",
      "Ooo, hefty. You could really bash in a skull with this thing.",
      "No robot cow should have to be milked by a milking machine! And no milking machine should have to milk a robot cow!",
      "No.",
      "Well, life goes on... 'CEPT FOR YOU! Hahahahahaaa!",
      "Sayin' B-E-N DDDDDEEEERRRRRR!",
      "Hey, do I preach to you when you're lying stoned in the gutter? No! So beat it!",
      "Bite my colossal metal ass!",
      "Only one way to find out...",
      "BITE MY SHINY DAFFODIL ASS!",
      "Shut Up Baby I Know It!",
      "http://i.kinja-img.com/gawker-media/image/upload/s--Xo3q-3w8--/18x4trzgxw960gif.gif",
    ]
    msg.send msg.random response


  # Lazy Boobs
  robot.hear /(tits|boobs)/i, (msg) ->
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
    if Math.random() < 0.2
      msg.send msg.random response

  # Dave Chapelle
  robot.hear /(dave|chapelle|chappelle|nigga|nigger|black|negro|tyrone|crack|doo doo|chocolate|chronic|stressed|rick james)/i, (msg) ->
    response = [
      "I'm rich, bitch!",
      "Fuck yo couch, nigga!",
      "I'm Rick James, Bitch!",
      "Its doo doo, baby!",
      "Peanut Butter and Crack sandwich. ",
      "Did someone say crack?",
      "Shazam!",
      "Whitney Died!!?! Bitch had my crack pipe.",
      "Now, Darkness, the tables are turned.",
      "Drugs is all around you kids. Look at that magic marker cap. What the hell you think that is, some kind of crayon? Take it off and sniff it and get high.",
      "Remember what the Bible says: He who is without sin, cast the first rock. And I shall smoketh it.",
      "Night. Night. Keep yo butthole tight.",
      "...and that, kids, was the first time I sucked a dick for crack.",
      "Come on, what am I gonna do? Just all of a sudden jump up and grind my feet on somebody's couch like it's something to do? Come on. I got a little more sense then that........ Yeah, I remember grinding my feet on Eddie's couch.",
      "Bitches! Come over here and show Charlie Murphy yo titties!",
      "I'm Dave Chappelle, and I like internet porn.",
      "...  he would step across the line. Habitually. He's a habitual line stepper.",
      "You tha' goddamn devil.",
      "Because of my complexion, he use to call me Darkness. ",
      "Be careful if you ever get a sleeper hold. The next day your anus will really hurt.",
      "I'm standing there I'm thinking, 'This nigga really has lost his fucking mind.'",
      "DARKNESS, EVERYONE, DARKNESS!",
      "That's one hundred percent Cambodian, dawg.",
      "I hate you. I hate you. I don't even know you, and I hate your guts. I hope all the bad things in life happen to you and nobody else but you.",
      "Hey hey hey hey. Smoke weed every day.",
      "Sir! I'm going to make this clear. I'm in no way, shape or form involved in any kind of niggerdom.",
      "Africa.",
      "[hands full of money] Crack, here I come!",
      "Cocaine's a hell of a drug."
      "You know you must be doing something right if old people like you.",
      "I'm Dave Chappelle and I'm a chronic masturbator.",
    ]
    if Math.random() < 0.3
      msg.send "> :dave:  " + msg.random response


  # Lazy McConaughey
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
      "http://25.media.tumblr.com/tumblr_lq4ujbUD841qiv2j8o1_400.gif",
      "Let me tell you what Melba Toast is packin' right here, all right. We got 4:11 Positrac outback, 750 double pumper, Edelbrock intake, bored over 30, 11 to 1 pop-up pistons, turbo-jet 390 horsepower. We're talkin' some fuckin' muscle. ",
      "All right, all right, all right. ",
      "Well, you win some you lose some. ",
      "You ought to ditch the two geeks you're in the car with now and get in with us. But that's all right, we'll worry about that later. I will see you there. All right? ",
      "Man, it's the same bullshit they tried to pull in my day. If it ain't that piece of paper, there's some other choice they're gonna try and make for you. You gotta do what Randall Pink Floyd wants to do man. Let me tell you this, the older you do get the more rules they're gonna try to get you to follow. You just gotta keep livin' man, L-I-V-I-N. ",
      "Say, man, you got a joint? ",
      "That's what I love about these high school girls, man. I get older, they stay the same age. ",
      "I love those redheads! "
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Action Bronson
  robot.hear /(OG|bam bam|smoke|ancient aliens|aliens|oil|dab|action|bronson|santa|viceland|weed|dinosaurs|history)/i, (msg) ->
    bronsons = [
      ":action-bronson:",
      ":action-bronson-2:",
      ":action-bronson-3:"
    ]
    response = [
      "Dinosaurs. One of the most majestic creatures to ever roam the face of this planet.",
      "I may be the only person to smoke oil on cable tv.",
      "This is the beginning of a new time man.",
      "We got big body beluga in tha house.",
      "The Stars. They say that is where life started. In that area.",
      "Ohhhh that's stupid. So dumb.",
      "I'm very acrobatic I could do a round-house.",
      "I could do a round-house.",
      "This type of shit doesn't just fuckin blow your mind man? My mind is blown.",
      "I'm rap's vigilante. I'm out for justice.",
      "http://www.allthingsgomusic.com/wp-content/uploads/2016/04/action-bronson-gq-1.jpg",
      "http://www.billboard.com/files/styles/article_main_image/public/media/action-bronson-2015-jeremy-liebman-billboard-650.jpg",
      "https://zumic.com/wp-content/uploads/2013/10/action-bronson-xxl-freshman-profile-2013.jpg",
      "I used to run a food ring in fat camp.",
      "It's called Hardcore OG and it gets me really nice.",
      "You don't fuck with America like that right?",
      "Whoo, whooo, KaKaaa! SKoooWEE!",
      "I've been high since I was this big :baby:. I've been high since I was this big :baby:  ... yeah. Stupid. ",
      "Fuck, thats delicious",
      "I think I need a ricola.",
      "Opportunity be knocking, you gotta let a motha-fucka in.",
      "Why you think I'm out here actin' crazy?",
      "I feel so alive... I think I just stit myself.",
      "You aint gotta worry about a 'ting, I got it covered...",
      "I heard your bitch still wears 'echo'.",
      "You need to speek clearer dear, because I can't hear ya.",
      "Why u gotta act like a bitch... when I'm with youuuuu",
    ]
    if Math.random() < 0.2
      msg.send "> " + msg.random(bronsons) + "  " + msg.random(response)


  # Lazy Bubb Rubb whistles
  robot.hear /(whistles|whistlers|wh*?i+oo+h|woo+ woo+|woo+)/i, (msg) ->
    response = [
      "its dat woo wooooo",
      "https://soundcloud.com/vibesquad/the-whistles",
      "http://i.imgur.com/KeepBS0.jpg",
      "http://24.media.tumblr.com/tumblr_lx31kykJQX1r2tufko1_400.jpg",
      "http://www.f150online.com/galleries/images/1910-3152-50803.jpg",
      "http://i3.ytimg.com/vi/jpl_ey5cVnk/hqdefault.jpg",
      "http://sd.keepcalm-o-matic.co.uk/i/the-whistles-go-woo-woo.png",
      "http://image.spreadshirtmedia.com/image-server/v1/compositions/110660710/views/1,width=280,height=280,appearanceId=22,version=1440417743.png/the-whistles-go-woo-woooo_design.png",
      "http://i3.ytimg.com/vi/R__2Zyqaweg/mqdefault.jpg",
      "http://img23.photobucket.com/albums/v70/l3lizz4rd/missilesgowoowoo.jpg",
      "http://www.black-ogre.com/blackogreonline/wp-content/uploads/2012/02/Whistle-Tips-They-Were-Being-Installed.jpg",
      "http://www.angelfire.com/planet/whistletip/images/bubrubb4.jpg",
      "WIOOOH!!!!",
      "tits."
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Chris quotes
  robot.hear /chris|saylor/i, (msg) ->
    response = [
      "get off the shitter!",
      "asian porn.",
      "hellllooooo kitty",
      "Rule 34.",
      "If it exists then there is porn on it",
      "what do you do with a drunken saylor",
      "how do you know that’s not cum?",
      "thats better than a boner",
      "like a moist pussy",
      "you’re assuming she doesn’t enjoy it",
      "if you had LSD, I would say yes",
      "I dont want that near my penis.",
      "I read that as 'jack off into your coffee'",
      "fuck your slashes",
      "Red Dragon"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Shannon quotes
  robot.hear /(shannon|shenanigan|shannonymous|mcpherson|shan)/i, (msg) ->
    response = [
      "Have you ever stared at your balls and watched them move?",
      "Ya'll like dragons?",
      "Fully got a noner right now.",
      "*thrust* *thrust* *thrust*",
      "*fap* *fap* *fap*",
      "fucking train.",
      "quatro muchacho.",
      "You know how many BP&J sandwiches that would cost?",
      "DGAF.",
      "Fuckit.",
      "Cock."
      "Sploooooosh!",
      "I FUCKING WIN!",
      ":basketball: :football: :rugby_football: ---> :cat2: = :rooster:",
      "cock bomb",
      "tits",
      "I regret nothing!!!!!!",
      "LOL. white people.",
      "If u look very hard u can see his cock fling out.",
      "there could totally be some sour’d cum in this and I would never know.",
      "she spit in my face and pushed me to the ground and walked away. what a country!",
      "trying to re-fuckulate",
      "fully torqued",
      "Do you like dragons?",
      "dan fashion",
      "shirt cock!",
      "Richard Draggen!",
      "awwooooooooooo!!!!",
      "god damned man child.",
      "Ladies and gentlemen, a father of three.",
      "I am a broken man right now.",
      "I stole andrew's jacket.",
      "biting my lip right now.",
      "I have a fridge full of dry kraut cause I drank all the juice.",
      "Gonna go grab a beer - time to get my rat gun loaded, with my eye protection on - one in 20 times its fucking on like donkey kong."
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Hannah quotes
  robot.hear /(hannah|hannimal)/i, (msg) ->
    response = [
      "'91!?!?!?!?!",
      "dick poles.",
      "snap & clap yo shit.",
      "DAS IT!",
      "my shit's rigorous.",
      "bitch, why you mad?? huuuh huuwah!",
      "my pussy pops and yours dont.",
      "severly.",
      "bitch, huhhhh huh!",
      "your pussy is mine, bitch!",
      "suck my non-existent dick.",
      "bitch please",
      "would ya look at dat?",
      "shut your dick holster",
      "once my hangover is gone",
      "i hit my friend with a keyboard.",
      "ANIMATE ME WHAT WHAT IN THE BUTT",
      "THAT TRIANGLE FACE NIGGA LOOKS HIGH AS SHIT",
      "im drunk",
      "#hangry",
      "DAD DICK",
      "i seriously hate you guys",
      "I JUST CLICKED ON DAT ASS. GODDAMNIT.",
      "unce unce unce unce unce unce",
      "animate me boner deflation",
      "CANT TOUCH DIS NAHANAHNAHANAHANA NAH NAH NAH",
      "WHAT IS THIS NOISE",
      "hannimal....",
      "Hannah Montana!",
      "there it is again, a god damned palindrome.",
      "TIT SLAP!"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Dan quotes
  robot.hear /(dan|toillion|amsterdam|weed|vacation)/i, (msg) ->
    response = [
      "Motherfucking Night Court.",
      "Pewwwwwwdipie!!!!!",
      "hustle trees",
      "not now, he is broken.",
      "SHUT THE FUCK UP DAN.",
      "You killed my fava, prepare to die.",
      "She's got fava issues",
      "Don't threaten me with a good time!",
      "together we form..... DANNIMAL!!!!",
      "I've been high since I was 17.",
      "Am i right????!?!?",
      "What's up bros!?!?",
      "I ain't got em!",
      "Dan fashion.",
      "Your best case scenario you come out unscathed.",
      "We aint flippin burgers in here",
      "What are you, hourly?",
      "Phrasing!!",
      "Have a crazy-off",
      "What a country",
      "Hey whatever floats yer boat",
      "Tinnitus YANA!",
      "Hey remember when Lubby broke that table?",
      "I'm jeetin hard right now."
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Body quotes
  robot.hear /(body|taing)/i, (msg) ->
    response = [
      "natasha's starting to get cellulose thighs",
      "anybody wanna vape?",
      "all I wanna do is suck on some mackerel.",
      "Sounds like a STD.",
      "omg - i puked in my mouth a little",
      "i'm going to put money down that it's retarded or has downs",
      "it totally looks like it has down syndrome",
      "spit in my mouth",
      "Im'a cut you",
      "did you look up meatspin?",
      "OH GOD NO JUST NO",
      "all dicks all the time",
      "dickmatized",
      "haha, you were dickmatized",
      "30 round fully semi-automatic shotgun",
      "... the one where the dude swallows the flying dildo shaped object",
      "SFW, but still boner worthy",
      "i want to choke you and spit in your mouth",
      "I wonder if someone will make a Preggr app. horny pregnant women looking to get plowed",
      "almost as good as japanese girls puking in each other's mouths",
      "1000% for darkies",
      "hipster.",
      "a god damned PR nightmare",
      "Kim Khardasian.",
      "Dont bother me right now, watching vape porn",
      "... inventing a tinder for cripples",
      "... inventing a tinder for preggos"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Alex quotes
  robot.hear /(Alex|blau)/i, (msg) ->
    response = [
      "Ugh, gross. ",
      "oh, nice! except I haven’t used a windows machine since 1995.",
      "I think tienanmen square cock is my favorite.",
      "is it wrong that in my mind I keep thinking of 'Fairy Dong' as 'Ghost penis'?",
      "cock bomb infinity",
      "Consider my pants soiled.",
      "Wheeeeeeeee!",
      "BLAUZER!",
      "Father blau"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Raf quotes
  robot.hear /(raffy|command3r)/i, (msg) ->
    response = [
      "pisco so good..... not",
      "YOU SHOULD BE WORRIED WE ARE IN A WORLD PERIOD",
      "SNAPCHAT, where your mistakes won’t live forever",
      "I want to be the mother of dragons too",
      "the dox pirate",
      "He's a giver.",
      "riff-raff"

    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Nick quotes
  robot.hear /(nick|zontos)/i, (msg) ->
    response = [
      "(Nods head wisely)",
      "Hide yo wife hide yo kids!!",
      "Some things you just don't come back from...",
      "Gh0sT m0dE"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Jake quotes
  robot.hear /(jake|konoske)/i, (msg) ->
    response = [
      "fun is over.",
      "GOD DAMNIT KONOSKE!!",
      "Snowden agrees.",
      "Charlie Bucket!",
      "Jake is IN THE ZONEEEEEE",
      "AutoZONE!",
      "He's in the zone.... the auto zonnneeeeaaa!",
      "KRONOS",
      "You think your nickname is bad? Body nicknamed me jackoff.",
      "If you named me like Rodger then I would be Jaksky"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # That is awesome
  robot.hear /(shucky|ducky|herman|cain|great|awesome)/i, (msg) ->
    response = [
      ":shucky-ducky-now: AWWWWW Shucky Ducky Now Ya'll!! :shucky-ducky-now:"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  # Ya Big Dummy
  robot.hear /(dumb|stupid|idiot)/i, (msg) ->
    response = [
      "You. Stupid. DUMMY!",
      "Ya idiot!",
      "YA IDGIT!!",
      "Booooy you so dumb.",
      "You little idiot!!"
    ]
    if Math.random() < 0.2
      msg.send msg.random response

  robot.hear /(horse|BoJack)/i, (msg) ->
    response = [
      "He tore my treeshouse down when I was at summer camp becuse instead of using christian nails I used screws, which he called Jew nails."
    ]
    if Math.random() < 0.5
      msg.send msg.random response



  # robot.listen(
  #   (message) ->
  #     # match = message.match(/^[A-Z,!@#$%^&*()_+-=\?\/\s]+$/)
  #     if message.match(/^[A-Z,!@#$%^&*()_+-=\?\/\s]+$/)
  #       true
  #     else
  #       false
  #   (response) ->
  #     response.reply "U'RE DRUNK HANNAH!"
  # )

