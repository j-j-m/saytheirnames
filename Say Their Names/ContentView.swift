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
                    VStack {
                        HStack {
                            Text(incident.victimName).bold()
                            if (incident.victimName != "Name withheld by police") {
                                Button("Say \(incident.victimGender == "Male" ? "his" : incident.victimGender == "Female" ? "her" : "their") name", action: {
                                    let utterance = AVSpeechUtterance(string: incident.victimName)
                                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                    utterance.rate = 0.5

                                    let synthesizer = AVSpeechSynthesizer()
                                    synthesizer.speak(utterance)
                                })
                            }
                        }
                        Text("Killed by \(incident.responsibleAgency) in \(incident.city), \(incident.state)")
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
