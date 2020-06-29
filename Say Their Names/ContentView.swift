//
//  ContentView.swift
//  Say Their Names
//
//  Created by Ian McFarland on 6/28/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let shootingIncidents = Bundle.main.decode([IncidentRecord].self, from: "shooting-incidents")

    var body: some View {
        ScrollView {
            VStack {
                ForEach(getPaginatedList(offset: 0), id: \.id) { incident in
                    HStack {
                        VStack {
                            Text(incident.victimName).bold()
                            Text("Killed by \(incident.responsibleAgency) in \(incident.city), \(incident.state)")
                        }
                        if (incident.victimName != "Name withheld by police") {
                            Button("Say name", action: {
                                let utterance = AVSpeechUtterance(string: incident.victimName)
                                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                utterance.rate = 0.1

                                let synthesizer = AVSpeechSynthesizer()
                                synthesizer.speak(utterance)
                            })
                        }
                    }
                }
            }
        }
    }
    
    func getPaginatedList(offset: Int) -> ArraySlice<IncidentRecord> {
        return self.shootingIncidents[offset..<(offset+100)]
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
