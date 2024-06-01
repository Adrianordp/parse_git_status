parse_git(){
    CYAN='\e[0;38;2;0;255;255m'
    GREEN='\e[0;38;2;0;255;0m'
    ORANGE='\e[0;38;2;255;127;0m'
    RED='\e[0;38;2;255;0;0m'
    YELLOW='\e[0;38;2;150;150;0m'
    RESET='\e[0m'
    
    BRANCH_NAME=$(git branch --show-current 2> /dev/null)
    BRANCHES=$(git branch 2> /dev/null)
    GIT_STATUS=$(git status -sb 2> /dev/null)
    
    if [ -z "$BRANCHES" ]; then
        EXCLAMATION=$RED!$RESET
    fi
    if [ $BRANCH_NAME ]; then
        echo -ne $YELLOW\($RESET$EXCLAMATION
        BRANCH_COLOR=$YELLOW$BRANCH_NAME$RESET
        echo -ne $BRANCH_COLOR
        GIT_AHEAD=$(echo "$GIT_STATUS" | sed -nE 's/.* \[ahead (\d+)\]/\1/p')
        if [ $(echo "$GIT_STATUS" | sed -nE 's/^\?\? //p' | tail -n1) ]; then
            echo -ne " $RED"u"$RESET"
        fi
        if [ $GIT_AHEAD ]; then
            echo -ne "$CYAN a$GIT_AHEAD"
        fi
        if [ $(echo "$GIT_STATUS" | sed -nE 's/^.  //p' | tail -n1) ]; then
            echo -ne " $GREEN+$RESET"
        fi
        if [ $(echo "$GIT_STATUS" | sed -nE 's/^ . //p' | tail -n1) ]; then
            echo -ne " $ORANGE+$RESET"
        fi
        echo -ne $YELLOW\)$RESET
    fi
}

echo $(parse_git)
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(parse_git)\n\$ '