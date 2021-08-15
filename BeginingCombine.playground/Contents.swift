import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var subscription: Cancellable? = Timer.publish(every: 0.1, on: .main, in: .common)
    .autoconnect()
    .print("stream")
    .throttle(for: .seconds(1), scheduler: DispatchQueue.main, latest: true)
    .scan(0, { (count , _) in
        return count + 1
    })
    .filter({ $0 > 5 && $0 < 15 })
    .sink { output in
        print("finished stream with \(output)")
    } receiveValue: { value in
        print("receive value \(value)")
    }

RunLoop.main.schedule(after: .init(Date(timeIntervalSinceNow: 20))) {
    print("--- cancel subscription")
    //subscription.cancel()
    subscription = nil
}


