//
//  BlockTipHeightView.swift
//  block time
//
//  Created by Benicio Nell on 08.02.23.
//

import SwiftUI

struct BlockTipHeightView: View {
    @State private var data = ""
    
    var body: some View {
        VStack {
            Text(data)
                .padding(15.0)
                .font(.system(size: 80))
                

            
            Button("Reload height") {
                self.fetchData()
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://mempool.space/api/blocks/tip/height") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = String(decoding: data, as: UTF8.self)
            }
        }.resume()
    }
}


struct BlockTipHeight_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
