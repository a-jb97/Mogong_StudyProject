//
//  ContentView.swift
//  Mogong_StudyWork
//
//  Created by 전민석 on 2023/06/21.
//

// 로그인 창

import SwiftUI

struct LoginMS: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var toggling = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Introduce your credentials")
                    .foregroundColor(.gray)
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Toggle(isOn: $toggling) {
                    Text("Agree to terms and conditions")
                        .font(.subheadline)
                }
                .padding()
                
                Button {
                    print("버튼이 눌렸음")
                } label: {
                    Text("Sign in")
                        .frame(width: 350, height: 30)
                }
                .disabled(email.isEmpty || password.isEmpty || !toggling)
                .buttonStyle(.borderedProminent)
                
                .navigationTitle("Log in")
            }
            .padding()
            Spacer()
            
            Text("안녕하세용")
        }
    }
}

struct LoginMS_Previews: PreviewProvider {
    static var previews: some View {
        LoginMS()
    }
}
