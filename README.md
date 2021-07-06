# arch_dotfiles

Almost all dotfiles required for my ArchLinux setup after fresh install.

### Preparation before making fresh install

If you want to list all packages installed on your system and redirect them to a file like my **_packages.txt_**, use this command:

```
pacman -Qqe > packages.txt
```

You can pass this file to pacman and install all packages you had before:

```
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))
```

- List of Window Managers that I usually use:

  - DWM
  - BSPWM

### Installation

#### 1. DWM

DWM is Dynamic Window Manager written in C. Any changes made to config files will be visible after rebuilding and restarting the program.

- Location of config files for DWM:

  - my fork of DWM is placed in: **.config/dwm/dwm-master** (any changes can be done mainly inside of config.h file)
  - customized for my needings suckless's slstatus is placed in **.config/slstatus**

- Installation of DWM and slstatus:

  - inside of DWM directory type the following command:

  ```
  sudo make clean install
  ```

  - for installation of slstatus use the same command.

#### 2. BSPWM

BSPWM doesn't support keybindings so you need to install alongside it an external program: sxhkd, which aswell can be found in my repo.
