//
//  ViewController.swift
//  UIKit-HW4-1
//
//  Created by Дима on 11/25/24.
//

import UIKit

class ViewController: UIViewController {
    let name = "Дмитрий"
    let surname = "Варызгин"
    let profileImage = UIImage(named: "ProfileImage")
    let photoImage = UIImage(named: "PhotoImage")
    let photoTitle = "Eagle"
    let contentHeader = "Black & White"
    let contentDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
    
    let margin : CGFloat = 30
    enum textType { case hugeHeader, megaHeader, header, description }
    enum colorScheme { case black, white, gray, green }
    
    lazy var profileImageView = SetupImageView(image: profileImage, cornerRadius: 30)
    
    lazy var nameLabel = SetupLabel(text: name, style: .header, color: .black)
    lazy var surnameLabel = SetupLabel(text: surname, style: .header, color: .black)
    
    lazy var contentView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 30
        $0.backgroundColor = Colorizer(.gray)
        return $0
    } (UIView())
    
    lazy var photoImageView = SetupImageView(image: photoImage)
    lazy var photoTitleLabel = SetupLabel(text: photoTitle, style: .hugeHeader, color: .white)
    
    lazy var contentHeaderLabel = SetupLabel(text: contentHeader, style: .megaHeader, color: .black)
    lazy var contentDescriptionLabel = SetupLabel(text: contentDescription, style: .description, color: .black)
    
    lazy var nextButton = SetupTextButton(text: "Next", textColor: .white, backgroundColor: .green, radius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        
        view.addSubview(contentView)
        contentView.addSubview(photoImageView)
        photoImageView.addSubview(photoTitleLabel)
        contentView.addSubview(contentHeaderLabel)
        contentView.addSubview(contentDescriptionLabel)
        contentView.addSubview(nextButton)

        setupConstraints()
    }

    func SetupLabel(text: String, style: textType, color: colorScheme) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = Colorizer(color)
        label.numberOfLines = 0
        
        switch style {
        case .hugeHeader: label.font = .boldSystemFont(ofSize: 30)
        case .megaHeader: label.font = .boldSystemFont(ofSize: 20)
        case .header: label.font = .boldSystemFont(ofSize: 18)
        case .description: label.font = .systemFont(ofSize: 16)
        }
        
        return label
    }
    
    func SetupImageView(image: UIImage?, cornerRadius: CGFloat = 20) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = cornerRadius
        return imageView
    }
    
    func SetupTextButton(text: String, textColor: colorScheme, backgroundColor: colorScheme, radius: CGFloat) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(Colorizer(textColor), for: .normal)
        button.backgroundColor = Colorizer(backgroundColor)
        button.layer.cornerRadius = radius
        return button
    }
    
    func Colorizer(_ color: colorScheme) -> UIColor {
        switch color {
        case .black: return .black
        case .white: return .white
        case .green: return UIColor(red: 37/255, green: 169/255, blue: 82/255, alpha: 1)
        case .gray: return UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        }
    }
    
    func setupConstraints() {
        let profileImageViewSize : CGFloat = 63;
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageViewSize),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageViewSize),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: margin / 3),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin / 3),
            nameLabel.bottomAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -2),
            
            surnameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: margin / 3),
            surnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin / 3),
            surnameLabel.topAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 2),
            
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2/3 * margin),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -2/3 * margin),
            contentView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 2/3 * margin),
            
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2/3 * margin),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2/3 * margin),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2/3 * margin),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 3/4),
            
            photoTitleLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: 2/3 * margin),
            photoTitleLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -2/3 * margin),
            photoTitleLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -2/3 * margin),
            
            contentHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4/3 * margin),
            contentHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4/3 * margin),
            contentHeaderLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 2/3 * margin),
            
            contentDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2/3 * margin),
            contentDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2/3 * margin),
            contentDescriptionLabel.topAnchor.constraint(equalTo: contentHeaderLabel.bottomAnchor, constant: 1/3 * margin),
            
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2/3 * margin),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2/3 * margin),
            nextButton.topAnchor.constraint(equalTo: contentDescriptionLabel.bottomAnchor, constant: 2/3 * margin),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2/3 * margin),
            nextButton.heightAnchor.constraint(equalToConstant: 3/2 * margin),
            
            contentView.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 2/3 * margin)
        ])
    }
}

