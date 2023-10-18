//
//  ContentView.swift
//  MunchMatch
//
//  Created by Dylan  Lim on 10/17/23.
//

import SwiftUI
 
//Starting Page

struct ContentView: View {
    @State private var speed = 2.0
    @State private var isEditing = false
    var body: some View {
        ZStack{
            Color(red: (244/255), green: (237/255), blue: (235/255))
                        .ignoresSafeArea()
            VStack{
                Slider(
                        value: $speed,
                        in: 2...10,
                        step: 1
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("2")
                    } maximumValueLabel: {
                        Text("10")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                Text("Party Size: \(speed)")
                        .foregroundColor(isEditing ? .red : .blue)
                
                Button("Create A Party") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

