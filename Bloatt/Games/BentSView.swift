//
//  BentSView.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 31/07/2021.
//

import Foundation

import SwiftUI
import Combine
import GoogleMobileAds

struct BentAlsbeet : View{
    @State var firstRecord = ""
    @State var secondRecord = ""
    @State var thirdRecord = ""
    @State var fourthRecord = ""
    @State var fifthRecord = ""
    @State var value1 = 0
    @State var value2 = 0
    @State var value3 = 0
    @State var value4 = 0
    @State var value5 = 0
    @Binding var thirdPlayer : String
    @Binding var fourthPlayer : String
    @Binding var fifthPlayer : String
    @Binding var firstTeam : String
    @Binding var secondTeam : String
    
    var body: some View{
        ZStack{
            BackgroundView()
            Color.red.opacity(0.30)
            
            VStack(spacing: 30){
                Divider()
                VStack{
                    Spacer()
                    HStack(spacing:200){
                        VStack(spacing: 10){
                            Text(secondTeam == "" ? "محد" : secondTeam)
                            Text("\(value2)")
                                .font(.callout)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.30))
                        .cornerRadius(5)
                        VStack(spacing: 10){
                            Text(firstTeam == "" ?  "محد" : firstTeam)
                            Text("\(value1)")
                                .font(.callout)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.30))
                        .cornerRadius(5)
                    }
                    HStack{
                        VStack(spacing: 10){
                            Text(thirdPlayer == "" ?  "محد" : thirdPlayer)
                            Text("\(value3)")
                                .font(.callout)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.30))
                        .cornerRadius(5)
                    }
                    HStack(spacing:200){
                        VStack(spacing: 10){
                            Text(fifthPlayer == "" ?  "محد" : fifthPlayer)
                            Text("\(value5)")
                                .font(.callout)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.30))
                        .cornerRadius(5)
                        VStack(spacing: 10){
                            Text(fourthPlayer == "" ? "محد" : fourthPlayer)
                            Text("\(value4)")
                                .font(.callout)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.30))
                        .cornerRadius(5)
                    }
                    Spacer()
                }.frame(width: 350, height: 280)
                .overlay(
                    VStack{
                        HStack{
                            Button(action:{
                                if firstRecord != ""{
                                    value1 = value1 - Int(firstRecord)!
                                }
                                if secondRecord != ""{
                                    value2 = value2 - Int(secondRecord)!
                                }
                                if thirdRecord != ""{
                                    value3 = value3 - Int(thirdRecord)!
                                }
                                if fourthRecord != ""{
                                    value4 = value4 - Int(fourthRecord)!
                                }
                                if fifthRecord != ""{
                                    value5 = value5 - Int(fifthRecord)!
                                }
                                firstRecord = ""
                                secondRecord = ""
                                thirdRecord = ""
                                fourthRecord = ""
                                fifthRecord = ""
                            }){
                                Text("نقّص")
                                    .frame(width: 80, height: 30)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .overlay(Circle().stroke().foregroundColor(.white))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                            Button(action:{
                                if firstRecord != ""{
                                    value1 = value1 + Int(firstRecord)!
                                }
                                if secondRecord != ""{
                                    value2 = value2 + Int(secondRecord)!
                                }
                                if thirdRecord != ""{
                                    value3 = value3 + Int(thirdRecord)!
                                }
                                if fourthRecord != ""{
                                    value4 = value4 + Int(fourthRecord)!
                                }
                                if fifthRecord != ""{
                                    value5 = value5 + Int(fifthRecord)!
                                }
                                firstRecord = ""
                                secondRecord = ""
                                thirdRecord = ""
                                fourthRecord = ""
                                fifthRecord = ""
                                
                            }){
                                Text("زوّد")
                                    .frame(width: 80, height: 30)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .overlay(Circle().stroke().foregroundColor(.white))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 5, x: 5, y: 0)
                            }
                        }.offset(y:-20)
                        HStack{
                            VStack(spacing: 40){
                                // Text(secondTeam)
                                TextField(secondTeam,text: $secondRecord)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(secondRecord)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.secondRecord = filtered
                                        }
                                    }
                                // Text(fifthPlayer)
                                TextField(fifthPlayer,text: $fifthRecord)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(fifthRecord)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.fifthRecord = filtered
                                        }
                                    }
                            }.offset(x:-30,y: -30)
                            VStack{
                                //   Text(thirdPlayer)
                                TextField(thirdPlayer,text: $thirdRecord)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(thirdRecord)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.thirdRecord = filtered
                                        }
                                    }
                            }.offset(y: 40)
                            
                            VStack(spacing: 40){
                                //    Text(firstTeam)
                                TextField(firstTeam,text: $firstRecord)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(firstRecord)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.firstRecord = filtered
                                        }
                                    }
                                
                                //  Text(fourthPlayer)
                                TextField(fourthPlayer,text: $fourthRecord)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(fourthRecord)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.fourthRecord = filtered
                                        }
                                    }
                            }.offset(x: 30,y: -30)
                        }
                    }
                )
                
                .background(Color.black.opacity(0.30))
                .cornerRadius(10)
                Button(action:{
                    firstRecord = ""
                    secondRecord = ""
                    thirdRecord = ""
                    fourthRecord = ""
                    fifthRecord = ""
                    value1 = 0
                    value2 = 0
                    value3 = 0
                    value4 = 0
                    value5 = 0
                }){
                    Text("أعد اللعبة")
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke())
                }
                HStack {
                    Spacer()
                    GADBannerViewController()
                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                    Spacer()
                }
            }
        }.ignoresSafeArea()
        .onTapGesture {
            hideKeyboard()
        }
    }
}
