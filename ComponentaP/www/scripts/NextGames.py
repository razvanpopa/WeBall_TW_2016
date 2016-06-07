#!/usr/bin/env python

#-------------------------------------------------------------------------------
# Name:        NextGames
#
# Author:      Razvan
#
# Created:     05/06/2016
#-------------------------------------------------------------------------------

from sys import argv

from json import dumps

import MySQLdb

import random

db = MySQLdb.connect('localhost', 'root', '', "weball")

cursor = db.cursor()

################################################################################

id_user = argv[1]

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
    return cursor.fetchone()

def get_teams_to_play(id_championships):
    to_play = []

    for id_championship in id_championships:
        id_teams_championship = set()

        cursor.execute('SELECT id_team FROM championship_teams WHERE id_championship = %s' % id_championship)
        for id_team in cursor.fetchall():
            id_teams_championship.add(id_team)

        not_played = []
        played = []

        for id_team1 in id_teams_championship:
            for id_team2 in id_teams_championship:
                if id_team1 != id_team2:
                    team1_name, team1_logo = get_team_name_logo(id_team1)
                    team2_name, team2_logo = get_team_name_logo(id_team2)

                    cursor.execute('SELECT score, date FROM matches WHERE id_team1 = %s AND id_team2 = %s' % (id_team1[0], id_team2[0]))
                    result = cursor.fetchone()
                    if not result:
                        not_played.append({ 'team1_logo' : team1_logo, 'team1_name' : team1_name,
                                            'id_team1' : id_team1, 'id_team2' : id_team2,
                                            'team2_logo' : team2_logo, 'team2_name' : team2_name,
                                            })
                    else:
                        score, date = result
                        played.append((date, {'team1_logo' : team1_logo, 'team1_name' : team1_name,
                                    'id_team1' : id_team1, 'id_team2' : id_team2,
                                    'team2_logo' : team2_logo, 'team2_name' : team2_name,
                                    'score': score}))
        random.seed(10)
        random.shuffle(not_played)

        played = [game for (date, game) in sorted(played)]

        to_play.append({'id_championship' : id_championship, 'championship_name' : get_championship_name(id_championship), 'not_played' : not_played, 'played' : played})

    return to_play

id_teams = get_user_teams(id_user)

id_championships = get_id_championships(id_teams)

print dumps(get_teams_to_play(id_championships))