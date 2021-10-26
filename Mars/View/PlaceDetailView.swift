//
//  PlaceDetail.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 25/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct PlaceDetailView: View {
    @Binding var isShow: Bool
    @Binding var showSeatBooking: Bool
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white.opacity(0))
                .frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .center)
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 2)) {
                        isShow.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                    
                        .font(.system(size: 25))
                }
                Spacer()
            }
            .padding()
            ScrollView {
                VStack {
                    HStack {
                        Text("Zone 1\nBillionary Land")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        Spacer()
                    }
                    .padding([.leading, .trailing, .bottom])
                    
                    Rectangle()
                        .foregroundColor(.white.opacity(0))
                        .frame(width: UIScreen.main.bounds.width - 50, height: 300, alignment: .center)
                    
                    HStack {
                        Text("Pictures")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { item in
                                Image("mars\(item + 1)")
                                    .resizable()
                                    .frame(width: 98, height: 130, alignment: .center)
                            }
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Description")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Text("Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the \"Red Planet\"")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 20))
                                .padding(.top, 2)
                            
                            
                        }
                        Spacer()
                    }
                    .padding([.leading, .trailing, .bottom])
                    HStack {
                        PlanetCardView(title: "Degrees", subtitle: "63")
                        PlanetCardView(title: "Ratio Km", subtitle: "3.389")
                        PlanetCardView(title: "Dist km", subtitle: "225")
                    }
                    .padding([.leading, .trailing, .bottom])
                    
                    Button {
                        withAnimation(.easeInOut(duration: 3)) {
                            showSeatBooking.toggle()
                        }
                    } label: {
                        Text("Choose Seat")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background(Color.white)
                    }
                    .padding(.bottom, 70)
                }
            }
        }
        .background(Color.white.opacity(0))
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(isShow: .constant(true), showSeatBooking: .constant(false))
    }
}
