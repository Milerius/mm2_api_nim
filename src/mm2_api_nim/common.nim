import json
import userpass

proc templateRequest*(jsonData: JsonNode, method_name: string) =
    jsonData["method"] = method_name.newJString
    jsonData["userpass"] = mm2Userpass.newJString