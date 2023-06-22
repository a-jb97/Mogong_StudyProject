//
//  ContentView.swift
//  Mogong_StudyWork
//
//  Created by 박서연 on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("서연 브랜치 테스트")
            Text("지영 브랜치 테스트")
        }
        .padding()
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
