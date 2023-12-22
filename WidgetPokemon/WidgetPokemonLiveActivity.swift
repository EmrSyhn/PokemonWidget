//
//  WidgetPokemonLiveActivity.swift
//  WidgetPokemon
//
//  Created by Emir Seyhan on 22.12.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetPokemonAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetPokemonLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetPokemonAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetPokemonAttributes {
    fileprivate static var preview: WidgetPokemonAttributes {
        WidgetPokemonAttributes(name: "World")
    }
}

extension WidgetPokemonAttributes.ContentState {
    fileprivate static var smiley: WidgetPokemonAttributes.ContentState {
        WidgetPokemonAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetPokemonAttributes.ContentState {
         WidgetPokemonAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetPokemonAttributes.preview) {
   WidgetPokemonLiveActivity()
} contentStates: {
    WidgetPokemonAttributes.ContentState.smiley
    WidgetPokemonAttributes.ContentState.starEyes
}
