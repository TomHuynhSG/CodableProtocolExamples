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

// MARK: json String -> Struct

// How to decode a json string into a struct
func decodeJsonFromString(inputJsonString: String) -> [Student] {
    let data = Data(inputJsonString.utf8)
    
    do {
        let decoded = try JSONDecoder().decode([Student].self, from: data)
        return decoded
    } catch let err {
        fatalError("Failed to encode JSON: \(err)")
    }
}

//var myStudent = decodeJsonFromString(inputJsonString: jsonNestedArrayString)


// MARK: json file -> Struct

var studentJsonFileName = "students.json"

// How to decode a json file URL into an array of struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Student] {
    let data: Data

    guard let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil)
        else {
            fatalError("Couldn't find \(jsonFileName) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(jsonFileName) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Student].self, from: data)
    } catch {
        fatalError("Couldn't parse \([jsonFileName]) as \([Student].self):\n\(error)")
    }
}

//var myStudent = decodeJsonFromJsonFile(jsonFileName: studentJsonFileName)


// MARK: json file URL -> Struct

// Json File URL Example
var jsonURL = "https://jsonkeeper.com/b/4959"

// How to decode a json file URL into an array of struct
func decodeJsonFromURL(inputJsonURL: String) -> [Student] {
    if let url = URL(string: jsonURL) {
        if let data = try? Data(contentsOf: url) {
            do {
                let decoded = try JSONDecoder().decode([Student].self, from: data)
                return decoded
            } catch let err {
                fatalError("Failed to encode JSON: \(err)")
            }
        }
    }
    return [ ] as [Student]
}

var myStudent = decodeJsonFromURL(inputJsonURL: jsonURL)



// MARK: extra functions


// How to encode a struct to json string
func encodeStructToJsonString(inputStruct: [Student]) -> String {
    do {
       let data = try JSONEncoder().encode(inputStruct)
       // Print the encoded JSON data
       if let jsonString = String(data: data, encoding: .utf8) {
           return jsonString
       }
    } catch let err {
        fatalError("Failed to encode JSON: \(err)")
    }
    return ""
}

var studentJsonString = encodeStructToJsonString(inputStruct: myStudent)
