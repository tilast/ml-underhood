#!/bin/bash
set -e

echo "set git environment"
git config user.email "ihor.kroosh@gmail.com"
git config user.name "Ihor Kroosh"
git remote rm origin
git remote add origin https://tilast:${GITHUB_TOKEN}@github.com/tilast/ml-underhood.git
git checkout master

echo "run update"
babel-node update

echo "save dump"
git add --all dump
git commit -m $'save dump\n\n[ci skip]'
git push origin master &>/dev/null

echo "build'n'deploy"
npm run deploy
