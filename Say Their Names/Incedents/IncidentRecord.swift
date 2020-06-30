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
