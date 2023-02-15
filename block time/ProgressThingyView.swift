//
//  ProgressView.swift
//  block time
//
//  Created by Benicio Nell on 09.02.23.
//

import SwiftUI

struct ProgressThingyView: View {
    @EnvironmentObject var blockTip: BlockTip
    let diffAdjust = 2016
    let halving = 210000
    
    var body: some View {
        VStack {
            
            ProgressView("Blocks until next difficutly adjustment: \(diffAdjust - (blockTip.height % diffAdjust))",
                         value: Double(blockTip.height % diffAdjust), total: Double(diffAdjust))
            .padding(.all)
            
            
            ProgressView("Blocks until next halving: \(halving - (blockTip.height % halving))",
                         value: Double(blockTip.height % halving), total: Double(halving))
            .padding(.all)
            
            ProgressView("Blocks until next halving eclips: \((halving*24) - (blockTip.height % (halving*24)))",
                         value: Double(blockTip.height % (halving*24)), total: Double(halving*24))
            .padding(.all)
        }
    }
}


struct ProgressThingyView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressThingyView().environmentObject(BlockTip())
    }
}
