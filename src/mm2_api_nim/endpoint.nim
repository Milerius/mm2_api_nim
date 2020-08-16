var mm2Endpoint* = "http://127.0.0.1:7783"

proc setPort*(port: uint) =
    mm2Endpoint = "http://127.0.0.1:" & $port