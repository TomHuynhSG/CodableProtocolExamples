//
//  ModelData.swift
//  CodableTesting
//
//  Created by Tom Huynh on 7/25/22.
//

import Foundation

// MARK: Json String examples

var simpleJsonString="""
{
   "name" : "Jerry",
   "email" : "jerry@rmit.edu.vn",
   "age": 27
}
"""

var jsonArrayString="""
[
{
    "name" : "Charles",
    "email" : "charles@rmit.edu.vn",
    "age": 22
}, {
   "name" : "Jerry",
   "email" : "jerry@rmit.edu.vn",
   "age": 27
},
]
"""

var jsonNestedArrayString="""
[
  {
    "name": "Charles",
    "email": "charles@rmit.edu.vn",
    "age": 22,
    "address": {
      "number": 375,
      "street": "Hai Ba Trung"
    }
  },
  {
    "name": "Jerry",
    "email": "jerry@rmit.edu.vn",
    "age": 27,
    "address": {
      "number": 136,
      "street": "Nguyen Van Linh"
    }
  }
]
"""


// MARK: json String -> Struct (Decoding)

// How to decode a json string into a struct
func decodeJsonFromString(inputJsonString: String) -> [Student] {
    let data = Data(inputJsonString.utf8)
    do {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([Student].self, from: data)
        return decoded
    } catch let error {
        fatalError("Failed to decode JSON: \(error)")
    }
}

//var myStudent = decodeJsonFromString(inputJsonString: jsonNestedArrayString)


// MARK: json file -> Struct (Decoding)

var studentJsonFileName = "students.json"

// How to decode a json file into a struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Student] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Student].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Student]
}

var myStudent = decodeJsonFromJsonFile(jsonFileName: studentJsonFileName)



// MARK: a struct -> Json string (Encoding)

// How to encode a struct to json string
func encodeStructToJsonString(inputStruct: [Student]) -> String {
    do {
       let data = try JSONEncoder().encode(inputStruct)
       if let jsonString = String(data: data, encoding: .utf8) {
           return jsonString
       }
    } catch let error {
        fatalError("Failed to encode JSON: \(error)")
    }
    return ""
}

var studentJsonString = encodeStructToJsonString(inputStruct: myStudent)
