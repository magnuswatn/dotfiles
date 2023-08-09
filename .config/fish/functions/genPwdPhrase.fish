function genPwdPhrase
    echo '
import secrets
from pathlib import Path

words = [
    wrd
    for wrd in Path("/usr/share/dict/words")
    .read_text(encoding="ISO-8859-1")
    .splitlines()
]
print(" ".join(secrets.choice(words) for _ in range(6)))
' | python3
end
