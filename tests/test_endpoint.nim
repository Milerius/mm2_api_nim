# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import mm2_api_nim/endpoint

test "can change port":
  check mm2Endpoint == "http://127.0.0.1:7783"
  setPort(7777)
  check mm2Endpoint == "http://127.0.0.1:7777"