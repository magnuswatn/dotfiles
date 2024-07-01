function activateSecretEnv
  if not set -l secretEnv "$(passage $argv[1]/secret-env)"
    return 1
  end
  fish -C "$secretEnv | source"
end
