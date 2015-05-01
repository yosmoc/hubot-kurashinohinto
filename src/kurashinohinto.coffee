# Description
#   Kurashi-no-hinto
#
# Configuration:
#   None
#
# Commands:
#   hubot hinto - returns today's kurashi no hinto
#
# Notes:
#   None
#
# Author:
#   samurai20000 <samurai20000___@___gmail.com>

request = require 'request'
cheerio = require 'cheerio'
cron = require('cron').CronJob
room = "#general"

module.exports = (robot) ->

  hint = (msg) ->
    url = 'https://www.kurashi-no-techo.co.jp/inc_hint'

    request url, (err, res) ->
      if !err && res.statusCode == 200
        $ = cheerio.load res.body
        title = $('dt').text()
        content = $('dd > p').text()
        robot.send {room: room}, title + '\n' + content
      else
        robot.send {room: room}, '頑張って探してみたのですが…本日はヒントがないようです。'

  robot.respond /hint/, (msg) ->
    hint(msg)

  new cron '0 15 * * 1-5', (msg) ->
    hint(msg)
  , null, true, 'Asia/Tokyo'
