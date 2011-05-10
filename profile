#
# Your previous .profile  (if any) is saved as .profile.mpsaved
# Setting the path for MacPorts.
export PATH=/Users/chrigu99/Plone/bin:/Applications/XAMPP/xamppfiles/bin:/usr/local/python/2.6.4-i386/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PYTHONSTARTUP=~/.pythonstartup
export VISUAL=vi
export PS1='\033[01;32m\]\u\033[00m\]:\033[0;33m\]`echo \$prompt`\033[00m\]:\w\033[0;33m\]\$ \033[00m\]'


LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:';
export LSCOLORS='dxfxcxdxbxegedabagacad'  # default: exfxcxdxbxegedabagacad , see man ls
alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -lA'
alias ..='cd ..'
alias grep='grep --color'
alias Preview='/Applications/Preview.app/Contents/MacOS/Preview'
alias gvimp='gvim -p'

alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias mysqlstart='sudo mysqld_safe5 &'
alias mysqlstop='mysqladmin5 -u root -p shutdown'

# GIT
alias git-b='git-branch -a'
alias git-s='git-status'
alias git-co='git-checkout'
alias git-ci='git-commit'
alias git-mergetool='git-mergetool --tooly=gvimdiff'
alias git-sd='gvim -p `git-diff --name-only`'

function pwdcp
{
    echo -n `pwd`/$1 | pbcopy
}


. ~/.vim/aliases

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# terminal tab title hack
function set_window_and_tab_title
{
    local title="$1"
    if [[ -z "$title" ]]; then
        title="root"
    fi

    local tmpdir=~/Library/Caches/${FUNCNAME}_temp
    local cmdfile="$tmpdir/$title"

    # Set window title
    echo -n -e "\e]0;${title}\a"

    # Set tab title
    if [[ -n ${CURRENT_TAB_TITLE_PID:+1} ]]; then
        kill $CURRENT_TAB_TITLE_PID
    fi
    mkdir -p $tmpdir
    ln /bin/sleep "$cmdfile"
    "$cmdfile" 10 &
    CURRENT_TAB_TITLE_PID=$(jobs -x echo %+)
    disown %+
    kill -STOP $CURRENT_TAB_TITLE_PID
    command rm -f "$cmdfile"
}

PROMPT_COMMAND='set_window_and_tab_title "$prompt - ${PWD##*/}"'


