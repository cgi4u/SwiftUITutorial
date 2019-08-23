//
//  LandmarkList.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/24.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        /*
         Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
         -> 고유하게 식별 가능한 키를 주거나, Identifiable 프로토콜을 만족시키거나
         RandomAccessCollection이 기본
        */
        NavigationView {
            List(landmarkData) { landmark in    // Landmark를 Identifiable하게 정의함으로서 id를 명시할 필요가 없어짐
                                                // id 명시하는 구문에서 \의 의미는?
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in // Place a ForEach instance inside a List or other container type to create a dynamic list.
            // ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
