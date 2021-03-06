Class opc.ua.rest.data.spec Extends %REST.Spec
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger": "2.0",
  "info": {
    "description": "This is an OPC UA server callback service of InterSystems. This functionality is used when data notifications from subscriptions needs to be inserted in InterSystems",
    "version": "1.0.0",
    "title": "OPC UA subscription processing endpoints",
    "contact": {
      "email": "marco.den.hartog@itvisors.com"
    },
    "license": {
      "name": "Apache 2.0",
      "url": "http://www.apache.org/licenses/LICENSE-2.0.html"
    }
  },
  "host": "localhost:52773",
  "basePath": "/opc/ua",
  "tags": [
    {
      "name": "Datachange notification",
      "description": "Processing a data change notification"
    }
  ],
  "schemes": [
    "https",
    "http"
  ],
  "paths": {
    "/equipment/{equipment}/{configuration}": {
      "post": {
        "tags": [
          "Datachange notification"
        ],
        "summary": "Add a data change notification of the equipment",
        "operationId": "addDataChangeNotification",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "equipment",
            "in": "path",
            "description": "Name of the equipment",
            "required": true,
            "type": "string",
            "maxLength": 50
          },
          {
            "name": "configuration",
            "in": "path",
            "description": "Name of the active configuration",
            "required": true,
            "type": "string",
            "maxLength": 50
          },
          {
            "in": "body",
            "name": "body",
            "description": "Data notification to be stored for specified equipment",
            "required": true,
            "schema": {
              "$ref": "#/definitions/DataChangeNotification"
            }
          }
        ],
        "responses": {
          "201": {
            "description": "Created"
          },
          "404": {
            "description": "Not found"
          },
          "405": {
            "description": "Invalid input"
          }
        }
      }
    }
  },
  "definitions": {
    "DataChangeNotification": {
      "type": "object",
      "properties": {
        "timestamp": {
          "type": "string",
          "format": "date-time"
        },
        "nodeid": {
          "type": "string",
          "maxLength": 50
        },
        "nodevalue": {
          "type": "object"
        }
      },
      "required": [
        "timestamp",
        "nodeid",
        "nodevalue"
      ]
    }
  }
}
}

}
