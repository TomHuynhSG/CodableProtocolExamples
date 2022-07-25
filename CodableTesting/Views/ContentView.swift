//
//  ContentView.swift
//  CodableTesting
//
//  Created by Tom Huynh on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Debugging using print statements
        var _ = print("All Students:")
        var _ = print(myStudent)
        var _ = print("Student 1:")
        var _ = print(myStudent[0])
        var _ = print(myStudent[0].address)
        var _ = print("Student 2:")
        var _ = print(myStudent[1])
        var _ = print(myStudent[1].address)
        
        // Loop through student struct
        List(myStudent, id: \.self.name){ student in
            Text(student.name)
        }
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
