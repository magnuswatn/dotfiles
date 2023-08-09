function proxy -a 1
    if [ "$1" = on ]
        set -gx http_proxy $PROXY
        set -gx https_proxy $PROXY
    else if [ "$1" = off ]
        set -e http_proxy
        set -e https_proxy
    else
        echo "Unknown argument. Must be \"on\" or \"off\"."
    end
end
