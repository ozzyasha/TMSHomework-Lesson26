//
//  UserTableViewCell.swift
//  TMSHomework-Lesson26
//
//  Created by Наталья Мазур on 26.02.24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabels() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(emailLabel)
        addSubview(addressLabel)
        addSubview(phoneLabel)
        addSubview(websiteLabel)
        addSubview(companyLabel)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 15),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            addressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            phoneLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 15),
            phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            websiteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 15),
            websiteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            companyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            companyLabel.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 15),
            companyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }

    func configure(users: User) {
        idLabel.text = "ID: \(users.id)"
        nameLabel.text = "Name: \(users.name)"
        usernameLabel.text = "Username: \(users.username)"
        emailLabel.text = "Email: \(users.email)"
        addressLabel.text = "Address: \(users.address.city),\n \(users.address.street), \(users.address.suite), \(users.address.zipcode).\n Geo: latitude \(users.address.geo.lat), longitude: \(users.address.geo.lng)"
        phoneLabel.text = "Phone: \(users.phone)"
        websiteLabel.text = "Website: \(users.website)"
        companyLabel.text = "Company: \(users.company.name)\n (\(users.company.bs))\n \(users.company.catchPhrase)"
    }
}
