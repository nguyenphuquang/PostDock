import socket
from Cheetah.Template import Template

context = {
        'ip': socket.gethostbyname(socket.gethostname()),
        'pgmaster_ip': '10.1.1.35',
        'pgslave1_ip': '10.1.1.40',
        'pgslave2_ip': '10.1.1.35',
        'pgslave3_ip': '10.1.1.219',
        'pgslave4_ip': '10.1.1.35',
        'backup_ip': '10.1.1.219',
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
