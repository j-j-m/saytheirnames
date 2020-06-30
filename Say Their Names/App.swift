//
//  App.swift
//  Say Their Names
//
//  Created by Jacob Martin on 6/29/20.
//

import Foundation
import ComposableArchitecture
import Combine

//MARK: - State

struct AppState: Equatable {
    var incidents: [IncidentRecord] = []
}

//MARK: - Actions

enum AppAction: Equatable {
    case loadIncedents
    case incedentsResponse(Result<[IncidentRecord], IncedentsApiError>)
}

//MARK: - Environment

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var incedents: () -> Effect<[IncidentRecord], IncedentsApiError>
}

let appStore = Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnvironment(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        incedents: localIncidents
    )
)

let appReducer: Reducer<AppState, AppAction, AppEnvironment> =
    Reducer<AppState, AppAction, AppEnvironment> {
        state, action, environment in
        switch action {
        case .loadIncedents:
            return environment
                .incedents()
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(AppAction.incedentsResponse)
            
        case .incedentsResponse(let response):
            if case .success(let incedents) = response {
                state.incidents = incedents
            }
            return .none
        }
}
