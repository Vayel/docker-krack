import sys
import socket
from datetime import datetime as dt

def netcat(hostname, port, content):
    port = int(port)
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    addr = (hostname, port)
    print "[%s]: Send %s" % (dt.now().strftime("%H:%M:%S"), content)
    s.sendto(content, addr)
    s.close()

if __name__ == '__main__':
    netcat(*sys.argv[1:])
