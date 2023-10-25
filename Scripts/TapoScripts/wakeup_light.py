
from tapo import Bulb, Plug
from credentials import * 
import time
import sys



cycle = 60*30
# cycle = 30
levels_red = list(range(10,101,10))
levels_white = list(range(50, 101, 10))
n = len(levels_red) + len(levels_white)
sleep = round(cycle/n)



Bulb(ip_bulb1, email, password).set_color('r')
Bulb(ip_bulb2, email, password).set_color('r')

for val in levels_red: 
    print(f'red brightness: {val}')
    Bulb(ip_bulb1, email, password).set_brightness(val)
    Bulb(ip_bulb2, email, password).set_brightness(val)
    time.sleep(sleep)


Bulb(ip_bulb1, email, password).set_color('w')
Bulb(ip_bulb2, email, password).set_color('w')

for val in levels_white: 
    print(f'white brightness: {val}')
    Bulb(ip_bulb1, email, password).set_brightness(val)
    Bulb(ip_bulb2, email, password).set_brightness(val)
    time.sleep(sleep)


Plug(ip_light, email, password).turn_on()








