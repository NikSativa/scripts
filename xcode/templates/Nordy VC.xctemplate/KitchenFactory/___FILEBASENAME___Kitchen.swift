import Foundation

import NBFoundation

enum ___VARIABLE_productName___ViewEvent {
    case empty
}

enum ___VARIABLE_productName___Command {
    case empty
}

class ___FILEBASENAMEASIDENTIFIER___: Kitchen {
    typealias Command = ___VARIABLE_productName___Command
    typealias ViewEvent = ___VARIABLE_productName___ViewEvent

    weak var delegate: AnyKitchenDelegate<___VARIABLE_productName___Command>?
    
    func receive(event: ___VARIABLE_productName___ViewEvent) {
        switch event {
        case .empty:
            break
        }
    }
}
