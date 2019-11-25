#!/bin/bash
#
# Script criado por Hygor Galdino em 22-11-2019
#
# Retorna os nomes dos nodes e os indices do ElasticSearch
#
#
#

ESOP=$1
ESUSER=$2
ESPASS=$3
ESURL=$4

JSON=$(curl -s --user ${ESUSER}:${ESPASS} ${ESURL})

if [ ${ESOP} -eq 1 ]
then
	FILTRO=$(echo ${JSON} | jq '.nodes[].name')
	DISCOP="{#NODE_NAME}"
else
	#FILTRO=$(echo ${JSON} | cut -d " " -f 3)
	FILTRO=$(echo ${JSON} | awk -F" " '{print $3}')
	DISCOP="{#INDI_NAME}"
fi

CONTROLE=1

echo "["

for FILTRA in ${FILTRO}; do

	if [ ${CONTROLE} -eq 0 ]
	then
		echo ","
	fi

	echo "{ \"${DISCOP}\":${FILTRA} }"
	CONTROLE=0
done

echo "]"

exit 0
