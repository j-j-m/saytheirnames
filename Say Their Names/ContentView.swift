//
//  ContentView.swift
//  Say Their Names
//
//  Created by Ian McFarland on 6/28/20.
//

import SwiftUI
import AVFoundation
import ComposableArchitecture

struct ContentView: View {
    
    var store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.incidents.isEmpty {
                Text("Loading...")
            } else {
                List {
                    Text("Say Their Names").font(.largeTitle)
                    ForEach(viewStore.incidents, id: \.id) { incident in
                        VStack(alignment: .leading) {
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
            Spacer()
            Button("Say their names!", action: {
                saySomeNames(incidents: shootingIncidents, howMany: 20)
            })
        }
    }
    
    func say(whatToSay: String) {
        let utterance = AVSpeechUtterance(string: whatToSay)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func saySomeNames(incidents: [IncidentRecord], howMany: Int) {
        let range  = incidents.count - howMany
        let offset = Int.random(in: 0 ..< range)
        let limit = offset + howMany
        
        sayTheirNames(incidents: incidents[offset ..< limit])

    }
    
    func sayTheirNames(incidents: ArraySlice<IncidentRecord>) {
        var stuffToSay = ""
        incidents.forEach { incident in
            if (incident.victimName != "Name withheld by police") {
                stuffToSay = "\(stuffToSay) Say \(incident.victimGender == "Male" ? "his" : incident.victimGender == "Female" ? "her" : "their") name! \(incident.victimName)!"
            }
        }
        say(whatToSay: stuffToSay)
    }
    
    func getPaginatedList(offset: Int) -> ArraySlice<IncidentRecord> {
        return self.shootingIncidents[offset..<(offset+100)]
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
