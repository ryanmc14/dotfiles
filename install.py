import os

for f in os.listdir("dotfiles/"):
    os.popen(f"cp -r dotfiles/{f} ~/.{f}")
