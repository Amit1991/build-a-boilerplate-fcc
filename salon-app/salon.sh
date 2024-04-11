#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n----- Welcome to Salom Salon -----\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nPlease select a service that you need:"
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE ]]
  then
    MAIN_MENU "Invalid input. Please pick from available services only."
  else
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      INSERTED_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    echo -e "\nPlease enter your preferred time:"
    read SERVICE_TIME

    BOOKED_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}

MAIN_MENU