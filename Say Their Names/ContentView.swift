//
//  ContentView.swift
//  Say Their Names
//
//  Created by Ian McFarland on 6/28/20.
//

import SwiftUI

struct ContentView: View {
    let shootingIncidents = Bundle.main.decode([IncidentRecord].self, from: "shooting-incidents")



    var body: some View {
        Text("Hello, \(shootingIncidents.first!.victimName)").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
