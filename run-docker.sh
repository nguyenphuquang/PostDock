#!/bin/bash

port_pgmaster=5532
port_pgslave1=5533
port_pgslave2=5534
port_pgslave3=5535
port_pgslave4=5536

echo "pgmaster is $pgmaster"
echo "pgslave1 is $pgslave1"
echo "pgslave2 is $pgslave2"
echo "pgslave3 is $pgslave3"
echo "pgslave4 is $pgslave4"

ips=$(ifconfig | grep 'inet')

function node ()
{
	ip=$1
	node_name=$2
	echo ""
	echo ""
	echo "***************$node_name"
	match=$(echo $ips | grep -Po $ip)

	if [ "$match" == "$ip" ]
	then
	  echo "match $node_name"
	  pgmaster=$pgmaster \
	  pgslave1=$pgslave1 \
	  pgslave2=$pgslave2 \
	  pgslave3=$pgslave3 \
	  pgslave4=$pgslave4 \
	  ip_pgmaster=$ip_pgmaster \
	  ip_pgslave1=$ip_pgslave1 \
	  ip_pgslave2=$ip_pgslave2 \
	  ip_pgslave3=$ip_pgslave3 \
	  ip_pgslave4=$ip_pgslave4 \
	  port_pgmaster=$port_pgmaster \
	  port_pgslave1=$port_pgslave1 \
	  port_pgslave2=$port_pgslave2 \
	  port_pgslave3=$port_pgslave3 \
	  port_pgslave4=$port_pgslave4 \
	  	docker-compose -p pg up -d $node_name
	else
	  echo "*******dont match, stop..."
	fi
}

node $ip_pgmaster pgmaster
node $ip_pgslave1 pgslave1
node $ip_pgslave3 pgslave3
node $ip_pgslave2 pgslave2
node $ip_pgslave4 pgslave4
