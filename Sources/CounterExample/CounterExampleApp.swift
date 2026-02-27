import DefaultBackend
import SwiftCrossUI

#if canImport(SwiftBundlerRuntime)
    import SwiftBundlerRuntime
#endif

@main
@HotReloadable
struct CounterApp: App {
    @State var count = 0

    var body: some Scene {
        WindowGroup("CounterExample: \(count)") {
            #hotReloadable {
                VStack {
                    HStack(spacing: 20) {
                        Button("-") {
                            count -= 1
                        }
                        Text("Count: \(count)")
                            .bold()
                        Button("+") {
                            count += 1
                        }
                    }
                    .padding()
                }
                .background(Color.yellow)
            }
        }
        .defaultSize(width: 400, height: 200)
    }
}