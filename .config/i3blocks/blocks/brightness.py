import os

brighPath = '/sys/class/backlight/amdgpu_bl0/actual_brightness' #
maxBrighPath = '/sys/class/backlight/amdgpu_bl0/max_brightness' #

import math
file=open(brighPath)
brightness = int(file.read());
file.close()
file=open(maxBrighPath)
maxBrightness = int(file.read())
file.close()
brightnessPerc = math.ceil(brightness * 100 / maxBrightness)

icon = '💡'
if brightnessPerc < 30:
    icon = ''
elif brightnessPerc < 70:
    icon = ''
else:
    icon = ''


print(' {}{:>3}% '.format(icon, brightnessPerc))
print('{}%'.format(brightnessPerc))

colors = {}

# load file ~/Documents/github/RandomWallpaper/color_scheme
with open(os.path.expanduser("~/Documents/github/RandomWallpaper/color_scheme")) as f:
    color_scheme = f.read().strip()
    
    for line in color_scheme.split("\n"):
        key, variable = line.split("=")
        colors[key] = variable

if brightnessPerc < 30:
    print('{}'.format(colors["GOOD_COLOR"]))
elif brightnessPerc < 70:
    print('{}'.format(colors["WARNING_COLOR"]))
else:
    print('{}'.format(colors["FOCUS"]))