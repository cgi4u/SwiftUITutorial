//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 23/08/2019.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage()
                .frame(height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) { // spacing 적용 가능, content는 trailing closure
                Text("Turtle Rock")
                    .font(.title)
                        // modifier: 기존 view에 변화를 적용하여 다른 view를 리턴
                                                // 즉, 한 modifier에서 라턴된 view를 받아서 다시 modifier를 적용시키는 메소드 체인임
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding(10.0)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
