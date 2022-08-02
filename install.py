import os

for f in os.listdir("dotfiles/"):
    os.popen(f"rsync -a dotfiles/{f} ~/")
