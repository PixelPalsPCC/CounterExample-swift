import DefaultBackend
import Foundation  // for sin, cos
import SwiftCrossUI

#if canImport(SwiftBundlerRuntime)
    import SwiftBundlerRuntime
#endif

#if canImport(SwiftBundlerRuntime)
    import SwiftBundlerRuntime
#endif

struct ArcShape: StyledShape {
    var startAngle: Double
    var endAngle: Double
    var clockwise: Bool

    var strokeColor: Color? = Color.black
    let fillColor: Color? = nil
    let strokeStyle: StrokeStyle? = StrokeStyle(width: 5.0)

    func path(in bounds: Path.Rect) -> Path {
        Path()
            .addArc(
                center: bounds.center,
                radius: min(bounds.width, bounds.height) / 2.0 - 2.5,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise
            )
    }

    func size(fitting proposal: SIMD2<Int>) -> ViewSize {
        let diameter = Double(max(11, min(proposal.x, proposal.y)))
        return ViewSize(diameter, diameter)
    }
}

@main
@HotReloadable
struct CounterApp: App {
    @State var count: Double = 3

    var body: some Scene {
        WindowGroup("CounterExample: \(count)") {
            #hotReloadable {

                ZStack {
                    HStack {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 400, height: 400)
                        Spacer()
                    }
                    HStack {
                        Circle()
                            .stroke(Color.red)
                            .frame(width: 400, height: 400)
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Spacer().frame(height: 105)
                        HStack(spacing: 0) {
                            Spacer().frame(width: 133)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .frame(width: 50, height: 50)
                            Spacer().frame(width: 62)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .frame(width: 50, height: 50)
                            Spacer().frame(width: 133)
                        }
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Spacer().frame(height: 200)
                        VStack {

                            ArcShape(
                                startAngle: .pi,
                                endAngle: .pi,
                                clockwise: true
                            )
                        }
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Spacer().frame(height: 200)
                        VStack {

                            ArcShape(
                                startAngle: .pi * abs(count - 1) / 6,
                                endAngle: .pi * abs(count + 1) / 6,
                                clockwise: true
                            )
                        }
                        Spacer()
                    }

                    VStack(spacing: 0) {
                        Spacer().frame(height: 105)
                        VStack {
                            HStack(spacing: 50) {
                                Spacer()
                                Button("*") {
                                    if count < 5 {
                                        count += 1
                                    }
                                }
                                .frame(width: 60, height: 60)
                                .font(.system(size: 20))
                                Button("*") {
                                    if count > 1 {
                                        count -= 1
                                    }
                                }
                                .frame(width: 60, height: 60)
                                .font(.system(size: 20))
                                Spacer()
                            }
                            Spacer().frame(width: 300, height: 205)
                            HStack(spacing: 300) {
                                Text("Count: \(count)")
                                    .foregroundColor(SwiftCrossUI.Color.white)
                            }
                            .padding()
                        }
                        Spacer()
                    }
                }
                .frame(height: 400)
                .background(Color.black)
            }
        }
        .defaultSize(width: 400, height: 400)
    }
}
