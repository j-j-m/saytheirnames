//
//  IncedentService.swift
//  Say Their Names
//
//  Created by Jacob Martin on 6/29/20.
//

import ComposableArchitecture
import Combine

private let jsonDecoder: JSONDecoder = {
    let d = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    d.dateDecodingStrategy = .formatted(formatter)
    return d
}()

struct IncedentsApiError: Error, Equatable {}

func localIncidents() -> Effect<[IncidentRecord], IncedentsApiError> {
    return Just(Bundle.main.decode([IncidentRecord].self, from: "shooting-incidents"))
        .mapError { _ in IncedentsApiError() }
        .eraseToEffect()
}

// This is the "live" incedents dependency that reaches into the outside world to fetch trivia.
// Typically this live implementation of the dependency would live in its own module so that the
// main feature doesn't need to compile it.

//func liveIncidents() -> Effect<[IncidentRecord], IncedentsApiError> {
//    return URLSession.shared.dataTaskPublisher(for: URL(string: "https://incedents-api.com")!)
//        .map { data, _ in return data }
//        .decode(type: [IncidentRecord].self, decoder: jsonDecoder)
//        .catch { _ in
//            // in the event of an error just return an empty array
//            Just([])
//                .delay(for: 1, scheduler: DispatchQueue.main)
//    }
//    .mapError { _ in IncedentsApiError() }
//    .eraseToEffect()
//}
