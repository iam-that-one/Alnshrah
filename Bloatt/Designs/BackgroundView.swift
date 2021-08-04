//
//  BackgroundView.swift
//  النشرة
//
//  Created by Abdullah Alnutayfi on 03/08/2021.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.green).opacity(0.60)
                .overlay(
                    ZStack{
                        VStack{
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                .foregroundColor(.blue)
                                .opacity(0.50)
                                .rotationEffect(Angle(degrees: 45))
                                .offset(x: 100,y: 320)
                        }
                        Rectangle()
                            .frame(width: 500, height: 600)
                            .rotationEffect(Angle(degrees: -45))
                            .offset(x: -230,y: -50)
                            .foregroundColor(.gray).opacity(0.80)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                )
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
