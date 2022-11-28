if command --query code
  exit
end

function code --description 'Open VSCode in Remote SSH'
  set --local script $(echo ~/.vscode-server/bin/*/bin/remote-cli/code) 

  if ! test -x $script
    echo 'VSCode remote script not found'
    return
  end

  set --local uid $(id -u)
  set --local socket $(ls /run/user/$uid/vscode-ipc-* | head -1)

  if test -z socket
    echo 'VSCode IPC socket not found. Please open at least one VSCode remote instance'
    return
  end

  set --export VSCODE_IPC_HOOK_CLI $socket

  $script $argv
end
