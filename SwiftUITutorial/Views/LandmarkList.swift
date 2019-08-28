//
//  LandmarkList.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 2019/08/24.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData // This userData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    var someBool = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {  // $: State binding prefix
                    // Just like on @State properties, you can access a binding to a member of the userData object by using the $ prefix.
                    Text("Favorite only")
                }
                    
                ForEach(userData.landmarks) { landmark in // Dynamic View 구현을 위해 List 직접 사용이 아닌 ForEach 사용
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(UserData())
    }
}

/* Notes
 ForEach: a ForEach instance inside a List or other container type to create a dynamic list.
 ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
 
 EnvironmentObject: A dynamic view property that uses a bindable object supplied by an ancestor view to invalidate the current view whenever the bindable object changes.
 -> 상위 뷰가 제공, dynamic view 제작을 위해 사용, bindable object여야 하고 이 오브젝트에 변화에 따라 뷰를 변화시킬 수 있음
 
 State: A persistent value of a given type, through which a view reads and monitors the value.
 -> Object가 아닌 Value임
 A State instance isn’t the value itself; it’s a means of reading and mutating the value. To access a state’s underlying value, use its value property.
 -> value라는 프로퍼티는 없음? State struct 그 자체에 대한 얘기?
 */
