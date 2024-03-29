#!/bin/bash
#
# Script criado por Hygor Galdino em 22-11-2019
#
# Script usado na LLD
# Discovery dos nodes e dos indices do ElasticSearch
#
# Uso: ./es_discovery.sh <opcao> <user> <pass> <url>
#

ESOP=$1
ESUSER=$2
ESPASS=$3
ESURL=$4

if [ ${ESOP} -eq 1 ]
then
	JSON=$(curl -k -s --user ${ESUSER}:${ESPASS} ${ESURL})
	FILTRO=$(echo ${JSON} | jq '.nodes[].name')
	DISCOP="{#NODE_NAME}"
else
	FILTRO=$(curl -k -s --user ${ESUSER}:${ESPASS} ${ESURL} | cut -d " " -f 3)
	for IND in ${FILTRO}; do
		FILTRO2="${FILTRO2}""\"${IND}\" "
	done
	FILTRO="${FILTRO2}"
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
