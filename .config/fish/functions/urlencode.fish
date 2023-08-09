function urlencode
    python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(input(), safe=""))'
end
