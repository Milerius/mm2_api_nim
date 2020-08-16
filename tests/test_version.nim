import unittest
import options
import json

import mm2_api_nim/userpass
import mm2_api_nim/version

test "sync rpc version":
    setMM2Userpass("default_mm2_passphrase")    
    var request = create(VersionRequestParams, "", "")
    var answer = rpcVersion(request)
    check not answer.error.isSome
    check answer.success.isSome
    echo answer.success.get()["result"].getStr()