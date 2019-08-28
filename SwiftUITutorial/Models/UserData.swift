//
//  UserData.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/28.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI
import Combine  // Customize handling of asynchronous events by combining event-processing operators.
                // 비동기 이벤트 핸들링

final class UserData: ObservableObject {    // SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
    @Published var showFavoritesOnly = false    // An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var landmarks = landmarkData
}
