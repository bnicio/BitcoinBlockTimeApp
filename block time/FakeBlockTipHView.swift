//
//  FakeBlockTipHView.swift
//  block time
//
//  Created by Benicio Nell on 09.02.23.
//

import SwiftUI

struct FakeBlockTipHView: View {
    var body: some View {
        
        VStack {
            Text("Current block time:")
                .font(.system(size: 30))
            Text("123456")
                .font(.system(size: 80))
        }
        
            }
}


struct FakeBlockTipHView_Previews: PreviewProvider {
    static var previews: some View {
        FakeBlockTipHView()
    }
}
