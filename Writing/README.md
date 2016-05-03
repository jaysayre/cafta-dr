An Introduction
===============

This template is designed to support all of the formatting and typesetting needed for a Plan of Concentration at Marlboro College.
This package provides all of the necessary components to use this template. For contributions, comments, and bug reports, please contact Jay Sayre at jsayre at marlboro edu.
This homework template is based on the Harvard thesis template by [Jordan Suchow.](https://github.com/suchow/LaTeX-template-for-Harvard-dissertation) 

Installation
============

### Windows 8 ###
1. Download latest version of TexLive
2. Download this Git Repo
3. Install fonts by selecting all of them, right-clicking on install

Compilation:
In order to have the nice Arno Pro fonts, make sure to use XeLateX.
In the powershell, this is:
> xelatex -synctex=-1 thesis.tex

### Linux ###
1. Download latest version of TexLive
2. Download this Git Repo
I found the instructions here to be helpful: [How to Install "Vanilla" TexLive](http://tex.stackexchange.com/questions/1092/how-to-install-vanilla-texlive-on-debian-or-ubuntu)
3. Copy fonts to fonts folder - I'm not sure if this is the right folder

> sudo cp fonts/* /usr/share/fonts/opentype;
> sudo fc-cache -fsv

Then simply run:

> xelatex thesis.tex
