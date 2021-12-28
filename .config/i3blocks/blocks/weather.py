import requests
import os

# read .env file
with open(os.path.expanduser('~/.config/i3blocks/blocks/.env')) as f:
    for line in f:
        line_split = line.split('=')
        os.environ[line_split[0]] = line_split[1].strip()

API_KEY = os.environ['API_KEY']
CITY_ID = os.environ['CITY_ID']

WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units=metric"\
    .format(CITY_ID, API_KEY)


# fetch weather data from API
def get_weather_data():
    try:
        data = requests.get(WEATHER_URL).json()
        return data
    except Exception as e:
        print(e)


data = get_weather_data()

temp = data["main"]["temp"]
min_temp = data["main"]["temp_min"]
max_temp = data["main"]["temp_max"]
humidity = data["main"]["humidity"]

weather_type = data["weather"][0]["main"]
weather_icon = data["weather"][0]["icon"]

# weather_icon as emoji
# weather_emojis = {"01d": ["", "#e0af68"],"01n": ["", "#414868"],"02d": ["", "#e0af68"],"02n": ["", "#e0af68"],"03d": ["", "#a9b1d6"],"03n": ["", "#a9b1d6"],"04d": ["", "#787c99"],"04n": ["", "#787c99"],"09d": ["", "#7aa2f7"],"09n": ["", "#7aa2f7"],"10d": ["", "#7aa2f7"],"10n": ["", "#7aa2f7"],"11d": ["", "#e0af68"],"11n": ["", "#e0af68"],"13d": ["", "#c0caf5"],"13n": ["", "#c0caf5"],"50d": ["", "#c0caf5"],"50n": ["", "#c0caf5"] }

colors = {}

# load file ~/Documents/github/RandomWallpaper/color_scheme
with open(os.path.expanduser("~/Documents/github/RandomWallpaper/color_scheme")) as f:
    color_scheme = f.read().strip()

    for line in color_scheme.split("\n"):
        key, variable = line.split("=")
        colors[key] = variable

weather_emojis = {
    "01d": ["", colors["GOOD_COLOR"]],  # Clear Sky
    "01n": ["", colors["GOOD_COLOR"]],  # Clear Sky (Night)

    "02d": ["", colors["WARNING_COLOR"]],  # Few Clouds
    "02n": ["", colors["WARNING_COLOR"]],  # Few Clouds (Night)

    "03d": ["", colors["WARNING_COLOR"]],  # Scattered Clouds
    "03n": ["", colors["WARNING_COLOR"]],  # Scattered Clouds (Night)

    "04d": ["", colors["ERROR_COLOR"]],  # Broken Clouds
    "04n": ["", colors["ERROR_COLOR"]],  # Broken Clouds (Night)

    "09d": ["", colors["WARNING_COLOR"]],  # Shower Rain
    "09n": ["", colors["WARNING_COLOR"]],  # Shower Rain (Night)

    "10d": ["", colors["ERROR_COLOR"]],  # Rain
    "10n": ["", colors["ERROR_COLOR"]],  # Rain (Night)

    "11d": ["", colors["ERROR_COLOR"]],  # Thunderstorm
    "11n": ["", colors["ERROR_COLOR"]],  # Thunderstorm (Night)

    "13d": ["", colors["TEXT_COLOR"]],  # Snow
    "13n": ["", colors["TEXT_COLOR"]],  # Snow (Night)

    "50d": ["", colors["TEXT_COLOR"]],  # Mist
    "50n": ["", colors["TEXT_COLOR"]]  # Mist
}

weather_emoji = weather_emojis[weather_icon][0]

if(humidity < 30):
    humidity_icon = ""
elif(humidity < 60):
    humidity_icon = ""
else:
    humidity_icon = ""

print(" {} {}°C, {}% {} ".format(weather_emoji, temp, humidity, humidity_icon))
print(" {} {}°C ".format(weather_emoji, temp))

print(weather_emojis[weather_icon][1])
