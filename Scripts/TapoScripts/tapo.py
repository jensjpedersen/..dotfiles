import sys
import time
from PyP100 import PyP100 
from PyP100 import PyL530
from credentials import *  # Imports variables: email, password, ip_owen, ip_bulb, ip_light

# TODO: toggle swithc
#  
# owen.getDeviceInfo()
#  'device_on': False,

try:
    option = sys.argv[1]
except:
    print("missing input argument")
    option = "r"

owen = PyP100.P100(ip_owen, email, password)
bulb = PyL530.L530(ip_bulb, email, password)
light = PyP100.P100(ip_light, email, password)

for i in range(5):
    try:
        owen.handshake()
        owen.login()
        bulb.handshake()
        bulb.login()
        light.handshake()
        light.login()
    except:
        time.sleep(1)
        pass
    else:
        break


if option == "o":
    owen_on = owen.getDeviceInfo()['result']['device_on']
    if owen_on: 
        owen.turnOff()
    else: 
        owen.turnOn()

elif option == "l":
    light_on = light.getDeviceInfo()['result']['device_on']
    if light_on: 
        light.turnOff()
    else: 
        light.turnOn()

elif option == "n":
    owen.turnOff()
    bulb.turnOff()
    light.turnOff()

elif option == "1":
    # Brightness 10%
    bulb.setBrightness(10)
    bulb.turnOn()

elif option == "2": 
    # Brightness 25%
    bulb.setBrightness(25)
    bulb.turnOn()

elif option == "5":
    # Brightness 50%
    bulb.setBrightness(50)
    bulb.turnOn()

elif option == "0":
    # Brightness 100%
    bulb.setBrightness(100)
    bulb.turnOn()

elif option == "r":
    bulb.setColor(10, 100)
    bulb.turnOn()

elif option == "w":
    bulb.setColorTemp(2500)
    bulb.setBrightness(100)
    bulb.turnOn()

