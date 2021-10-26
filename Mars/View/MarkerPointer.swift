//
//  MarkerPoint.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 24/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct MarkerPointer: View {
    var offset: CGSize = CGSize(width: 6, height: 6)
    @Binding var isScaled: Bool
    @Binding var scalePoint: UnitPoint
    @State var ripple = Ripple(radius: 10.6, isFading: false)
    var scalingPoint: UnitPoint
    var action: () -> () = {}
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: isScaled ? 7 : 10, height: isScaled ? 3 : 10, alignment: .center)
                    .padding(isScaled ? 3.5 : 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                if isScaled && scalePoint == scalingPoint {
                    RippleEffectView(ripple: $ripple)
                        .opacity(ripple.isFading ? 0 : 1)
                        .onAppear {
                            withAnimation(.linear(duration: 2)) {
                                ripple.isFading = true
                                ripple.radius = 40
                            }
                        }
                        .onDisappear {
                            ripple.radius = 10.6
                            ripple.isFading = false
                        }
                }
            }
        }
        .offset(x: offset.width, y: offset.height)
    }
}

struct MarkerPointer_Previews: PreviewProvider {
    static var previews: some View {
        MarkerPointer(isScaled: .constant(false), scalePoint: .constant(.center), scalingPoint: .center)
    }
}
