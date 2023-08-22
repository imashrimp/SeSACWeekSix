//
//  ExampleTwoViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit

class ExampleTwoViewController: UIViewController {
    
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "태극기휘날리며")
        return imageView
    }()
    
    let xButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let giftButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gift"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let diceButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "dice"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let settingButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let profileImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let userNameLabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .heavy)
        label.text = "사용자 이름"
        return label
    }()
    
    let chattingButton = {
        let button = UIButton()
        let imageSize = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: "bubble.left.fill", withConfiguration: imageSize)
        button.setImage(image, for: .normal)
//        button.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let chattingLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let badgeOne = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .systemRed
        return imageView
    }()
    
    let editProfileButton = {
        let button = UIButton()
        let imageSize = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: "pencil", withConfiguration: imageSize)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .white
        return button
    }()
    
    let editProfileLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let badgeTwo = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .systemRed
        return imageView
    }()
    
    let storyButton = {
        let button = UIButton()
        let imageSize = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: "quote.closing", withConfiguration: imageSize)
        button.setImage(image, for: .normal)
//        button.setImage(UIImage(systemName: "quote.closing"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let storyLabel = {
        let label = UILabel()
        label.text = "스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backgroundImageView,
         xButton,
         giftButton,
         diceButton,
         settingButton,
        settingButton,
        profileImageView,
        userNameLabel,
        chattingButton,
        chattingLabel,
         badgeOne,
        editProfileButton,
        editProfileLabel,
        badgeTwo,
        storyButton,
        storyLabel].forEach {
            view.addSubview($0)
        }
        
        makeConstraints()
    }
    
    
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        xButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.leading.top.equalTo(backgroundImageView).offset(12)
        }
        
        giftButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.centerY.equalTo(xButton)
        }
        
        diceButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.centerY.equalTo(xButton)
            make.leading.equalTo(giftButton.snp.trailing).offset(8)
        }

        settingButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.leading.equalTo(diceButton.snp.trailing).offset(8)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalToSuperview().multipliedBy(0.1)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(UIScreen.main.bounds.height / 6)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom)
        }
        
        chattingButton.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.centerY.equalTo(editProfileButton)
        }
        
        chattingLabel.snp.makeConstraints { make in
            make.centerX.equalTo(chattingButton)
            make.top.equalTo(chattingButton.snp.bottom)
        }
        
        badgeOne.snp.makeConstraints { make in
            make.size.equalTo(10)
            make.leading.equalTo(editProfileButton.snp.trailing).inset(18)
            make.top.equalTo(editProfileButton.snp.top).inset(18)
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.leading.equalTo(chattingButton.snp.trailing).offset(25)
        }
        
        editProfileLabel.snp.makeConstraints { make in
            make.centerX.equalTo(editProfileButton)
            make.top.equalTo(editProfileButton.snp.bottom)
        }
        
        badgeTwo.snp.makeConstraints { make in
            make.size.equalTo(10)
            make.leading.equalTo(storyButton.snp.trailing).inset(18)
            make.top.equalTo(storyButton.snp.top).inset(18)
        }
        
        storyButton.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.centerY.equalTo(editProfileButton)
            make.leading.equalTo(editProfileButton.snp.trailing).offset(25)
        }
        
        storyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(storyButton)
            make.top.equalTo(storyButton.snp.bottom)
        }
    }
}

