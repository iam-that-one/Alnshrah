//
//  ContentView.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 03/08/2021.
//

import SwiftUI
import CollectionViewPagingLayout
import GoogleMobileAds
struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var options : StackTransformViewOptions{
        .layout(.rotary)
    }
    @State var firstTeam = ""
    @State var secondTeam = ""
    @State var thirdPlayer = ""
    @State var fourthPlayer = ""
    @State var fifthPlayer = ""
    @State var showInfo = false
    @State var modalType : ModalType? = nil
    var body: some View {
        ZStack(alignment: .center){
            Color.green.opacity(0.30)
            BackgroundView()
            VStack{
           
                VStack(spacing: 10){
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                 
                    }
                    TextField("الفريق/اللاعب الأول", text: $firstTeam)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200)
                    TextField("الفريق/اللاعب الثاني", text: $secondTeam)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .multilineTextAlignment(.trailing)
                   Text("استمر في الإدخال (لعبة بنت السبيت)")
                        .font(.caption)
                        .multilineTextAlignment(.trailing)
                    TextField("اللاعب الثالث", text: $thirdPlayer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200)
                    TextField("اللاعب الرابع", text: $fourthPlayer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .multilineTextAlignment(.trailing)
                    TextField("اللاعب الخامس", text: $fifthPlayer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200)
                }
                StackPageView(viewModel.games,selection: $viewModel.selected){ game in
                    LazyHStack(spacing:20){
                        VStack{
                            Button(action:{
                                modalType = game.modalType
                            }){
                                game.cardDesign
                                    .overlay(
                                        VStack{
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(lineWidth: 5)
                                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                                                .foregroundColor(.white)
                                                .overlay(
                                                    ZStack{
                                                        Rectangle()
                                                            .foregroundColor(.green)
                                                            .frame(width: 165, height: 40)
                                                            
                                                            .cornerRadius(5)
                                                            .opacity(1)
                                                            .overlay(RoundedRectangle(cornerRadius: 5).stroke().frame(width: 168).foregroundColor(.black).cornerRadius(5).shadow(radius: 5))
                                                        Text("إختر")
                                                            .font(Font.custom("ReemKufi-VariableFont_wght", size: 20))
                                                            .foregroundColor(.black)
                                                    })
                                        })
                                
                            }.disabled(viewModel.selected != game.id)
                        }
                    }
                    .sheet(item: $modalType) { modalType in
                        switch modalType{
                        case .bloat:
                            BloatView(team1: $firstTeam, team2: $secondTeam)
                        case .damen7:
                            Damen7(team1: $firstTeam, team2: $secondTeam)
                        case .bentS:
                            BentAlsbeet(thirdPlayer: $thirdPlayer, fourthPlayer: $fourthPlayer, fifthPlayer: $fifthPlayer, firstTeam: $firstTeam, secondTeam: $secondTeam)
                        }
                    }
                }
                .options(options)
                .pagePadding(
                    vertical: .absolute(100), horizontal: .absolute(80)
                )
                .frame(width: 400, height: 320)
                .foregroundColor(.black)
                
                Button(action:{
                    withAnimation(.spring()){
                    showInfo.toggle()
                    }
                }){
                    VStack(spacing: 2){
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .shadow(radius: 5)
                        .foregroundColor(.white)
                        .overlay(Text("ت").foregroundColor(.black))
                        .overlay(Circle().stroke().foregroundColor(.black))
                        Text("تعليمات")
                            .font(.caption)
                            .foregroundColor(.black)
                    }.frame(height: 10)
                }
                if viewModel.selected != nil{
                    withAnimation{
                        TitleView(id: viewModel.selected, viewModel: viewModel)
                            .frame(width: 300, height: 50)
                            .offset(y:30)
                    }
                }
   
            }.onAppear{viewModel.getGames()}
            if showInfo == true{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 150)
                    .shadow(radius: 5)
                    .foregroundColor(.red)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.black))
                    .overlay(
                    Text("في حال رغبتك في استرجاع النتيجة الأخيرة، يجب عليك استرجاعها قبل عملية الإدخال الجديد؛ للإحتفاظ بالتسلسل الصحيح للنتائج.")
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.white)
                    .animation(.spring())
            }
        }.ignoresSafeArea()
        .onTapGesture {
            hideKeyboard()
            showInfo = false
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    let id: UUID?
    var viewModel:ViewModel
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "crown.fill")
                .offset(y:15)
            Text(viewModel.selectedGame(id: id)?.title ?? "")
                .font(Font.custom("Qahiri-Regular", size: 20))
                .frame(width: UIScreen.main.bounds.width , height: 30)
                .background(Color.white).opacity(0.60)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.yellow))
                .padding()
                .animation(.spring())
            Image(systemName: "crown.fill")
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-15)
        }.foregroundColor(.black)
        .padding()
    }
}

