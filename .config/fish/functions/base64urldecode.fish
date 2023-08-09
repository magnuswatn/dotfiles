function base64urldecode
    python3 -c '
import sys
from base64 import urlsafe_b64decode
data = input()
num_padding = (4 - len(data) % 4) % 4
sys.stdout.buffer.write(urlsafe_b64decode(data + "=" * num_padding))
'
end
