import SwiftUI

struct ContentView: View {
    @State var userID: String = ""
    @State var userPasswrod: String = ""
    @State var loginAgree: Bool = false
    @State var message: String = ""
    @State private var isValidEmail: Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Log in").font(.largeTitle).fontWeight(.bold)
                Spacer().frame(height : 20)
                Text("Introduce your credentials")
                TextField("ID" , text: $userID )
                    .fontWeight(.bold) //글씨체
                    .padding() //버튼과의 간격
                    .foregroundColor(.black) //글씨색깔
                    .frame(maxWidth: .infinity) //폭넓이 최대
                    .background(.bar) //배경 : 파랑색
                    .cornerRadius(10) //모서리 둥글게
                SecureField("PASSWORD" , text: $userPasswrod)
                    .fontWeight(.bold) //글씨체
                    .padding() //버튼과의 간격
                    .foregroundColor(.black) //글씨색깔
                    .frame(maxWidth: .infinity) //폭넓이 최대
                    .background(.bar)
                    .cornerRadius(10) //모서리 둥글게
                Spacer().frame(height : 5)
                HStack {
                    Text("Agree to terms and conditions").font(.caption2)
                    Toggle(isOn: $loginAgree) {
                        
                    }
                }
                
                
            }
            .padding(30)
            
            VStack {
                Button (action: {
                    isValidEmail = isValidEmailAddress(userID)
                    
                    if userID == "" || userPasswrod == ""  {
                        message = "아이디, 비밀번호를 입력해주세요"

                    } else if loginAgree == false {
                        message = "로그인 동의를 해주세요"
                        
                    } else if isValidEmail == false {
                        message = "이메일 형식이 유효하지 않습니다"
                    } else {
                        message = "아이디 : \(userID)\n비밀번호 : \(userPasswrod)"
                    }
                    
                    }) {
                        Text("Sign in")
                            .fontWeight(.bold) //글씨체
                            .padding() //버튼과의 간격
                            .foregroundColor(.white) //글씨색깔
                            .frame(maxWidth: .infinity) //폭넓이 최대
                            .background(.blue) //배경 : 파랑색
                            .cornerRadius(10) //모서리 둥글게
                            
                    }

            }.frame(width: 340)
            
            Spacer().frame(height : 20)
            Text("\(message)")
        }
      
        
        
    }
    func isValidEmailAddress(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //일반적인 이메일 주소 패턴
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex) //NSPredicate를 이용하여 주어진 문자열이 자기 자신과 정규식 패턴과 일치하는지를 평가
            return emailPredicate.evaluate(with: email) //입력한 이메일이 위의 정규식과 일치 불일치를 Bool값
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
