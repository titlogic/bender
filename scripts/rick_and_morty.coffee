# Description:
#   Quotes by Rick and Morty
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   `hey [rick|morty]` - Display a random TPB quote.
#
# Notes:
#   None
#
# Author:
#   TITLOGIC

rick_sanchez = [
  "All right, all right, cool it! ",
  "... you have to understand that as far as Grandpa's concerned, you're both pieces of shit! Yeah. I can prove it. mathematically",
  "What about the reality where Hitler cured cancer, Morty?",
  "Weddings are basically funerals with cake.",
  "Glip Glop? It's like the N word and the C word had a baby and it was raised by all the bad words for Jews... WHAT UP MY GLIP GLOPS!!!",
  "You're young, you have your whole life ahead of you, and your anal cavity is still taut yet malleable. ",
  "That's planning for failure.... even dumber than regular planning. ",
  "Nobody exists on purpose. Nobody belongs anywhere. Everybody’s gonna die. Come watch TV?",
  "Sometimes science is a lot more art than science. A lot of people don't get that.",
  "Wubba lubba dub dub!",
  "I'm gonna need em waaaaaaaay up inside your butthole. ",
  "Lick lick lick my balls! Ahahahah Yaeh. ",
  "Yeah, well, scientifically, traditions are an idiot thing.",
  "Get your shit together! Get it all together, and put it in your backpack. take it to the store and sell it or put it in the shit museum. I dont care what u do just gotta get it together! ",
  "I'm gonna need you to take your opinion and shove it waayyyyyyyy up inside your butthole. ",
  "There is no god summer, gotta rip that bandaid off right now.",
  "gee morty if you twist the words around enough you can make anything sound bad",
  "That’s just slavery with extra steps",
  "I call it, a floogle crank",
  "I made a bomb. I'm gonna drop the bomb. We'll get a nice fresh start.",
  "This was a wonderful breakfast Beth. You really made the crap out of those eggs. I wish your mother was here to eat them.",
  "*burrrp*",
  "I ... *burrrp* ",
  "*burrrp* ... *buuurrp*",
  "You have to do it for grandpa Morty. You gotta put these seeds up your butt. Come on Morty.",
  "Did u get those seeds up your butt?",
  "Its gonna be great Marty *buuurp* all kinds of Science.",
  "The flarp zone is for flaping and unflarping only. ",
  "Good thinking! The student becomes the teacher.",
  "I gotta get you outta here, u gotta get those seeds outta your ass.",
  "I'm completely aware of how legal it is, Morty.",
  "You can't unpoop that turd, Morty",
  "That was dark man. Real dark.",
  "This is bad, Morty. This is real bad.",
  "We've gotta go now and never look back! We'll start a new life!",
]

morty_smith = [
  "You are a monster! You are like Hitler, only Hitler cared about Germany or something.",
  "It just feels a little on the nose, you know? I dunno, just forget it.",
  "Aw, come on. I didnt mean anything!",
  "I thought you said this was on the up and up!",
  "I do just fine, not that it's any of your business, Okay?!",
  "You know, he didn't seem like a bad guy, Rick.",
  "I dunno Rick, this all feels a little off, you know?",
  "I dont like where this is going...",
  "Aw Geez! W-W-What's happening?",
]

jerry_smith = [
  "Since we are fighting, if you ever have an affair with that guy I will come to the hotel   room and blow my brains out all over your naked bodies.",
  "My children are upsairs! Just let me live!",
  "This is too much, will you make it stop??!,
   :rick_sanchez: I'll think about it Jerry. I'll think about it.
  ",
]

module.exports = (robot) ->

  # Luck triggers
  robot.hear /(rick|existence|science|scientist|future|travel|burp|alcohol|jew)/i, (msg) ->
    if Math.random() < 0.1
      msg.send "> :rick-sanchez: " + msg.random rick_sanchez

  robot.hear /(morty|smith)/i, (msg) ->
    if Math.random() < 0.1
      msg.send "> :morty-smith: " + msg.random morty_smith

  robot.hear /(jerry|smith)/i, (msg) ->
    if Math.random() < 0.1
      msg.send "> :jerry-smith: " + msg.random jerry_smith

