//
//  ViewController.swift
//  AlertCotroller
//
//  Created by 503-03 on 2018. 11. 7..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var btnlogin: UIButton!
    @IBAction func login(_ sender: Any) {
        
        //로그인 대화상자 생성
        let loginAlert = UIAlertController(title: "로그인", message: nil, preferredStyle: .alert)
       //대화상자에 textField 추가
        loginAlert.addTextField(configurationHandler: {(id) in id.placeholder = "아이디를 입력하세요."; id.isSecureTextEntry = false})
        loginAlert.addTextField(configurationHandler: {(pw) in pw.placeholder = "비밀번호을 입력하세요."; pw.isSecureTextEntry = true})
        
        //버튼 설정
        let ok = UIAlertAction.init(title: "확인", style: .default, handler: {(action) in
            //id와 pw 확인을 위하여 textfield의 text 가져오기
            let id = loginAlert.textFields?[0].text
            let pw = loginAlert.textFields?[1].text
            
            //자신의 앱에 있는 AppDelegate 클래스의 객체 가져오기
            //형 변환은 AppDelegate 클래스에는 상속받은 클래스가 있기때문이다
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            if id == "root" && pw == "1234"{
                appDelegate.session = id
                self.result.text = "\(appDelegate.session!)님 로그인 중입니다."
                self.btnlogin.setTitle("로그아웃", for: .normal)
                
            }else{
                self.result.text = "아이디 혹은 비밀번호가 틀렸습니다."
            }
        })
        
        let cancel = UIAlertAction.init(title: "취소", style: .cancel)
        //버튼 추가
        loginAlert.addAction(ok)
        loginAlert.addAction(cancel)
        //UIViewController에 대화상자 추가
        self.present(loginAlert, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.session == nil{
            result.text = "로그인하세요"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

