# Description:
#   Allows Hubot to roll dice
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot roll (die|one) - Roll one six-sided dice
#   hubot roll dice - Roll two six-sided dice
#   hubot roll <x>d<y> - roll x dice, each of which has y sides
#
# Author:
#   ab9 ... then fuckulated by titlogic.

module.exports = (robot) ->
  robot.hear /^(r|roll) (\d+)d(\d+)/i, (msg) ->
    dice = parseInt msg.match[2]
    sides = parseInt msg.match[3]
    answer = if sides < 1
      "You cant roll a zero-sided die dip shit."
    else if dice > 100
      "I'm not going to roll more than 100 dice for you. I work for free asshole."
    else
      report roll(dice, sides), dice, sides
    msg.send answer

report = (results, dice, sides) ->
  if results?
    switch results.length
      when 0
        "I didn't roll any dice."
      when 1
        "🎲 (#{dice}d#{sides}): rolled a #{results[0]}"
      else
        total = results.reduce (x, y) -> x + y
        finalComma = if (results.length > 2) then "," else ""
        last = results.pop()
        "🎲 (#{dice}d#{sides}): rolled #{results.join(", ")}#{finalComma} and #{last}, making #{total}"

roll = (dice, sides) ->
  rollOne(sides) for i in [0...dice]

rollOne = (sides) ->
  1 + Math.floor(Math.random() * sides)
