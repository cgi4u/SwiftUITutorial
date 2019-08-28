//
//  Badge.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/29.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)  // 여기서 geometry 사이즈가 바뀌니까 RotatedBagdgeSymbol도 크기가 바뀌는것
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

/*
 body는 뷰의 property이다. 뷰 자체와 body를 혼동하는 실수를 하지 말것
 
 ZStack: A view that overlays its children, aligning them in both axes.
 -> body는 뷰 하나만 가질 수 있으므로 복수의 뷰를 사용하려면 List나 Stack 등이 꼭 필요
 
 scaledToFit: Scales this view to fit its parent.
 */
