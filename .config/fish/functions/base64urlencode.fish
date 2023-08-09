function base64urlencode
    python3 -c '
import sys
from base64 import urlsafe_b64encode
sys.stdout.buffer.write(urlsafe_b64encode(sys.stdin.buffer.read()))
'
end
