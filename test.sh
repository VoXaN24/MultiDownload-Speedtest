#!/bin/bash

# Überprüfung, ob die Links-Datei als Parameter angegeben wurde
if [ -z "$1" ]
then
    echo "Keine Links-Datei als Parameter angegeben."
    exit 1
fi

# Definition der Variablen für die Links-Datei
links_file="$1"

# Definition der Variablen für die Ergebnisdatei
results_file="results.txt"

# Schleife über jede Zeile in der Links-Datei
while read -r link; do
    # Ausführung des wget-Befehls für jeden Link
    wget -O /dev/null "$link"

    # Extrahierung der Downloadgeschwindigkeit aus der wget-Ausgabe
    speed=$(wget -O /dev/null "$link" 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}')

    # Speichern des Links und der Downloadgeschwindigkeit in der Ergebnisdatei
    echo "Lien: $link" >> "$results_file"
    echo "Geschwindigkeit des Downloads: $speed" >> "$results_file"
done < "$links_file"

# Ende des Skripts
exit 0
