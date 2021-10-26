//
//  RippleEffect.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 25/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct Ripple {
    var radius: CGFloat = 10.6
    var isFading: Bool = false
}

struct RippleEffectView: View {
    @Binding var ripple: Ripple
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: ripple.radius, height: ripple.radius, alignment: .center)
            .overlay(Circle()
                        .stroke(Color.white.opacity(0.6), lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2))
            .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2))
        
    }
}

struct RippleEffect_Previews: PreviewProvider {
    static var previews: some View {
        RippleEffectView(ripple: .constant(Ripple(radius: 100)))
    }
}
