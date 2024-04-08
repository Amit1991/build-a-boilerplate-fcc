#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE teams, games")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    TEAM_NAME=$OPPONENT
    echo $TEAM_ID
    echo $TEAM_NAME
    if [[ -z $OPPONENT_ID ]]
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$TEAM_NAME')")"
    fi
    
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    TEAM_NAME=$WINNER
    if [[ -z $WINNER_ID ]]
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$TEAM_NAME')")"
    fi

    
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  fi
done

echo "$($PSQL "SELECT * FROM teams")" "$($PSQL "SELECT count(*) FROM teams")"
echo "$($PSQL "SELECT * FROM games")" "$($PSQL "SELECT count(*) FROM games")"