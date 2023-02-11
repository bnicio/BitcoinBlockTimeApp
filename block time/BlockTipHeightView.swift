//
//  BlockTipHeightView.swift
//  block time
//
//  Created by Benicio Nell on 08.02.23.
//

import SwiftUI

struct BlockTipHeightView: View {
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var blockTip: BlockTip
    
    var body: some View {
        
        VStack {
            VStack {
                Circle()
                    .fill(
                        blockTip.upToDate
                    )
                    .offset(x: 180, y: -300)
                
            }
            .frame(height: 10)
            
            
            VStack {
                Text("Current block time:")
                    .font(.system(size: 30))
                
                Text(String(blockTip.height))
                    .font(.system(size: 80))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: Double(settings.refreshTimer), repeats: true) {timer in
                            self.fetchData()
                        }
                    }
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://mempool.space/api/blocks/tip/height") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                blockTip.upToDate = .red
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.blockTip.height = Int(String(decoding: data, as: UTF8.self))!
                blockTip.upToDate = .green
                
            }
        }.resume()
    }
}



class BlockTip: ObservableObject {
    @Published var height: Int = 0
    @Published var upToDate: Color = .red
}

struct BlockTipHeight_Preview: PreviewProvider {
    static var previews: some View {
        BlockTipHeightView().environmentObject(Settings()).environmentObject(BlockTip())
    }
}
