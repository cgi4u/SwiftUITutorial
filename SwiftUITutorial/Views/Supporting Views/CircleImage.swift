//
//  CircleImage.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/23.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable(resizingMode: .stretch)    // modifier 순서에 따라 적용되지 않을 수 있음(Image에만 적용되는 메소드)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: landmarkData[0].image)
    }
}
