//
//  ContentView.swift
//  block time
//
//  Created by Benicio Nell on 08.02.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = Settings()
    @StateObject var blockTip = BlockTip()
    
    var body: some View {
        
        TabView {
            BlockTipHeightView()
                .tabItem {
                    Image(systemName: "deskclock")
                    Text("Block time")
            }
            ProgressThingyView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("More info")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .environmentObject(settings)
        .environmentObject(blockTip)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
