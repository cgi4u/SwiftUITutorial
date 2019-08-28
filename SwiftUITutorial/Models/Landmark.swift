//
//  Landmark.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/23.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI
import CoreLocation

/*
 Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
 -> 고유하게 식별 가능한 키를 주거나, Identifiable 프로토콜을 만족시키거나
 RandomAccessCollection이 기본
*/

struct Landmark: Hashable, Codable, Identifiable {    // 포함된 자료형이 모두 Codable해야 함
                                        // 따라서 Coordinates의 정의가 없으면 에러
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
