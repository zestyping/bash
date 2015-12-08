# Source this file in .bashrc to provide shortcuts for resizing the window.

function 80c {
  echo -e '\x1b[8;'$(tput lines)';80t'
}
function 84c {
  echo -e '\x1b[8;'$(tput lines)';84t'
}
function 100c {
  echo -e '\x1b[8;'$(tput lines)';100t'
}
function 120c {
  echo -e '\x1b[8;'$(tput lines)';120t'
}
function 161c {
  echo -e '\x1b[8;'$(tput lines)';161t'
}
function 165c {
  echo -e '\x1b[8;'$(tput lines)';165t'
}
function 200c {
  echo -e '\x1b[8;'$(tput lines)';200t'
}
function 240c {
  echo -e '\x1b[8;'$(tput lines)';240t'
}
function 248c {
  echo -e '\x1b[8;'$(tput lines)';248t'
}
alias single=80c
alias singlej=100c
alias double=165c
alias doublej=200c
alias triple=240c
alias triplew=248c
function tall {
  echo -e '\x1b[105t'
}
function tallest {
  echo -e '\x1b[170t'
}
function short {
  echo -e '\x1b[75t'
}
function tiny {
  echo -e '\x1b[30t'
}

