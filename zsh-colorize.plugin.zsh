# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2021 Brad Thorne

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zsh-colorize && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[ZSH_COLORIZE_DIR]="${0:h}"


export LESS="$LESS -R -M"

function ip() {
  command ip --color=auto "$@"
}

function grep() {
  command grep --colour=auto "$@"
}

function egrep() {
  command egrep --colour=auto "$@"
}

function fgrep() {
  command fgrep --colour=auto "$@"
}

if (( $+commands[diff-so-fancy] )); then
  function diff() {
    command diff "$@" | diff-so-fancy
  }
elif  (( $+commands[delta] )); then
  function diff() {
    command diff "$@" | delta
  }
else
  function diff() {
    command diff --color "$@"
  }
fi

if (( $+commands[grc] )); then
  function env() {
    command grc --colour=auto env "$@"
  }

  function lsblk() {
    command grc --colour=auto lsblk "$@"
  }

  function df() {
    command grc --colour=auto df -h "$@"
  }

  function du() {
    command grc --colour=auto du -h "$@"
  }

  function free() {
    command grc --colour=auto free -h "$@"
  }

  function as() {
    command grc --colour=auto as "$@"
  }

  if (( $+commands[dig] )); then
    function dig() {
      command grc --colour=auto dig "$@"
    }
  fi

  if (( $+commands[gas] )); then
    function gas() {
      command grc --colour=auto gas "$@"
    }
  fi

  if (( $+commands[gcc] )); then
    function gcc() {
      command grc --colour=auto gcc "$@"
    }
  fi

  if (( $+commands[g++] )); then
    function g() ++(){
      command grc --colour=auto g++ "$@"
    }
  fi

  if (( $+commands[last] )); then
    function last() {
      command grc --colour=auto last "$@"
    }
  fi

  if (( $+commands[ld] )); then
    function ld() {
      command grc --colour=auto ld "$@"
    }
  fi

  if (( $+commands[ifconfig] )); then
    function ifconfig() {
      command grc --colour=auto ifconfig "$@"
    }
  fi

  if (( $+commands[mount] )); then
    function mount() {
      command grc --colour=auto mount "$@"
    }
  fi

  if (( $+commands[mtr] )); then
    function mtr() {
      command grc --colour=auto mtr "$@"
    }
  fi

  if (( $+commands[netstat] )); then
    function netstat() {
      command grc --colour=auto netstat "$@"
    }
  fi

  if (( $+commands[ping] )); then
    function ping() {
      command grc --colour=auto ping "$@"
    }
  fi

  if (( $+commands[ping6] )); then
    function ping6() {
      command grc --colour=auto ping6 "$@"
    }
  fi

  if (( $+commands[ps] )); then
    function ps() {
      command grc --colour=auto ps "$@"
    }
  fi

  if (( $+commands[pstree] )); then
    function pstree() {
      command grc --colour=auto pstree "$@"
    }
  fi

  if (( $+commands[traceroute] )); then
    function traceroute() {
      command grc --colour=auto traceroute "$@"
    }
  fi
fi

# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]
