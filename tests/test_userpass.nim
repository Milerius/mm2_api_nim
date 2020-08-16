import unittest

import mm2_api_nim/userpass

test "can change userpass":
  check mm2Userpass == ""
  setMM2Userpass("mm2_default_userpass")
  check mm2Userpass == "mm2_default_userpass"
