import os
import subprocess

colors = {}

# load file ~/Documents/github/RandomWallpaper/color_scheme
with open(os.path.expanduser("~/Documents/github/RandomWallpaper/color_scheme")) as f:
    color_scheme = f.read().strip()
    
    for line in color_scheme.split("\n"):
        key, variable = line.split("=")
        colors[key] = variable

eth = {}
wifi = {}
ip = 0

# open files in /sys/class/net
for i in os.listdir("/sys/class/net"):
    # if file i/operstate is up
    if os.path.isfile("/sys/class/net/" + i + "/operstate"):
        if open("/sys/class/net/" + i + "/operstate").read().strip() == "up":
            # if file i/wireless exists
            if os.path.isdir("/sys/class/net/" + i + "/wireless/"):
                # wifi[i] = exec(iw dev | grep ssid | cut -d " " -f 2)
                wifi[i] = subprocess.check_output(["iw dev | grep ssid | cut -d ' ' -f 2"], shell=True).decode("utf-8").replace('\n', '')
            else:
                # eth[i] = exec(ifconfig | grep "inet " | cut -d " " -f 2)
                eth[i] = "True"
            ip = subprocess.check_output(["ip route get 1 | cut -d ' ' -f 7"], shell=True).decode("utf-8").replace('\n', '')

if len(wifi) > 0:
    print("   {} : {} ".format(wifi[list(wifi.keys())[0]], ip))
    print("  {}".format(wifi[list(wifi.keys())[0]], ip))
    print(colors['FOCUS'])
elif len(eth) > 0:
    print("   {} ".format(ip))
    print("  {}".format(ip))
    print(colors['FOCUS'])
else:
    print("   ")
    print(" ")
    print(colors['ERROR_COLOR'])