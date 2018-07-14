i3 on Ubuntu Mate
--------------------------------
Tested on 18.04 (12 June 2018)

Install git, clone this repository and run `install.sh`.
This will install i3 and some other useful applications.

After that, run dconf-editor and in
`org > mate > desktop > session > required-components`
change `marco` to `i3`. Head up one level and remove
`file-manager` from `required-component-list`.

Move i3 config file to `~/.config/i3`.
i3bar is disabled in the configuration file and I use Mate panel instead,
so install this applet to get workspace indicator:
[mate-i3-applet](https://github.com/city41/mate-i3-applet)

Disable conflicting superkey binding:
```
gsettings set org.mate.mate-menu hot-key ''
gsettings set com.solus-project.brisk-menu hot-key ''
```

###Additional things:

Fan speed control:
```
NBFC
https://github.com/hirschmann/nbfc/wiki/First-steps
```

Mainline kernel:
```
https://github.com/GM-Script-Writer-62850/Ubuntu-Mainline-Kernel-Updater
```

Themes:
```
https://github.com/vinceliuice/vimix-gtk-themes  
https://github.com/vinceliuice/vimix-icon-theme  
~/.Xresources -> Xcursor.theme: Paper-Vimix  
```

GTK cursor in Chromium:
```
1. cd ~/.icons
2. ln -s <name of the theme you use> default
```

Fonts:
```
https://github.com/be5invis/Iosevka
```
