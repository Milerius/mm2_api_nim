import os

var mm2Userpass*: string = os.getEnv("MM2_PASSPHRASE")

proc setMM2Userpass*(userpass: string) =
    mm2Userpass = userpass
    