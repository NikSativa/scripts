import Foundation

extension ___FILEBASENAMEASIDENTIFIER___ {
    enum ViewEvent {
        case empty
    }

    enum Command {
        case empty
    }
}

class ___FILEBASENAMEASIDENTIFIER___: NManager {
    weak var delegate: NAnyManagerDelegate<Command>!
    
    func receive(event: ViewEvent) {
        switch event {
        case .empty:
            break
        }
    }
}
