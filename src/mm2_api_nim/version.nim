import httpclient
import json
import options
import jsonschema
import common
import client
import endpoint

jsonSchema:
  VersionRequestParams:
    "method": string
    "userpass": string
  VersionAnswerSuccess:
    "result": string
    "datetime": string

export VersionRequestParams
export VersionAnswerSuccess
export `[]`
export `unsafeAccess`
export `unsafeOptAccess`
export `create`
export `isValid`

type VersionAnswer* = object
        success*: Option[VersionAnswerSuccess]
        error*:  Option[string]

proc rpcVersion*(req: VersionRequestParams): VersionAnswer =
    let jsonData = req.JsonNode
    templateRequest(jsonData, "version")
    try:
        let json = mm2HttpClient.postContent(mm2Endpoint, body = $jsonData).parseJson()
        if json.isValid(VersionAnswerSuccess):
            result.success = some(VersionAnswerSuccess(json))
    except HttpRequestError as e:
        echo "Got exception HttpRequestError: ", e.msg
        result.error = some(e.msg)
    except OSError as e:
        echo "Got exception OSError: ", e.msg
        result.error = some(e.msg)