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
        date = $('dt > span').text()
        content = $('p').text()
        robot.send {room: room}, date + ' の暮らしのヒントです。\n' + content
      else
        robot.send {room: room}, '頑張って探してみたのですが…本日はヒントがないようです。'
      
  robot.respond /hint/, (msg) ->
    hint(msg)

  new cron '0 15 * * 1-5', ->
    hint(msg)
  , null, true, 'Asia/Tokyo'
