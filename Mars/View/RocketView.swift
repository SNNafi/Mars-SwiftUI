//
//  RocketView.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 26/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct RocketView: View {
    @Binding var scale: Bool
    @Binding var showSeatBooking: Bool
    @State var showSeat: Bool = false
    @State var launch: Bool = false
    @State var launched: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Image("rocket")
                    .resizable()
                    .scaleEffect(showSeat ? 3 : 1)
                    .offset(x: 0, y: launched ? -1000 : 0)
                
                
                
            }
            .background(Color.black)
            if showSeat {
                VStack {
                    ForEach(0..<8) { _ in
                        HStack {
                            ForEach(0 ..< 4) { item in
                                SeatView(showSeat: $showSeat, launch: $launch)
                                
                            }
                        }
                    }
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.move(edge: Edge.bottom))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeOut(duration: 2)) {
                    showSeat.toggle()
                }
            }
        }
        .valueChanged(of: launch) { newValue in
            withAnimation(.easeInOut(duration: 3)) {
                launched.toggle()
            }
        }
        .valueChanged(of: launched) { newValue in
            if launched {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    withAnimation(.easeOut){
                        showSeatBooking.toggle()
                        scale.toggle()
                    }
                    
                }
            }
        }
    }
}

struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView(scale: .constant(true), showSeatBooking: .constant(true))
    }
}
