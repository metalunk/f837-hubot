# Description:
#   Slackの参加者からランダムで抽選する奴
# Author:
#   esehara
# Reference:
#   http://qiita.com/esehara@github/items/0774004d8761a5f24a72

module.exports = (robot) ->
  robot.respond /lottery/i, (msg) ->
    request = require('request')
    request.get
      url: "https://slack.com/api/users.list?token=#{process.env.HUBOT_SLACK_TOKEN}"
      , (err, response, body) ->
        members = (member_raw["name"] for member_raw in JSON.parse(body)["members"])
        msg.send "#{sample(members)}さんが選ばれました"
