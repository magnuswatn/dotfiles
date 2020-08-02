Set-PSReadLineOption -EditMode Emacs

function mkchdir($name) {
    mkdir $name; cd $name
}

function prompt {
    "PS $(Split-Path -Leaf $ExecutionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
}

function proxy($argument) {
    if ($argument -eq "on") {
        $env:http_proxy=$proxy
        $env:https_proxy=$proxy
    } elseif ($argument -eq "off") {
        $env:http_proxy=""
        $env:https_proxy=""
    } else {
        echo "Unkown argument. Must be `"on`" or `"off`"."
    }
}
