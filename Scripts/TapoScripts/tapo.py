import sys
import time
from PyP100 import PyP100 
from PyP100 import PyL530
import asyncio
from credentials import *  # Imports variables: email, password, ip_owen, ip_bulb, ip_light
import pprint

# TODO: module fails often. Need to handle exceptions better. 


class Bulb: 
    def __init__(self, ip, email, password) -> None:
        self.bulb = PyL530.L530(ip, email, password)
        print(ip)
        self.__connect()

    def __connect(self): 
        for i in range(5): 
            try:
                self.bulb.handshake()
                self.bulb.login()
            except:
                time.sleep(1)
                pass
            else:
                break


    def set_brightness(self, brightness: int): 
        if 100 < brightness < 10: 
            # Error from brightness [1-10] for some reason
            raise ValueError("Brightness must be between 10 and 100")

        try: 
            self.bulb.setBrightness(brightness)
        except Exception as e:
            print(e)

        self.bulb.turnOn()


    def set_color(self, color: str): 

        valid = ['r', 'w']

        if not color in valid: 
            raise ValueError("Invalid color")


        if color == 'r': 
            try: 
                self.bulb.setColor(10, 100)
                self.bulb.turnOn()
            except Exception as e:
                print(e)

        elif color == 'w': 
            try: 
                self.bulb.setColorTemp(2500)
                self.bulb.setBrightness(100)
                self.bulb.turnOn()
            except Exception as e:
                print(e)




    def toggle_power(self):
        status = self.bulb.getDeviceInfo()['result']['device_on']
        if status:
            self.bulb.turnOff()
        else: 
            self.bulb.turnOn()

    def turn_off(self): 
        self.bulb.turnOff()

    def turn_on(self):
        self.bulb.turnOn()


    def print_info(self): 
        pprint.pprint(self.bulb.getDeviceInfo())


class Plug:
    def __init__(self, ip, email, password) -> None:
        self.plug = PyP100.P100(ip, email, password)
        self.__connect()

    def __connect(self): 
        for i in range(5): 
            try:
                self.plug.handshake()
                self.plug.login()
            except:
                time.sleep(1)
                pass
            else:
                break


    def toggle_power(self):
        status = self.plug.getDeviceInfo()['result']['device_on']
        if status:
            self.plug.turnOff()
        else: 
            self.plug.turnOn()

    def turn_off(self): 
        self.plug.turnOff()

    def turn_on(self):
        self.plug.turnOn()



def cli(): 

    try:
        option = sys.argv[1]
    except:
        print("missing input argument")
        sys.exit(1)


    if option == "o":
        Plug(ip_owen, email, password).toggle_power()

    elif option == "l":
        Plug(ip_light, email, password).toggle_power()

    elif option == "n":
        Plug(ip_light, email, password).turn_off()
        # Plug(ip_owen, email, password).turn_off()
        Bulb(ip_bulb1, email, password).turn_off()
        Bulb(ip_bulb2, email, password).turn_off()

    elif option == "1":
        # Brightness 10%
        Bulb(ip_bulb1, email, password).set_brightness(10)
        Bulb(ip_bulb2, email, password).set_brightness(10)

    elif option == "2": 
        # Brightness 25%
        Bulb(ip_bulb1, email, password).set_brightness(25)
        Bulb(ip_bulb2, email, password).set_brightness(25)

    elif option == "5":
        # Brightness 50%
        Bulb(ip_bulb1, email, password).set_brightness(50)
        Bulb(ip_bulb2, email, password).set_brightness(50)

    elif option == "0":
        # Brightness 100%
        Bulb(ip_bulb1, email, password).set_brightness(100)
        Bulb(ip_bulb2, email, password).set_brightness(100)

    elif option == "r":
        Bulb(ip_bulb1, email, password).set_color('r')
        Bulb(ip_bulb2, email, password).set_color('r')

    elif option == "w":
        Bulb(ip_bulb1, email, password).set_color('w')
        Bulb(ip_bulb2, email, password).set_color('w')


if __name__ == "__main__":
    # try: 
    cli()
    # except Exception as e:
    #     print(e)


    # 16 = 2. bulb
    # ip=["10.0.0.16", "10.0.0.17", "10.0.0.18", "10.0.0.22"]

    # Bulb(f"10.0.0.18", email, password).set_color('r')

    # Bulb(ip_bulb2, email, password).set_color('r')
