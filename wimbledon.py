#!/usr/bin/env python
import json,sys

def printPlayer(player):
    print player["playerNameA"], player["set1"], player["set2"], player["set3"], player["set4"], player["set5"]
  
data = json.loads(sys.stdin.read())
for scores in ["sumScores","sumScoresC"]:
  for match in data[scores]["match"]:
    if match["event"] == "Gentlemen's Singles":
      printPlayer(match["team"][0])
      printPlayer(match["team"][1])
      print ""
