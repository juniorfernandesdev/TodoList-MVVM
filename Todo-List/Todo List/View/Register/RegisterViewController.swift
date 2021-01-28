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
        if self.checkFields() == true {
            Network.shared.createUser(email: self.ftEmail.text!, password: self.tfPassword.text!) { (uid, error) in
                print("Cadastrao realizado com sucesso")
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            print("Campo vazio")
        }

    }

    //MARK: Methods
    private func checkFields() -> Bool {
        if !self.ftEmail.text!.isEmpty && !self.tfName.text!.isEmpty && !self.tfPassword.text!.isEmpty {
            return true
        }
        return false
    }

    private func registerUser() {

    }
}
