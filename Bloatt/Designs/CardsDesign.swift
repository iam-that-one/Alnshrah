//
//  CardsDesign.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 02/08/2021.
//

import SwiftUI

struct BentSCardDesign: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 150, height: 220)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Q")
                                    .offset(x:5)
                                Text("♠️")
                            }.offset(x:-15,y:15)
                            Spacer()
                        }
                        Spacer()
                        Text("♠️")
                            .font(Font.system(size: 100, weight: .bold, design: .default))
                        Spacer()
                        HStack{
                            Spacer()
                            VStack(alignment: .leading){
                                
                                Text("♠️")
                                Text("Q")
                                    .offset(x:5)
                            }
                            .rotationEffect(Angle(degrees: 180))
                            .offset(x:15)
                        }
                    }.padding()
                )
        }
    }
}
//struct BentSCardsDesign_Previews: PreviewProvider {
//    static var previews: some View {
//        BentSCardDesign()
//    }
//}


struct BloatCardDesign: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 150, height: 220)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("A")
                                    .offset(x:5)
                                Text("♠️")
                                
                            }.offset(x:-15,y:15)
                            Spacer()
                        }
                        Spacer()
                        Text("♠️")
                            .overlay(Image(systemName: "heart.fill").resizable().frame(width: 50, height: 50).foregroundColor(.white))
                            .font(Font.system(size: 100, weight: .bold, design: .default))
                        Spacer()
                        HStack{
                            Spacer()
                            VStack(alignment: .leading){
                                
                                Text("♠️")
                                    .rotationEffect(Angle(degrees: 180))
                                Text("A")
                                    .rotationEffect(Angle(degrees: 180))
                                    .offset(x:5)
                                
                            }.offset(x:15)
                        }
                    }.padding()
                )
        }
    }
}

//struct BloatCardDesign_Previews: PreviewProvider {
//    static var previews: some View {
//        BloatCardsDesign()
//  }
//}

struct Damen7CardDesign: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 150, height: 220)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    VStack{
                        HStack{
                            VStack(alignment:.leading){
                                
                                VStack{
                                    Text("7")
                                    Text("♦️")
                                }
                                .offset(x:-20,y:25)
                                HStack{
                                    
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                }
                                HStack{
                                    Spacer()
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Spacer()
                                }
                                
                                HStack{
                                    Spacer()
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Text("♦️")
                                        .font(Font.system(size: 40, weight: .bold, design: .default))
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    VStack{
                                        Text("7")
                                            .rotationEffect(Angle(degrees: -180))
                                        Text("♦️")
                                    }.offset(x:25,y:-35)
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }.padding(20)
                    .offset(y:10)
                    .foregroundColor(.red)
                )
        }
    }
}

//struct Damen7CardDesign_Previews: PreviewProvider {
//    static var previews: some View {
//        Damen7CardsDesign()
//  }
//}
