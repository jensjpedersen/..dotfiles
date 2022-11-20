import sys
from PyP100 import PyP100 
from PyP100 import PyL530
import keyring
import time

from credentials import *

cycle = 60*30

owen = PyP100.P100(ip_owen, email, password)
bulb = PyL530.L530(ip_bulb, email, password)
light = PyP100.P100(ip_light, email, password)

for i in range(5):
    try:
        owen.handshake()
        owen.login()
        owen.turnOn()
    except:
        time.sleep(1)
        pass
    else:
        break

for i in range(5):
    try:
        bulb.handshake()
        bulb.login()
    except:
        time.sleep(1)
        pass
    else:
        break


levels_red = list(range(1,21))
levels_white = list(range(5,15)) + list(range(15, 50, 5)) + list(range(50, 101, 10))
n = len(levels_red) + len(levels_white)
sleep = round(cycle/n)

for val in levels_red:
    try:
        bulb.setColor(22, 100)
        bulb.setBrightness(val)
    except KeyError:
        pass
    time.sleep(sleep)

for val in levels_white:
    try:
        bulb.setBrightness(val)
    except KeyError:
        pass
    bulb.setColorTemp(2500)
    time.sleep(sleep)


for i in range(5):
    try:
        light.handshake()
        light.login()
        light.turnOn()
    except:
        time.sleep(1)
        pass
    else:
        break

