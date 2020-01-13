#!/usr/bin/python3
from pathlib import Path
from os import environ, makedirs
from sys import stdout, exit
import shutil

global files
files  = [
  ".xinitrc",
  ".Xresources",
  ".zshrc",
  ".config/i3/config",
  ".config/polybar/config",
  ".config/polybar/launch.sh",
  ".config/picom/picom.conf",
  ".config/picom/launch.sh",
  ".config/pavucontrol.ini",
  ".config/Dharkael/flameshot.ini",
  ".config/user-dirs.dirs" ]

def get_conflicts():
  conflicts = []
  
  home = Path(environ["HOME"])
  for file in files:
    path = home / file
    if (path.exists()):
      conflicts.append(file)
      stdout.write("     [-] {} exists\n".format(file))
  
  return conflicts

def backup(conflicts):
  for file in conflicts:
    shutil.move(Path(environ["HOME"]) / file, Path(environ["HOME"]) / (file + ".bak"))
    stdout.write("     [+] {} backed up\n".format(file))

def install():
  stdout.write("\n  [*] Installing...\n")
  for file in files:
    (Path(environ["HOME"]) / file).parent.mkdir(parents=True, exist_ok=True)
    (Path(environ["HOME"]) / file).unlink(missing_ok=True)
    (Path(environ["HOME"]) / file).symlink_to(Path(environ["PWD"]) / "files" / file)
    stdout.write("     [+] {} installed\n".format(file))
  (Path(environ["HOME"]) / "images/wallpapers").mkdir(parents=True, exist_ok=True)

def main():
  stdout.write("\n dotfiles installer\n ~~~~~~~~~~~~~~~~~~\n")
  
  stdout.write("  [*] Scanning for conflicting files in home ({})...\n".format(environ["HOME"]))
  conflicts = get_conflicts()
  if (conflicts != []):
    stdout.write("\n  [*] Backup? (will overwrite the old backup) [Y/n] ")
    try: answer = input()
    except KeyboardInterrupt: exit()
    if (answer in ["", "Y", "y"]): backup(conflicts)
  
  stdout.write("\n  [*] Install? [Y/n] ")
  try: answer = input()
  except KeyboardInterrupt: exit()
  if (answer in ["", "Y", "y"]): install()
  
  stdout.write("\n  [*] Done! Symlink your wallpapers to \"$HOME/images/wallpapers/{main|second|third}_monitor\".\n\n")

if __name__ == "__main__":
  main()
