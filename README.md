# Presentation
My .config for ricing Arch using i3-gaps and my scripts from my other repo, https://github.com/Kayno0o/RandomWallpaper

# Table of contents
- [Presentation](#presentation)
- [Table of contents](#table-of-contents)
- [Example screenshot](#example-screenshot)
- [Installation (arch only)](#installation-arch-only)

# Example screenshot

![image](https://i.redd.it/53whwrp08s781.png)

# Installation (arch only)

* [i3-gaps](https://archlinux.org/packages/community/x86_64/i3-gaps/)
    ```
    sudo pacman -S i3-gaps
    ```

* [i3blocks](https://man.archlinux.org/man/i3blocks.1.en)
    ```
    sudo pacman -S i3blocks
    ```

* [ibhagwan/picom](https://github.com/ibhagwan/picom)

* Wallpapers : [1st](https://wall.alphacoders.com/big.php?i=1191962) - [2nd](https://wall.alphacoders.com/big.php?i=824233) - [3rd](https://wall.alphacoders.com/big.php?i=1180547) - [4th](https://wall.alphacoders.com/big.php?i=265693)

* I am using [kitty](https://sw.kovidgoyal.net/kitty/) as my terminal

* I use [Open Weather Api](https://openweathermap.org/) to get the weather, make sure to edit the config file to your own api key\
`~/.config/i3blocks/blocks/.env` :
    ```bash
    echo "
    API_KEY=
    CITY_ID=
    " > ~/.config/i3blocks/blocks/.env
    ```

* As I said in the presentation, I use my own scripts from this repo [RandomWallpaper](https://github.com/Kayno0o/RandomWallpaper) to generate a random wallpaper and use the color scheme from the wallpaper to set the color of the i3blocks and terminal.\
Add this to your .bashrc or .zshrc to restore the color scheme on terminal:
    ```
    wal -r
    ```
