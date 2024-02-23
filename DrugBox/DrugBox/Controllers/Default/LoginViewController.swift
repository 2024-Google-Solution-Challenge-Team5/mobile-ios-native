//
//  LoginViewController.swift
//  DrugBox
//
//  Created by 김도연 on 1/27/24.
//
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.loginSegue, sender: self)
//        if let email = EmailTextField.text, let password = PasswordTextField.text {
//            postLogin(email: email, pw: password)
//            self.performSegue(withIdentifier: K.loginSegue, sender: self)
//        }
    }
    
    
    @IBAction func googleLoginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.loginSegue, sender: self)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
    }
    
    
    func postLogin(email: String, pw: String) {
        let parameters = "{\r\n    \"email\": \"\(email)\",\r\n    \"password\": \"\(pw)\"\r\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: K.apiURL.loginURL)!,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                        print(String(describing: error))
                        exit(EXIT_SUCCESS)
                }
                print(String(data: data, encoding: .utf8)!)
                exit(EXIT_SUCCESS)
        }

        task.resume()
        dispatchMain()
    }
    
}



