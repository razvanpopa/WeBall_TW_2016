#!/usr/bin/env python

#-------------------------------------------------------------------------------
# Name:        GetFootbalTeamInfo

# Author:      Razvan
#
# Created:     06/06/2016
#-------------------------------------------------------------------------------

import requests

from sys import argv

from json import dumps

import MySQLdb

db = MySQLdb.connect('localhost', 'root', '', "weball", charset='utf8')

cursor = db.cursor()

################################################################################
API_KEY = '88a3e31e1ab8499fbe2d23543059a21b'

number_of_games = 10

id_team = argv[1]

################################################################################

def getAPIRequest(url):
    req = requests.get(url, headers={'X-Auth-Token' : API_KEY})
    return req.json()

def getTeamLogo(team_name):
    cursor.execute('SELECT logo FROM footbal_teams WHERE team_name = "%s"' % team_name)
    return cursor.fetchone()[0]

def getLastGames():
    try:
        games = []

        fixtures = getAPIRequest('http://api.football-data.org/v1/teams/%s/fixtures' % id_team)['fixtures'][-number_of_games:]
        for game in fixtures:
            game['homeTeamLogo'] = getTeamLogo(game['homeTeamName'])
            game['awayTeamLogo'] = getTeamLogo(game['awayTeamName'])

            games.append(game)

        return games

    except Exception as exc:
        print exc
        return None


def getPlayers():
    return getAPIRequest('http://api.football-data.org/v1/teams/%s/players' % id_team)['players']

data = {}
data['last_games'] = getLastGames()
print dumps(data)