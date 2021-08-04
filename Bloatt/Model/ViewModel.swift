//
//  ViewModel.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 31/07/2021.
//

import SwiftUI

class ViewModel : ObservableObject{
    @Published var games = [Game]()
    @Published  var selected : UUID?
    func getGames(){
        
        games = [
                    Game(id: UUID(), cardDesign: AnyView(BloatCardDesign()), title: "بلوت", modalType: .bloat),
                    Game(id: UUID(), cardDesign: AnyView(Damen7CardDesign()), title: "سبعة الديمن",modalType:.damen7),
                    Game(id: UUID(), cardDesign: AnyView(BentSCardDesign()), title: "بنت السبيت", modalType: .bentS)
                ]
        selected = games[0].id
        
       
    }
    func selectedGame(id: UUID?) -> Game? {
        return games.first(where: {$0.id == id})
    }
}

struct Game : Identifiable {
    var id = UUID()
    var cardDesign : AnyView
    var title = ""
    var modalType : ModalType?
}
