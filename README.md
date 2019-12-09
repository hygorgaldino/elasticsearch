# elasticsearch
Elasticsearch - Zabbix Monitoring

Monitora **multiplos** cluster ElasticSearch **sem agent e sem instalar script no host.**

Monitoramento de ElasticSearch utilizando API.

Através de itens **HTTP Agent** as informações são coletadas da API do ElasticSearch e filtradas com **Dependent Itens**

O discovery é feito por meio de um item **External Check** 

# Dependências
## Packages
* curl
* jq

#### Debian/Ubuntu
```
# apt install curl jq -y 
```

#### RedHat/CentOS
```
# yum install curl jq
```

# Uso

Após aplicar o template no host, Preencher as seguintes macros:

| MACRO | VALOR Exemplo |
| --- | --- |
| {$ESUSER} | monitor_zbx |
| {$ESPASS} | elasbix |
| {$URL_CLUSTER} | http://10.10.10.10:9200/_cluster | 
| {$URL_NODE} | http://10.10.10.10:9200/_nodes/ |
| {$URL_NODES} | http://10.10.10.10:9200/_nodes/_all/name |
| {$URL_BASE} | http://10.10.10.10:9200 |
| {$URL_INDICES} | http://10.10.10.10:9200/_cat/indices |


# Versão utilizada

Zabbix 4.4.1

ElasticSearch 6.4.1
