//
//  Network.swift
//  Todo List
//
//  Created by Junior Fernandes on 25/01/21.
//

import Foundation
import Firebase

class Network {
    static let shared = Network()
    var loginManager = Auth.auth()
    var dbManager = Firestore.firestore()

    typealias completion = (uid?, error?) -> Void
    typealias uid = String
    typealias error = String

    // MARK: Methods
    func createUser(email: String, password: String, completion: @escaping completion) {
        loginManager.createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            let uid = result.user.uid
            completion(uid, nil)
        }
    }

    func login(email: String, password: String, completion: @escaping completion) {
        loginManager.signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            let uid = result.user.uid
            completion(uid, nil)
        }
    }

    func logoutUser() {
        do {
            try! loginManager.signOut()
        } catch let signOutError as NSError {
            print("ERROR %@", signOutError)
        }
    }

    func addTodo(title: [String]) {
        dbManager.collection("todo").document(loginManager.currentUser!.uid).setData(["tarefas" : title])
    }
}
