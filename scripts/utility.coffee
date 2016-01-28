# Description:
#   Some tools that may be useful for other tools.
module.exports = (robot) ->

  robot.hear "what room is this?", (msg) ->
    msg.send msg.message.room
