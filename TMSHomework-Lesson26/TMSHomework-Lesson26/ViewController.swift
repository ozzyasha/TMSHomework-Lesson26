//
//  ViewController.swift
//  TMSHomework-Lesson26
//
//  Created by Наталья Мазур on 26.02.24.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    enum Constants {
        static let usersApiUrl = "https://jsonplaceholder.typicode.com/users"
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    var userArray: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setupTableView()
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])

        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        tableView.reloadData()
    }

    private func getUsers() {
        let requestQueue = DispatchQueue(label: "com.example.requestQueue", qos: .utility)

        AF.request(Constants.usersApiUrl).responseDecodable(of: Users.self, queue: requestQueue) { response in
            switch response.result {
            case let .success(users):
                DispatchQueue.main.async {
                    for user in users {
                        self.userArray.append(user)
                    }
                }
            case let .failure(error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.configure(user: userArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
