//
//  ContentView.swift
//  LoginMS
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    enum Field {
        case email
        case password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var toggling = false
    @State private var isValid: Bool = false
    @State private var notCorrectLogin: Bool = false
    @State private var isShowingDetailView: Bool = false
    @State private var isActive: Bool = false
    @FocusState private var focusedField: Field?
    
    private var correctEmail: String = "a_jb97@naver.com"
    private var correctPassword: String = "mindol97"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Introduce your credentials")
                    .foregroundColor(.gray)
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .email)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .password)
                
                Toggle(isOn: $toggling) {
                    Text("Agree to terms and conditions")
                        .font(.subheadline)
                }
            }
            .onSubmit {
                switch focusedField {
                case .email:
                    focusedField = .password
                default:
                    print("Done")
                }
            }
            .padding()

            Button {
                isValid = !checkEmailForm(input: email)
                checkLogin(isEmail: email, isPassword: password)
                
                if notCorrectLogin == false {
                    print("로그인 성공")
                    isActive = true
                }
            } label: {
                Text("Sign in")
                    .frame(width: 300, height: 30)
            }
            .alert(isPresented: $isValid) {
                Alert(title: Text("경고"), message: Text("이메일 형식이 올바르지 않습니다."), dismissButton: .default(Text("확인")))
            }
            .alert(isPresented: $notCorrectLogin) {
                Alert(title: Text("주의\n"), message: Text("이메일, 또는 비밀번호가 일치하지 않습니다."), dismissButton: .default(Text("확인")))
            }
            .disabled(email.isEmpty || password.isEmpty || !toggling)
            .buttonStyle(.borderedProminent)
            .padding()
            
            NavigationLink(destination: DetailView(), isActive: $isActive) {
                EmptyView()
            }

            Spacer()
            
            .navigationTitle("Log in")
        }
        .onTapGesture{
            self.endTextEditing()
        }
    }
    
    private func checkEmailForm(input: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: input)
    }
    
    private func checkLogin(isEmail: String, isPassword: String) {
        if isEmail != correctEmail || isPassword != correctPassword {
            notCorrectLogin = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
