//
//  MenuViewController.swift
//  Todo List
//
//  Created by Junior Fernandes on 28/01/21.
//

import UIKit

protocol Logout {
    func logout()
}

class MenuViewController: UIViewController {
    var delegate: Logout?

    lazy var profileImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "SecondColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 113 / 2
        view.layer.masksToBounds = true

        return view
    }()

    lazy var userName: UITextField = {
        var text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.borderStyle = .none
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        text.text = "Junior \nFernandes"
        return text
    }()

    fileprivate lazy var buttonLogOut: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.setTitleColor(UIColor(named: "PrimaryColor"), for: .normal)
        button.setTitle("Sair", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sair), for: .touchUpInside)

        return button
        }()

    fileprivate lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PrimaryColor")

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileImage)
        self.view.addSubview(headerView)
        self.view.addSubview(userName)
        self.view.addSubview(buttonLogOut)
        view.layer.backgroundColor = UIColor(named: "PrimaryColor")?.cgColor
        self.setupView()
    }

    func setupView() {
        //Image profile
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            profileImage.heightAnchor.constraint(equalToConstant: 113),
            profileImage.widthAnchor.constraint(equalToConstant: 113)
        ])

        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            userName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
        ])

        NSLayoutConstraint.activate([
            buttonLogOut.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonLogOut.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            buttonLogOut.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
        ])



        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 100),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

      ])
    }

    @objc func sair() {
        Network.shared.logoutUser()
        
        dismiss(animated: true) {
            self.delegate?.logout()
        }
    }

}
