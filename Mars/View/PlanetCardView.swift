//
//  PlanetCardView.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 25/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct PlanetCardView: View {
    var title: String = "Degree"
    var subtitle: String = "-63"
    var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.5))
                Spacer()
            }
            .padding()
            Spacer()
            HStack {
                Spacer()
                Text(subtitle)
                    .font(.system(size: 17))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: width / 3.4, height: 130, alignment: .center)
        .background(Color.white.opacity(0))
        .border(Color.white.opacity(0.7), width: 3)
    }
}

struct PlanetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCardView()
    }
}
