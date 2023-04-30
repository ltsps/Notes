import base64
#string='S2FNMO7WPZN4UBDZ'
#secretKey = base64.b32encode(string.encode(encoding="utf-8"))
#print(secretKey)
#b'ORUGS4ZANFZSA4ZAON2HE2LOM4======'
secretKey='S2xxxxxxxxxxxx'
import pyotp
totp = pyotp.TOTP(secretKey)
key=totp.now()
print(key)
#'863055'
#print(totp.verify(540684))
#True
