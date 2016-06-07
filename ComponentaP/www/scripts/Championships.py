#!/usr/bin/env python
#-------------------------------------------------------------------------------
# Name:        Championships
#
# Author:      Razvan
#
# Created:     05/06/2016
#-------------------------------------------------------------------------------

from sys import argv

from json import dumps

import MySQLdb

db = MySQLdb.connect('localhost', 'root', '', "weball")

cursor = db.cursor()

def get_user_id(user_name):
    cursor.execute('SELECT id FROM users WHERE user = %s' % user_name)
    return cursor.fetchone()

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

def get_team_logo_and_name(id_team):
    cursor.execute('SELECT logo, name FROM teams WHERE id_team = %s' % id_team)
    return cursor.fetchone()

def get_championship_name(id_championship):
    cursor.execute('SELECT name from championships WHERE id_championship = %s' % id_championship)
    return cursor.fetchone()

def is_admin(id_championship, id_user):
    cursor.execute('SELECT * FROM championships_admin WHERE id_user = %s AND id_championship = %s' % (id_user, id_championship))
    return cursor.fetchone() != None

def get_championship_data(id_championship):
    teams = {}

    cursor.execute('SELECT id_team1, id_team2, score FROM matches WHERE id_championship = %s' % id_championship)
    for (id_team1, id_team2, score) in cursor.fetchall():
        score_1 = int(score.split('-')[0].strip())
        score_2 = int(score.split('-')[1].strip())

        if teams.get(id_team1):
            teams[id_team1] += 3 if score_1 > score_2 else (1 if score_1 == score_2 else 0)
        else:
            teams[id_team1] = 3 if score_1 > score_2 else (1 if score_1 == score_2 else 0)

        if teams.get(id_team2):
            teams[id_team2] += 3 if score_2 > score_1 else (1 if score_2 == score_1 else 0)
        else:
            teams[id_team2] = 3 if score_2 > score_1 else (1 if score_2 == score_1 else 0)

    board = sorted([(teams[id_team], id_team) for id_team in teams], reverse=True)

    data = []
    for(position, (score, id_team)) in enumerate(board):
        logo, nume = get_team_logo_and_name(id_team)
        data.append({'pozitie' : position + 1, 'logo' : logo, 'nume' : nume, 'punctaj' : score})

    return data

id_user = argv[1]

user_teams = get_user_teams(id_user)

id_championships = get_id_championships(user_teams)

championships_data = []
for id_championship in id_championships:
    championships_data.append({'id_championship':id_championship,'is_admin' : is_admin(id_championship, id_user), 'name' : get_championship_name(id_championship), 'data' : get_championship_data(id_championship) })

print dumps(championships_data)