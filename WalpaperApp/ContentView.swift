//
//  ContentView.swift
//  WalpaperApp
//
//  Created by Doğu GNR on 31.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}
struct Home : View {
    @State var sekmeler = ["Doğa","Hayvanlar","Balıklar","Çiçekler"]
    @State var arananIfade = ""
    @State var secilenSekme = "Doğa"
    
    @State var secilenGoruntuler : [[String]] = [["d11","d12"],["d21","d22"],["d31","d32"]]
    
    @State var dogaGoruntuler :  [[String]] =  [["d11","d12"],["d21","d22"],["d31","d32"]]
    @State var balikGoruntuler :  [[String]] =  [["b11","b12"],["b21","b22"],["b31","b32"]]
    @State var cicekGoruntuler :  [[String]] =  [["c11","c12"],["c21","c22"],["c31","c32"]]
    @State var hayvanGoruntuler :  [[String]] =  [["h11","h12"],["h21","h22"],["h31","h32"]]
     
    
    var body: some View {
        VStack {
            
            HStack{
                
                Button(action: {}) {Image("menu").renderingMode(.original)}
                Spacer()
                
            }//Hstack bitimi
            .padding()
            .background(Color.white).overlay(Image("logo").renderingMode(.original))
            
            ScrollView(.vertical, showsIndicators:false) {
                VStack(alignment: .leading, spacing: 15){
                    
                    HStack{
                        Image("ara").renderingMode(.original)
                        TextField("Ara",text: self.$arananIfade)
                    }.padding(12).background(Color("Renk")).clipShape(Capsule())
                    
                    ZStack(alignment:.bottomTrailing){
                        Image("anaGoruntu").resizable().frame(height: 350)
                        HStack(spacing: 20){
                            Button(action: {}) {Image("ekle").renderingMode(.original)}
                            Button(action: {}) {Image("begeni").renderingMode(.original)}
                            Button(action: {}) {Image("indir").renderingMode(.original)}
                        }.padding([.bottom,.trailing])
                    }
                    
                    Text("Trend Olanlar").font(.title).padding(.top)
                    HStack(spacing: 14){
                        ForEach(sekmeler,id: \.self){ s in
                            Button(action: {

                                self.secilenSekme = s
                                
                                switch s {
                                case "Doğa":self.secilenGoruntuler = self.dogaGoruntuler
                                case "Hayvanlar":self.secilenGoruntuler = self.hayvanGoruntuler
                                case "Çiçekler":self.secilenGoruntuler = self.cicekGoruntuler
                                case "Balıklar":self.secilenGoruntuler = self.balikGoruntuler
                                default : self.secilenGoruntuler = self.dogaGoruntuler
                                }
                                
                            }) {
                                VStack{
                                    Text(s).foregroundColor(.black)
                                    Capsule().fill(self.secilenSekme == s ? Color.black : Color.clear).frame(height: 6)
                                    
                                }
                            }
                        }
                        
                    }//.padding(.top)
                    
                    VStack(spacing: 18){
                        ForEach(secilenGoruntuler, id:\.self) { s in
                            HStack{
                                ForEach(s, id:\.self){ gruntAdi in
                                    Image(gruntAdi)
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 180)
                                        .cornerRadius(15)
                                        .contextMenu{//3D touch gibi
                                            Button(action: {
                                                UIImageWriteToSavedPhotosAlbum(UIImage(named: gruntAdi)!, nil, nil, nil)
                                            })
                                            {
                                                HStack{
                                                    Text("Kaydet")
                                                    Image(systemName: "arrow.down")
                                                        .resizable().frame(width: 15,height: 15)
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                    
                }//Scrolview Vstack
                .padding()
            }
        }//Ana Vstack
        .background(Color("ArkaPlan1").edgesIgnoringSafeArea(.all))
        }
    }
    #Preview {
        ContentView()
    }

