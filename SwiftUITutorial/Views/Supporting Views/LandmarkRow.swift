//
//  LandmarkRow.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/24.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 여러 뷰를 묶어서 프리뷰에 보여줄때 사용
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))  // 자식 뷰는 부모 뷰의 문맥적 속성을 상속받음(프리뷰 크기등)
    }
}
