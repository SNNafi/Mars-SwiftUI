//
//  WelcomeView.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 24/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @State var yOffset: CGFloat = 70
    @State var rotation: CGFloat = 0
    @State var moreInfo: Bool = false
    @State var planetSize: CGSize = CGSize(width: 700, height: 700)
    @State var planetOffset: CGFloat = 70
    @State var scale: Bool = false
    @State var scalePoint: UnitPoint = .topTrailing
    @State var showSeatBooking: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            if !moreInfo {
                VStack {
                    Spacer()
                    Text("SPACE-N")
                        .kerning(14)
                        .font(.system(size: 20))
                        .offset(x: 0, y: yOffset)
                    Text("M\nA\nR\nS")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .fixedSize()
                        .offset(x: 0, y: yOffset)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
            } else {
                if !scale {
                    VStack {
                        Spacer()
                        Text("Where do you\n want to go")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .fixedSize()
                            .offset(x: 0, y: -30)
                            .offset(x: 0, y: yOffset)
                            .padding()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .transition(.move(edge: Edge.top).combined(with: .scale))
                }
            }
            
            VStack {
                ZStack {
                    Image("mars")
                        .resizable()
                        .scaledToFill()
                        .frame(width: planetSize.width, height: planetSize.width, alignment: .center)
                        .rotationEffect(.degrees(rotation), anchor: .center)
                        .overlay(VStack {
                            if moreInfo {
                                MarkerPointer(offset: CGSize(width: 10, height: 30), isScaled: $scale, scalePoint: $scalePoint, scalingPoint: .center) {
                                    withAnimation(.easeOut(duration: 2)) {
                                        scale.toggle()
                                        scalePoint = .center
                                    }
                                }
                                
                                
                                MarkerPointer(offset: CGSize(width: -90, height: -75), isScaled: $scale, scalePoint: $scalePoint,  scalingPoint: .topLeading) {
                                    withAnimation(.easeOut(duration: 2)) {
                                        scale.toggle()
                                        scalePoint = .topLeading
                                    }
                                }
                                
                                
                                MarkerPointer(offset: CGSize(width: -90, height: 80), isScaled: $scale, scalePoint: $scalePoint, scalingPoint: .bottomLeading) {
                                    withAnimation(.easeOut(duration: 2)) {
                                        scale.toggle()
                                        scalePoint = .bottomLeading
                                    }
                                }
                                
                                MarkerPointer(offset: CGSize(width: 70, height: 90), isScaled: $scale, scalePoint: $scalePoint, scalingPoint: .bottomTrailing) {
                                    withAnimation(.easeOut(duration: 2)) {
                                        scale.toggle()
                                        scalePoint = .bottomTrailing
                                    }
                                }
                                
                            }
                        })
                        .scaleEffect(scale ? 3 : 1, anchor: scalePoint)
                        .shadow(color: Color(hex: "#DA6723"), radius: 55, x: 1, y: 1)
                        .offset(x: 0, y: 500 + planetOffset)
                    
                }
            }
            
            if !moreInfo {
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 3)) {
                            moreInfo.toggle()
                            planetSize = CGSize(width: 350, height: 350)
                            rotation = -180
                            planetOffset = -260.6
                        }
                    } label: {
                        Text("More Info")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 25, alignment: .center)
                            .padding()
                            .border(Color.white, width: 3)
                            .offset(x: 0, y: yOffset)
                    }
                    Button {
                        withAnimation(.easeInOut(duration: 3)) {
                            moreInfo.toggle()
                            planetSize = CGSize(width: 350, height: 350)
                            rotation = -180
                            planetOffset = -260.0
                        }
                    } label: {
                        Text("Buy Tickets")
                            .foregroundColor(.black)
                            .frame(width: 100, height: 25, alignment: .center)
                            .padding()
                            .background(Color.white)
                            .offset(x: 0, y: yOffset)
                        
                    }
                    Spacer()
                }
            }
            
            if scale {
                PlaceDetailView(isShow: $scale, showSeatBooking: $showSeatBooking)
                    .transition(.scale)
            }
            if showSeatBooking {
                RocketView(scale: $scale, showSeatBooking: $showSeatBooking)
            }
        }
        .foregroundColor(.white)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeOut(duration: 1.8)) {
                yOffset = 0.0
                planetOffset = 0.0
                rotation = -50.0
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
