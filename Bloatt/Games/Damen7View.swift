//
//  Damen7View.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 31/07/2021.
//

import Foundation
import GoogleMobileAds
import SwiftUI
import Combine
struct Damen7 : View {
    @Binding var team1 : String
    @Binding var team2 : String
    @State var firstTeamLastRecord = 0
    @State var secondTeamLastRecord = 0
    @State var score1 = ""
    @State var score2 = ""
    @State var value1 = 0
    @State var value2 = 0
    @State var arrayOfValues1 = [Int]()
    @State var arrayOfValues2 = [Int]()
    @State var sum = 0
    @State var sum2 = 0
    @State var showEmoji = false
    @State var showEmoji2 = false
    @State var replay = false
    @AppStorage("FirstArray") var defaults: Int = 0 // to save data into userDefaults
    @AppStorage("SecondArray") var defaults2: Int = 0 // to save data into userDefaults
    @State var array = UserDefaults.standard.array(forKey: "FirstArray") // to store data from userDefaults
    @State var array2 = UserDefaults.standard.array(forKey: "SecondArray") // to store data from userDefaults
    var body: some View{
        ScrollView{
            ZStack{
                BackgroundView()
                Color.red.opacity(0.30)
                ScrollView{
                    Group{
                        HStack(spacing: 70){
                            VStack{
                                Text(team1)
                                TextField("", text : $score1)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 50)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(score1)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.score1 = filtered
                                        }
                                    }
                            }
                            Button(action:{
                                if score1 != ""{
                                    value1 = value1 + Int(score1)!
                                    firstTeamLastRecord =  Int(score1)!
                                    arrayOfValues1.append(Int(score1)!)
                                    sum = arrayOfValues1.reduce(0, +)
                                    UserDefaults.standard.set(arrayOfValues1, forKey: "FirstArray") // to save data into userDefaults
                                    score1 = ""
                                    hideKeyboard()
                                }
                                if score2 != ""{
                                    value2 = value2 + Int(score2)!
                                    secondTeamLastRecord = Int(score2)!
                                    arrayOfValues2.append(Int(score2)!)
                                    sum2 = arrayOfValues2.reduce(0, +)
                                    UserDefaults.standard.set(arrayOfValues2, forKey: "SecondArray") // to save data into userDefaults
                                    
                                    hideKeyboard()
                                    score2 = ""
                                }
                            }){
                                Text("سجّل")
                                    .padding(5)
                                    .background(Color(.systemFill))
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                            }
                            VStack{
                                Text(team2)
                                TextField("", text: $score2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 50)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(score2)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.score2 = filtered
                                        }
                                    }
                            }
                        }
                    }
                    Divider()
                        .background(Color.black)
                    HStack(spacing: 100){
                        
                        List{
                            ForEach(arrayOfValues1 , id: \.self){ value in
                                Text("\(value)")
                                    .multilineTextAlignment(.center)
                            }.listRowBackground(Color.green.opacity(0.30))
                        }
                        Divider()
                            .frame(height: 500)
                            .background(Color.black)
                        List{
                            
                            ForEach(arrayOfValues2, id: \.self){ value in
                                Text("\(value)")
                                    .multilineTextAlignment(.center)
                                
                            }.listRowBackground(Color.orange.opacity(0.30))
                        }
                    }
                    HStack(spacing: 20){
                        Text("المجموع: \(sum)")
                            .frame(width: 150)
                            .padding(.horizontal)
                            .background(Color.green.opacity(0.30))
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                        Text("المجموع: \(sum2)")
                            .frame(width: 150)
                            .padding(.horizontal)
                            .background(Color.orange.opacity(0.30))
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack(spacing: 40){
                        Button(action: {
                            value1 = value1 - 100
                            sum = sum - 100
                            arrayOfValues1.append(-100)
                            UserDefaults.standard.set(arrayOfValues1, forKey: "FirstArray") // to save data into userDefaults
                            withAnimation{
                                showEmoji.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation{
                                    showEmoji.toggle()
                                }
                            }
                        }){
                            Text("-100")
                                .frame(width: 150, height: 30)
                                .background(LinearGradient(gradient: Gradient(colors: [.green,.blue.opacity(0.30),.gray, .red]), startPoint: .trailing, endPoint: .leading))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(.black))
                        }
                        Divider()
                            .frame(height: 15)
                            .offset(y: 50)
                            .background(Color.black)
                        Button(action: {
                            value2 = value2 - 100
                            sum2 = sum2 - 100
                            arrayOfValues2.append(-100)
                            UserDefaults.standard.set(arrayOfValues2, forKey: "SecondArray") // to save data into userDefaults
                            withAnimation{
                                showEmoji2.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation{
                                    showEmoji2.toggle()
                                }
                            }
                        }){
                            Text("-100")
                                .frame(width: 150, height: 30)
                                .background(LinearGradient(gradient: Gradient(colors: [.green,.blue.opacity(0.30),.gray,.red]), startPoint: .trailing, endPoint: .leading))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(.black))
                        }
                    }
                    Divider()
                        .background(Color.black)
                        .offset(y:-50)
                    
                    Divider()
                        .background(Color.black)
                        .offset(y:-15)
                    HStack(spacing: 50){
                        Button(action:{replay.toggle()}){
                            Text("أعد اللعبة")
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }.offset(y:-20)
                        .alert(isPresented: $replay) {
                            Alert(title: Text("تحذير"), message: Text("هل تريد إعادة اللعبة، سوف يتم حذف جميع بيانات اللعبة المخزنة!!"), primaryButton: .default(Text("احذفها")){
                                firstTeamLastRecord = 0
                                secondTeamLastRecord = 0
                                score1 = ""
                                score2 = ""
                                value1 = 0
                                value2 = 0
                                arrayOfValues2 = []
                                arrayOfValues1 = []
                                sum = 0
                                sum2 = 0
                                array = []
                                array2 = []
                                UserDefaults.standard.removeObject(forKey: "FirstArray")
                                UserDefaults.standard.removeObject(forKey: "SecondArray")
                            } , secondaryButton: .default(Text("لاتحذفها")){replay = false
                                
                            })
                        }
                        Button(action:{
                            
                            self.arrayOfValues1 = self.array as? [Int] ?? [] // to store data from userDefaults
                            sum = self.arrayOfValues1.reduce(0, +)
                            
                            
                            self.arrayOfValues2 = self.array2 as? [Int] ?? [] // to store data from userDefaults
                            sum2 = self.arrayOfValues2.reduce(0, +)
                        }){
                            Text("استرجاع النتيجة الأخيرة")
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }.offset(y:-20)
                    }
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                    }
                    Spacer()
                }.offset(y:40)
                
                Text(showEmoji == true ? "👈🤪" : "")
                    .font(Font.system(size: 100))
                //  .animation(Animation.easeInOut)
                Text(showEmoji2 == true ? "🤪👉" : "")
                    .font(Font.system(size: 100))
            }
            .onTapGesture {
                hideKeyboard()
            }
            .ignoresSafeArea()
            .foregroundColor(.black)
        }
    }
}

