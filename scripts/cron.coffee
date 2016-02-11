# Description:
#   Defines periodic executions
# Dependencies:
#   cron, time

HubotCron = require 'hubot-cronjob'

module.exports = (robot) ->
  tz = 'America/Los_Angeles'


  testCronMethod = () ->
    robot.emit 'imagesearch', 'dat_ass'
  new HubotCron '*/60 * * * *', tz, testCronMethod # Every 10 minutes
