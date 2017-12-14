import sys
import socket
from datetime import datetime as dt

BUFFER_SIZE = 4096

def netcat(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.bind(('', port))
    while True:
        msg = s.recv(BUFFER_SIZE)
        if msg:
            print "[%s]: %s" % (dt.now().strftime("%H:%M:%S"), msg)
    s.close()

if __name__ == '__main__':
    netcat(int(sys.argv[1]))
