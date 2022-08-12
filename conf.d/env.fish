function __login -d 'Registe login env';
  set -gx PAGER less
  if type -q nvim
    set -gx EDITOR nvim
  end
  if type -q fnm
    fnm env --use-on-cd | source
  end
  if type -q pyenv
    pyenv init --path | source
  end
  if type -q rbenv
    rbenv init - fish | source
  end
end
if status is-login
  __login
end

if status is-interactive
  if not status is-login
    __login
  end

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
