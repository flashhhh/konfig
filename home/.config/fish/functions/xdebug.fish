function xdebug-enable
  set -xg XDEBUG_CONFIG "idekey=abc remote_enable=1 remote_host=127.0.0.1 remote_port=14090 default_enable=1 remote_connect_back=0 remote_handler=dbgp remote_mode=req"
  set -xg PHP_IDE_CONFIG "serverName=server"
end

function xdebug-disable
  set -e XDEBUG_CONFIG
  set -e PHP_IDE_CONFIG
end
