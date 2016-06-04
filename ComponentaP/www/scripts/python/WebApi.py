import requests

import MySQLdb

API_KEY = '88a3e31e1ab8499fbe2d23543059a21b'


def getAPIRequest(url):
    req = requests.get(url, headers={'X-Auth-Token' : API_KEY})
    return req.json()

def populate_teams_DB():
    db = MySQLdb.connect('localhost', 'root', '', "weball")
    cursor = db.cursor()

    for team in getTeams():
        cursor.execute('INSERT INTO footbal_teams VALUES(%s, "%s", "%s")' %
        (team[0], team[1], team[2]))

    db.commit()

    db.close()

def getTeams():
    url = 'http://api.football-data.org/v1/soccerseasons/?season=2015'

    teams = []

    response_championships = getAPIRequest(url)
    for championship in response_championships:
        try:
            url_teams = championship['_links']['teams']['href']
            response_teams = getAPIRequest(url_teams)

            for team in response_teams['teams']:
                team_id = team['_links']['fixtures']['href'].split('teams/')[1].split('/')[0]
                team_name = team['name']
                team_logo = team['crestUrl']

                teams.append([team_id, team_name, team_logo])
        except Exception as exc:
            print(exc)

    return teams

populate_teams_DB()
