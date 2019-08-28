//
//  RotatedBadgeSymbol.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/29.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}

/*
 struct라 상속으로 만들수는 없고, 이것만이라면 그냥 속성에 포함시켜도 되겠지만 그럴수록 뷰가 비대해질 수 있으니 추가 속성이 붙은 뷰를 독립적으로 만드는 듯.
 */
