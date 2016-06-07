#!/usr/bin/env python
#-------------------------------------------------------------------------------
# Name:        LastGames
#
# Author:      Razvan
#-------------------------------------------------------------------------------

from sys import argv

from json import dumps

import MySQLdb

################################################################################
id_user = argv[1]

number_of_games = int(argv[2])

db = MySQLdb.connect('localhost', 'root', '', "weball")

cursor = db.cursor()

################################################################################

def get_user_teams(id_user):
    cursor.execute('SELECT id_team FROM teams_user WHERE id_user = %s' % id_user)
    return [team[0] for team in cursor.fetchall()]

def get_id_championships(id_teams):
    id_championships = set()

    for id_team in id_teams:
        cursor.execute('SELECT id_championship FROM championship_teams WHERE id_team = %s' % id_team)
        for id_championship in cursor.fetchall():
            id_championships.add(id_championship[0])

    return list(id_championships)

def get_team_name_logo(id_team):
    cursor.execute('SELECT name, logo FROM teams WHERE id_team = %s' % id_team)
    return cursor.fetchone()

def get_championship_name(id_championship):
    cursor.execute('SELECT name FROM championships WHERE id_championship = %s' % id_championship)
    return cursor.fetchone()[0]

def getLastGames(id_championships, number_of_games):
    games = []
    for id_championship in id_championships:
        cursor.execute('SELECT date, id_team1, id_team2, score FROM matches WHERE id_championship = %s' % id_championship)
        for (date, id_team1, id_team2, score) in cursor.fetchall():
            games.append((date, id_team1, id_team2, score, id_championships))

    last_games = []
    for (date, id_team1, id_team2, score, id_championships) in sorted(games, reverse=True)[:number_of_games]:
        team1_name, team1_logo = get_team_name_logo(id_team1)
        team2_name, team2_logo = get_team_name_logo(id_team2)

        last_games.append( {'team1_name' : team1_name, 'team1_logo' : team1_logo,
                            'team2_name' : team2_name, 'team2_logo' : team2_logo,
                            'score' : score,
                            'date' : str(date),
                            'championship_name' : get_championship_name(id_championship)})

    return last_games


id_teams = get_user_teams(id_user)

id_championships = get_id_championships(id_teams)

print dumps(getLastGames(id_championships, number_of_games))