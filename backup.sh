#!/bin/bash
#
clear
echo -n "Escriba el nombre del Fichero que desea copiar: "
read Fichero
echo -n "Escriba la ruta (acabada en /) en la que se encuentra el Fichero deseado: "
read Ruta

if [[ ! -d $Ruta ]]
then
	echo "La ruta indicada no existe"
else
	if [[ ! -e $Ruta$Fichero ]]
	then
		echo "El fichero especificado no existe"
	else
		if [[ ! -d ~/FitxConfBackup ]]
		then
			mkdir ~/FitxConfBackup
		fi
		if [[ -e ~/FitxConfBackup/$Fichero ]]
		then
			grep '^[^#]' "$Ruta""$Fichero" > ~/FitxConfBackup/"$Fichero"
		else
			grep '^[^#]' "$Ruta""$Fichero" >> ~/FitxConfBackup/"$Fichero"
		fi
	fi
fi
exit 0
