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
    let nameSayer = NameSayer()

    var body: some View {
        ScrollView {
            VStack {
                Button("Say their names!", action: {
                    saySomeNames(incidents: shootingIncidents, howMany: 20)
                })
                Spacer()
                ForEach(getPaginatedList(offset: 0), id: \.id) { incident in
                    VStack {
                        HStack {
                            Text(incident.victimName).bold()
                            if (incident.victimName != "Name withheld by police") {
                                Button("Say \(incident.victimGender == "Male" ? "his" : incident.victimGender == "Female" ? "her" : "their") name", action: {
                                    say(whatToSay: incident.victimName)
                                })
                            }
                        }
                        Text("Killed by \(incident.responsibleAgency) in \(incident.city), \(incident.state)")
                    }
                }
            }
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
