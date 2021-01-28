//
//  RegisterViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 27/01/21.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: IbOutlet
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var ftEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var btCancel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    //MARK: Views
    private func setupView() {
        //textField
        self.tfName.attributedPlaceholder = NSAttributedString(string: "Digite seu nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ButtonColor") ?? .white])
        self.ftEmail.attributedPlaceholder = NSAttributedString(string: "Digite seu e-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ButtonColor") ?? .white])
        self.tfPassword.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ButtonColor") ?? .white])

        //button
        self.btRegister.layer.cornerRadius = 8
        self.btCancel.layer.cornerRadius = 8
    }

    //MARK: Action
    @IBAction func actionClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func actionRegisterUser(_ sender: UIButton) {
        Network.shared.createUser(email: self.ftEmail.text!, password: self.tfPassword.text!) { (uid, error) in
            print("teste")
        }
    }

    //MARK: Methods

    private func registerUser() {

    }
}
