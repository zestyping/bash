# Source this file in .bashrc to show a prompt with the last command's wall
# time and status, current git branch, and job count (each & represents a job).

function pre_prompt_command() {
    LAST_RUN_TIME=$(($SECONDS - ${LAST_START_TIME:-0}))
    unset LAST_START_TIME
}
PROMPT_COMMAND=pre_prompt_command
trap 'LAST_START_TIME=${LAST_START_TIME:-$SECONDS}' DEBUG

function status() {
    code=$?
    (($LAST_RUN_TIME >= 1)) && echo "${LAST_RUN_TIME}s "
    [ $code != 0 ] && echo "($code) "
}

function title() {
    echo -ne "\x1b]0;$1\x07";
}

function cwd_title() {
    cwd=$(pwd | sed -e "s|$HOME|~|");
    title "$HOST: $cwd";
}

function user_flag() {
    [ "$USER" = root ] && echo -n '#';
}

function git_branch() {
    if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
        echo -n " $branch"
        [ -n "$(git status --porcelain 2> /dev/null)" ] && echo -n '*'
    fi
}

function job_count() {
  local count=$(jobs | wc -l)
  printf -v spaces "%${count}s" ' '
  (($count > 0)) && echo " ${spaces// /&}";
}

green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
normal=$(tput sgr0)

export PS1="\$(status)\[\$(cwd_title)$green\]\$(date -u +%H:%M:%S)\[$cyan\]\$(git_branch)\[$red\]\$(job_count) \[$yellow\]$HOST[\!]\$(user_flag)\[$normal\] "
