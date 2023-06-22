//
//  LonginSY.swift
//  Mogong_StudyWork
//
//  Created by 박서연 on 2023/06/21.
//

import SwiftUI

struct LoginSY: View {
    
    @State var login: String = ""
    @State var password: String = ""
    @State var isLogin: Bool = false
    
    func isButtonValid() -> Bool {
        return login.count > 1 && password.count > 1 && isLogin == true
    }
    
    var body: some View {
        
        VStack {
            Text("Log in")
                .font(.system(size: 70))
                .fontWeight(.medium)
                .frame(width: 350, alignment: .leading)
                .padding(.bottom, 10)
            Spacer()
            
            // 중간 문장
            Text("Introduce your credentials")
                .frame(width: 350, alignment: .leading)
            
            // ID 텍스트 필드
            HStack {
                Image(systemName: "person").frame(width: 20)
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                TextField("E-mail", text: $login)
                    .frame(width: 300, height: 30)
                    .keyboardType(.emailAddress) //email 형식으로 입력 받도록
//                    .textCase(.lowercase)
                    .autocapitalization(.none) // 대문자 설정 지우기
                    .disableAutocorrection(false) // 자동 수정 설정 해제
                    
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
            .padding(.bottom, 10)
            
            // Password 텍스트 필드
            HStack {
                Image(systemName: "key").frame(width: 20)
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                SecureField("Password", text: $password)
                    .frame(width: 300, height: 30)

                    
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
            
            // 토글
            Toggle("Agree to ierms and conditions", isOn: $isLogin)
                .frame(width: 300, alignment: .trailing) // 정렬 확인 필요
                .padding(.bottom, 50)

            // 버튼
            Button {
                print("로그인 중입니다.")
            } label: {
                Text("Sign in")
                    .fontWeight(.bold)
                    .frame(width: 360, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!isButtonValid())
            .padding(.bottom, 200)
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        } // clear Button 구현
    }
}

struct LonginSY_Previews: PreviewProvider {
    static var previews: some View {
        LoginSY()
    }
}
