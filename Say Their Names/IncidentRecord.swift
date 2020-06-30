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
    @StringRepresentation private(set) var victimAge: Int?
    let victimGender: String
    let victimRace: String
    @StringRepresentation private(set) var imageURL: URL?
    @StringRepresentation private(set) var incidentDate: Date?
    let streetAddress: String
    let city: String
    let state: String
    @StringRepresentation private(set) var zipcode: Int?
    let responsibleAgency: String
    let causeOfDeath: String
    let briefDescription: String
    let officialDisposition: String
    let criminalCharges: String
    @StringRepresentation private(set) var newsURL: URL?
    let symptomsOfMentalIllness: String
    let reportedArmedState: String
    let allegedWeapon: String
    let allegedThreatLevel: String
    let fleeingType: String
    let bodyCameraActive: String
    @StringRepresentation private(set) var wapoId: Int?
    let offDutyKilling: String
    let geographyCategory: String
    @StringRepresentation private(set) var idInfo: Int?
    
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
