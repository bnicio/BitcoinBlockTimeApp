//
//  SettingsView.swift
//  block time
//
//  Created by Benicio Nell on 09.02.23.
//

import SwiftUI

struct SettingsView: View {
    @FocusState private var refreshTimeIsFocused: Bool
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var settings: Settings
    @State var rawInput: String = ""
    
    var body: some View {
        
        VStack{
            
            Button(action: flipTheme) {
                Image(systemName: colorScheme == .dark ? "sun.max" : "moon")
                    .padding(.top, 50.0)
            }
        
            Spacer()
            
            HStack{
                
                Text("Refresh time in seconds:")
                TextField(
                    String(settings.refreshTimer),
                    text: $rawInput
                    )
                .frame(width: 36.0)
                .keyboardType(.numberPad)
                .focused($refreshTimeIsFocused)
                .environmentObject(settings)
            }
            
            Spacer()
            
            Button(action: save) {
                Text("Save")
            }
            Spacer()
        }
    }
    
    func save() {
        if let i = Int(rawInput){
            settings.refreshTimer = i
        }
        refreshTimeIsFocused = false
    }
    
    func flipTheme () {
        
    }
}

class Settings: ObservableObject {
    @Published var refreshTimer = 4
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(Settings())
    }
}
