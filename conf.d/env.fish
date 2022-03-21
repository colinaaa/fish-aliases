if status is-login
  set -gx PAGER less
  if type -q nvim
    set -gx EDITOR nvim
  end
  if type -q fnm
    fnm env | source
  end
  if type -q pyenv
    pyenv init --path | source
  end
  if type -q rbenv
    rbenv init - fish | source
  end
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  if type -q pyenv
    pyenv init - | source
  end
  if type -q zoxide
    zoxide init fish | source
  end
  if type -q starship
    starship init fish | source
  end
end
