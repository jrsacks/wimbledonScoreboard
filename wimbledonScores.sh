#!/bin/bash

curl -s http://2012.wimbledon.com//en_GB/xml/gen/sumScores/sumScores.json | sed 's/var summaryScoreboard = //' | sed 's/sumScoresU/\"sumScoresU\"/' | ./wimbledon.py
