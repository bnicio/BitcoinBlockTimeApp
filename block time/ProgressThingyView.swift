//
//  ProgressView.swift
//  block time
//
//  Created by Benicio Nell on 09.02.23.
//

import SwiftUI

struct ProgressThingyView: View {
    @State private var value: Double = 0
    @State private var progress: Double = 40000
    @EnvironmentObject var blockTip: BlockTip
    
    var body: some View {
        ProgressView("Loading...", value: Double(blockTip.height)-840000, total: 210000)
    }
}

struct ProgressThingyView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressThingyView().environmentObject(BlockTip())
    }
}
