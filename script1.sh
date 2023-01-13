#!/bin/bash

# Funció per a l'operació 1:
operacio1() {
  read -p "Introdueix el nom d'usuari:" nom
  count=$(grep -c $nom usuarios.txt)
  if [ $count -eq 0 ]; then
    echo "$nom no s'ha loguejat"
  else
    echo "$nom s'ha connectat $count vegades"
  fi
}

# Funció per a l'operació 2:
operacio2() {
  read -p "Introdueix el nom del mes (en minúscules):" mes
  grep $mes usuarios.txt | awk '{print $1}' | sort -n | uniq
}

# Funció per a l'operació 3:
operacio3() {
  read -p "Introdueix el dia:" dia
  read -p "Introdueix el mes (en minúscules):" mes
  grep "$dia $mes" usuarios.txt | awk '{print $1}'
}

# Funció per a l'operació 4:
operacio4() {
  read -p "Introdueix el nom d'usuari:" nom
  datault=$(cat usuarios.txt | grep $nom | tail -1 | awk '{print $2,$3}')
  echo "L'ultima vegada que l'usuari s'ha loguejat es el $datault"
}

# Menú per a seleccionar les operacions fet amb 
# lo que fet amb el que seriosa un switch de javascript.
while true; do
  echo "Selecciona una operació:"
  echo "1. Mostrar el nombre de vegades que s'ha loguejat un usuari"
  echo "2. Mostrar els dies que s'ha connectat un mes"
  echo "3. Mostrar els usuaris que s'han connectat una data"
  echo "4. Mostrar la data de l'última connexió d'un usuari"
  echo "5. Eixir"
  read operacio
  case $operacio in
    1) operacio1;;
    2) operacio2;;
    3) operacio3;;
    4) operacio4;;
    5) break;;
    *) echo "Opció no vàlida";;
  esac
done
