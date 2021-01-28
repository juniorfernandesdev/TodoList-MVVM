//
//  LoginViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 25/01/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btLoggin: UIButton!

    let btEye = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupeButtonEye()

        // Do any additional setup after loading the view.
    }

//    override func viewDidAppear(_ animated: Bool) {
//        performSegue(withIdentifier: "listNavigation", sender: nil)
//
//    }

    private func setupView() {
        self.btLoggin.layer.cornerRadius = 8

        self.tfLogin.attributedPlaceholder = NSAttributedString(string: "Digite seu e-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ButtonColor") ?? .white])

        self.tfPassword.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ButtonColor") ?? .white])
    }

    private func setupeButtonEye() {
        self.tfPassword.rightViewMode = .unlessEditing
        self.btEye.setImage(UIImage(named: "eye_close"), for: .normal)
        self.btEye.imageEdgeInsets = UIEdgeInsets(top: 3, left: -24, bottom: 3, right: 15)
        self.btEye.frame = CGRect(x: CGFloat(tfPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(22), height: CGFloat(16))
        self.btEye.addTarget(self, action: #selector(self.btn), for: .touchUpInside)
        self.tfPassword.rightView = self.btEye
        self.tfPassword.rightViewMode = .always

    }

    @IBAction func btn(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.tfPassword.isSecureTextEntry = false
            self.btEye.setImage(UIImage(named: "eye_open"), for: .normal)
        } else {
            self.tfPassword.isSecureTextEntry = true
            self.btEye.setImage(UIImage(named: "eye_close"), for: .normal)
        }
    }

    @IBAction func actionLogin(_ sender: Any) {
        Network.shared.createUser(email: self.tfLogin.text!, password: self.tfPassword.text!) { (id, error) in
            guard let id = id else {
                print("Mensagem de erro: \(error)")
                return
            }

            let vc = ListTodoViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)

            
        }
    }
}
