//
//  Reactor.swift
//  ReactorKit_RxSwift_Example
//
//  Created by Артем on 24.12.2021.
//

import ReactorKit
import RxSwift

final class TransportReactor: Reactor {
    
    // Действие
    enum Action {
        case car
        case plahe
        case ship
    }


    enum Mutation {
        case tapCar
        case tapPlane
        case tapShip
        case setLoading(Bool)
    }

   // Состояние
    struct State {
        var textTransport: String
        var isLoading: Bool
    }

    let initialState: State

    init() {
        self.initialState = State(
            textTransport: "",
            isLoading: false
        )
    }

    // Action -> Mutation  Обработка действий
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .car:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.tapCar)
                    .delay(.seconds(1), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false)),

            ])
        case .plahe:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.tapPlane)
                    .delay(.seconds(1), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false)),
            ])
        case .ship:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
            Observable.just(Mutation.tapShip)
                    .delay(.seconds(1), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false)),
            ])
        }
    }

    // Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {

        case .tapCar:
            state.textTransport = "Нажали Car"
        case .tapPlane:
            state.textTransport = "Нажали Plane"
        case .tapShip:
            state.textTransport = "Нажали Ship"
        case .setLoading(let val):
            state.isLoading = val
        }
        return state
    }
}
