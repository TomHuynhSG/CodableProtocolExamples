//
//  ContentView.swift
//  CodableTesting
//
//  Created by Tom Huynh on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // A tip to debugging using print statements right inside the view
        var _ = print("All Students:")
        var _ = print(myStudent)
        var _ = print("----------------------------")
        var _ = print("Student 1:")
        var _ = print(myStudent[0])
        var _ = print(myStudent[0].address)
        var _ = print("----------------------------")
        var _ = print("Student 2:")
        var _ = print(myStudent[1])
        var _ = print(myStudent[1].address)
        var _ = print("----------------------------")
        var _ = print("Encode the Student Struct back to Json String:")
        var _ = print(studentJsonString)
        
        NavigationView{
            // Loop through student struct
            List(myStudent, id: \.self.name){ student in
                
                NavigationLink {
                    VStack{
                        Text(student.name)
                        Text(student.email)
                        Text("\(student.age)")
                        Text("\(student.address.number)")
                        Text(student.address.street)
                    }
                } label: {
                    Text(student.name)
                }

            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
