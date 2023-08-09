function genPwd
    echo '
import secrets
import string

chars = string.ascii_uppercase + string.ascii_lowercase + string.digits
print(
    "".join(
        secrets.choice(chars) for _ in range(32)
    )
)
' | python3
end
