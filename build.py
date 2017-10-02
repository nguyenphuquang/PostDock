import socket
from Cheetah.Template import Template

context = {
        'ip': socket.gethostbyname(socket.gethostname()),
        'pgmaster_ip': '192.168.1.32',
        'pgslave1_ip': '192.168.1.32',
        'pgslave2_ip': '192.168.1.32',
        'pgslave3_ip': '192.168.1.32',
        'pgslave4_ip': '192.168.1.32',
        'backup_ip': '192.168.1.32',
        'pgmaster_port': 5532,
        'pgslave1_port': 5533,
        'pgslave2_port': 5534,
        'pgslave3_port': 5535,
        'pgslave4_port': 5536,
}

t = Template(file='docker-compose.template.yml', searchList=context)

f = open('docker-compose.yml', 'w')
f.write(str(t))
f.close()

print('**** Build docker-compose.yml finish')
