//
//  EventRecord.swift
//  Swifter
//
//  Created by Ian McFarland on 6/27/20.
//

import Foundation
import Network

struct IncidentRecord: Codable, Hashable {
    let id = UUID()
    let victimName: String
    let victimAge: Int?
    let victimGender: String
    let victimRace: String
    let imageURL: URL?
    let incidentDate: Date?
    let streetAddress: String
    let city: String
    let state: String
    let zipcode: String
    let responsibleAgency: String
//    let causeOfDeath: String
//    let briefDescription: String
//    let officialDisposition: String
//    let criminalCharges: String
    let newsURL: URL?
//    let symptomsOfMentalIllness: String
//    let reportedArmedState: String
//    let allegedWeapon: String
//    let allegedThreatLevel: String
//    let fleeingType: String
//    let bodyCameraActive: String
//    let wapoId: Int?
//    let offDutyKilling: String
//    let geographyCategory: String
//    let idInfo: String
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        imageURL = try values.decode(URL.self, forKey: .imageURL)
//    }

//    func getImageURL() -> URL? {
//        guard let url = URL(string: self.imageURL) else { return nil }
//        return url
//    }
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.victimName = try map.decode(String.self, forKey: .victimName)
        } catch {
            self.victimName = ""
        }
        do {
            self.victimAge = try map.decode(Int.self, forKey: .victimAge)
        } catch {
            self.victimAge = nil
        }
        do {
            self.victimGender = try map.decode(String.self, forKey: .victimGender)
        } catch {
            self.victimGender = "Unknown"
        }
        do {
            self.victimRace = try map.decode(String.self, forKey: .victimRace)
        } catch {
            self.victimRace = "Unknown"
        }
        do {
            self.imageURL = try map.decode(URL.self, forKey: .imageURL)
        } catch {
            self.imageURL = nil
        }
        do {
            self.incidentDate = try map.decode(Date.self, forKey: .incidentDate)
        } catch {
            self.incidentDate = nil
        }
        do {
            self.streetAddress = try map.decode(String.self, forKey: .streetAddress)
        } catch {
            self.streetAddress = "Unknown"
        }
        do {
            self.city = try map.decode(String.self, forKey: .city)
        } catch {
            self.city = "Unknown"
        }
        do {
            self.state = try map.decode(String.self, forKey: .state)
        } catch {
            self.state = "Unknown"
        }
        do {
            self.zipcode = try map.decode(String.self, forKey: .zipcode)
        } catch {
            self.zipcode = "Unknown"
        }
        do {
            self.responsibleAgency = try map.decode(String.self, forKey: .responsibleAgency)
        } catch {
            self.responsibleAgency = "unknown agency"
        }
        do {
            self.newsURL = try map.decode(URL.self, forKey: .newsURL)
        } catch {
            self.newsURL = nil
        }
    }
}

//"victim_name": "Chazz Hailey",
//"victim_age": 22,
//"fvictim_gender": "Male",
//"victim_race": "Pacific Islander",
//"imageURL": "",
//"incident_date": "6/23/20",
//"street_address": "1900 Pebblebrook Lane",
//"city": "Sherman",
//"state": "TX",
//"zipcode": 75092,
//"county": "Grayson",
//"responsible_agency": "Sherman Police Department",
//"cause_of_death": "Gunshot",
//"brief_description": "At approximately 5:11 a.m. Sherman police received a call from a girl who reported that her father was being stabbed by a family member. When police arrived, Chazz Hailey went into a bathroom and when police came in, they found him stabbing an adult male and the girl. They shot and killed Hailey. The man died, and the girl was seriously injured.",
//"official_disposition": "Pending investigation/No Known Charges",
//"criminal_charges": "No known charges",
//"newsURL": "https://www.heralddemocrat.com/news/20200623/texas-rangers-investigate-fatal-officer-involved-shooting-in-sherman",
//"sx_of_mental_ilness": "No",
//"reported_armed_state": "Allegedly Armed",
//"alleged_weapon": "knife",
//"alleged_threat_level": "attack",
//"fleeing_type": "",
//"body_camera_active": "",
//"wapo_id": "",
//"off_duty_killing": "",
//"geography_category": "",
//"id_info": ""
