# .bash_profile: executed by ~/.bashrc
# Source the bash files that do the heavy lifting
# ~/.bash_private.bash can be used for other settings you don’t want to commit

# Source the bash files:
for file in ~/.bash/.bash_{sensible,prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
if [ -f ~/.bash_private.bash ]; then
    source ~/.bash_private.bash
fi
