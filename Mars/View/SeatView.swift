//
//  SeatView.swift
//  Mars
//
//  Created by Shahriar Nasim Nafi on 26/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import SwiftUI

struct SeatView: View {
    @Binding var showSeat: Bool
    @Binding var launch: Bool
    @State var isSelected: Bool = false
    
    var body: some View {
        Button {
        } label: {
            Image("seat")
                .resizable()
                .foregroundColor(isSelected  ? .orange : .white)
                .onTapGesture {
                    if !isSelected {
                        isSelected.toggle()
                    }
                }
                .onLongPressGesture {
                    withAnimation(.easeOut(duration: 3)) {
                        showSeat.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            launch.toggle()
                        }
                    }
                }
        }
        .frame(width: 30, height: 33, alignment: .center)
    }
}

struct SeatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SeatView(showSeat: .constant(false), launch: .constant(false), isSelected: true)
            SeatView(showSeat: .constant(false), launch: .constant(false))
        }
    }
}
