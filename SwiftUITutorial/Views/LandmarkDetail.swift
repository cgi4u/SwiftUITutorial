//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by 최광익 on 23/08/2019.
//  Copyright © 2019 최광익. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .frame(height: 260)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) { // spacing 적용 가능, content는 trailing closure
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle() // 버튼을 누르면 이 화면에 해당하는 랜드마크의 favorite 여부를 변경
                    }) {
                        // favorite 여부에 따라 label 형태를 변경
                        // 앞의 action에 대한 callback 개념이 아님, EnvironmentObject가 변경되었을 때 body가 다시 로드되면서 if문이 다시 실행되어 바뀌는것
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }

                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}

/* Note
 modifier: 기존 view에 변화를 적용하여 다른 view를 리턴
 즉, 한 modifier에서 라턴된 view를 받아서 다시 modifier를 적용시키는 메소드 체인임
 
 왜 LandmarkDetail에 직접 environmentObject를 호출하지 않았는데도 인식이 될까?
 -> So, once you’ve injected an object into the environment you can start using it immediately either in your top-level view or ten levels down – it doesn’t matter. And most importantly, whenever any view changes the environment, all views relying on it are automatically refreshed so they stay in sync.
 -> 한번 설정하면 별다른 설정 없이도 하위 뷰들이 이를 공유함
 -> 그렇다면 여러 개를 초기화한다면? 가장 가까이 있는 상위 뷰의 변수를 할당받나?
 */
