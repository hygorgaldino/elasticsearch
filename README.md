# elasticsearch
Elasticsearch - Zabbix Monitoring

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
| {$USER} | monitor_zbx |
| {$PASS} | elasbix |
| {$URL_CLUSTER} | http://10.10.10.10:9200/_cluster/ | 
| {$URL_NODE} | http://10.10.10.10:9200/_nodes/ |
| {$URL_NODES} | http://10.10.10.10:9200/_nodes/_all/name |


# Versão utilizada

Zabbix 4.4.1

ElasticSearch 6.4.1
