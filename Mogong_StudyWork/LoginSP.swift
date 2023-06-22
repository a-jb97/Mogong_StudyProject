//
//  ContentView.swift
//  LoginView
//
//  Created by 변상필 on 2023/06/20.
//


// 풀리퀘 테스트

import SwiftUI

struct LoginSP: View {
    @State var id: String = ""
//    @State var idMessage: String = "id"
    
    @State var password: String = ""
    
    @State var isToggle: Bool = false
    @State private var showingAlert = false
    @State var signMessage: String = "default"
    
    var body: some View {
        VStack {
            Text("Log in")
                .fontWeight(.bold)
                .padding(.trailing, 250)
                .padding(.bottom)
                .font(.largeTitle)
            
            VStack{
                Section(header: Text("Introduce your credentials")
                    .padding(.trailing, 150)){
    
                        TextField("id", text: $id)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(8)

                        SecureField("input password", text: $password)
                            .padding()
                        //.border(Color.gray)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(8)
                    }
            }
            
            Toggle(isOn: $isToggle) {
                Text("Agree to terms and conditions")
            }
            .padding(.bottom, 30)
            
            Button {
                // 알람을 뜨게하기 위해성
                showingAlert.toggle()
                signIn(id: id)
                // 버튼이 동작안할 때 색을 어둡게하고싶은데 어케하징
                if isToggle {
                    
                }
            } label: {
                Text("Sign in")
                    .padding()
            }
            .disabled(!isToggle)
            .frame(width: 360)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            //근데 색을 설정해놔서 disabled가 되도 티가 안남 ㅋㅋ;;
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(""), message: Text(signMessage),
                      dismissButton: .default(Text("닫기")))
            }
            Spacer()
            
        }
        .padding()
    }
    
    // NSPredicate 사용방법 공식문서 확인 후 정리
    func checkId(_ id: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}+$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValid = emailPredicate.evaluate(with: id)
        return isValid
    }
    
    func signIn (id: String) {
        print(checkId(id))
        if checkId(id) {
            signMessage = "로그인 성공"
            print("sign -> \(signMessage)")
        } else if id.isEmpty || password.isEmpty {
            signMessage = "id 또는 pw가 입력되지 않음"
            self.id = ""
            password = ""
        } else {
            signMessage = "올바른 형식이 아님"
            self.id = ""
            password = ""
        }
        print("sign -> \(signMessage)")
    }
}

struct LoginSP_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

