//
//  HapticEffects.swift
//  Project-10-SwiftUI-order-cupcake
//
//  Created by Kevin Cuadros on 2/01/25.
//

import SwiftUI
import CoreHaptics

struct HapticEffects: View {
    
    @State private var counter = 0
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Button("Tap Count \(counter)") {
            counter += 1
            complexSuccess()
        }
        .onAppear(perform: prepareHaptics)
//        .sensoryFeedback(.error, trigger: counter)
//        .sensoryFeedback(
//            .impact(flexibility: .soft, intensity: 0.5),
//            trigger: counter
//        )
//        .sensoryFeedback(
//            .impact(weight: .heavy, intensity: 1),
//            trigger: counter
//        )
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error \(error.localizedDescription)")
        }
        
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            
            let intensity = CHHapticEventParameter(
                parameterID: .hapticIntensity,
                value: Float(i)
            )
            let sharpness = CHHapticEventParameter(
                parameterID: .hapticSharpness,
                value: Float(i)
            )
            let event = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: i
            )
            events.append(event)
        }
        for i in stride(from: 0, to: 1, by: 0.1) {
            
            let intensity = CHHapticEventParameter(
                parameterID: .hapticIntensity,
                value: Float(1 - i)
            )
            let sharpness = CHHapticEventParameter(
                parameterID: .hapticSharpness,
                value: Float(1 - i)
            )
            let event = CHHapticEvent(
                eventType: .hapticTransient,
                parameters: [intensity, sharpness],
                relativeTime: 1 + i
            )
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try? engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    HapticEffects()
}
