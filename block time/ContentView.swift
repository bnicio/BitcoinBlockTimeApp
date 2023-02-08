//
//  ContentView.swift
//  block time
//
//  Created by Benicio Nell on 08.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var data = ""
    
    var body: some View {
        VStack {
            BlockTipHeightView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
