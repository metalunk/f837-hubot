# Description:
#   お掃除当番をランダムで決める
# Reference:
#   http://qiita.com/esehara@github/items/0774004d8761a5f24a72

_ = require 'underscore'
module.exports = (robot) ->
  robot.respond /Clean-up duty/i, (msg) ->
    request = require('request')
    request.get
      url: "https://slack.com/api/users.list?token=#{process.env.HUBOT_SLACK_TOKEN}"
      , (err, response, body) ->
        members = (member_raw["name"] for member_raw in JSON.parse(body)["members"])
        filtered_members = members.filter (name) -> name isnt 'f837-hubot'
        msg.send ":rocket: Clean-up duty @#{_.sample(filtered_members)} :rocket:"
