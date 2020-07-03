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
            if true {
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
        }
    }
    
    //    func getPaginatedList(offset: Int) -> ArraySlice<IncidentRecord> {
    //        return self.viewStore.shootingIncidents[offset..<(offset+100)]
    //    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
