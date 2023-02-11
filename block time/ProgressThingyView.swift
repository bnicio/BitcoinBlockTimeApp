//
//  ProgressView.swift
//  block time
//
//  Created by Benicio Nell on 09.02.23.
//

import SwiftUI

struct ProgressThingyView: View {
    @EnvironmentObject var blockTip: BlockTip
    
    var body: some View {
        VStack {
            
            ProgressView("Blocks until next difficutly adjustment: \(2016 - (blockTip.height % 2016))",
                         value: Double(blockTip.height % 2016), total: 2016)
            .padding(.all)
            
            
            ProgressView("Blocks until next halving: \(840000 - blockTip.height)",
                         value: Double(blockTip.height)-630000, total: 210000)
            .padding(.all)
        }
    }
}


struct ProgressThingyView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressThingyView().environmentObject(BlockTip())
    }
}
