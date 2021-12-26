//
//  ContentView.swift
//  CyrptoCrazySUI
//
//  Created by Doğanay Şahin on 3.10.2021.
//

import SwiftUI

struct MainView: View {
    
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList, id: \.id){ cryto in
                VStack{
                    Text(cryto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(cryto.price)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
        }.task {
            await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
