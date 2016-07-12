# Description:
#   Some tools that may be useful for other tools.
module.exports = (robot) ->

  robot.hear "what room is this?", (msg) ->
    msg.send msg.message.room

  robot.hear "what is my name?", (msg) ->
    msg.send msg.message.user.name + ", #" + msg.message.user.id


  # robot.listen(
  #   (message) ->
  #     # condition
  #     # message.user.name is "Steve" and Math.random() > 0.8
  #     true
  #   (response) -> # Standard listener callback
  #     # Let Steve know how happy you are that he exists
  #     response.reply response.message.user.name
  # )
