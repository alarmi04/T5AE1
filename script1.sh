#!/bin/bash

operacio1() {
  read -p "Introdueix el nom d'usuari:" nom
  count=$(grep -c $nom usuarios.txt)
  if [ $count -eq 0 ]; then
    echo "$nom no s'ha loguejat"
  else
    echo "$nom s'ha connectat $count vegades"
  fi
}

operacio2() {
  read -p "Introdueix el nom del mes (en minúscules):" mes
  grep $mes usuarios.txt | awk '{print $1}' | sort -n | uniq
}

operacio3() {
  read -p "Introdueix el dia:" dia
  read -p "Introdueix el mes (en minúscules):" mes
  grep "$dia $mes" usuarios.txt | awk '{print $1}'
}

operacio4() {
read -p "Introdueix el nom del usuari:" nom 

vecesUsuario=$(cat usuarios.txt | grep $nom | wc -l) 
max=0 
mesmax="" 

for j in `seq 1 $vecesUsuario`  
do  
    mes=$(cat usuarios.txt | grep $nom | head -n$j | tail -1| awk '{print $3}')
    contador=0  
    for i in enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre 
    do 
        contador=$((contador + 1)) 
        if [ $i = $mes ] 
        then 
            if [ $max -lt $contador ] 
            then  
                max=$contador 
                mesmax=$i 
            fi 
        fi 
    done    
done 

dia=$(cat usuarios.txt | grep $nom | grep $mesmax | awk '{print $2}')
echo "L'ultima vegada que es va connectar va ser el $dia de $mesmax." 
}

# Menú per a seleccionar les operacions fet amb 
# lo que fet amb el que seria un switch de javascript.
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
