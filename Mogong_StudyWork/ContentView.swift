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
            Text("민근 브랜치 테스트")
            Text("최종")
        }
        .padding()
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
