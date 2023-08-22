//
//  ExampleThreeViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit

class ExampleThreeViewController: UIViewController {
    
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "극한직업")
        return imageView
    }()
    
    let timeLabel = {
        let label = UILabel()
        label.text = "8월 22일 21시 17분"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    let locationButton = {
       let button = UIButton()
        let imageSize = UIImage.SymbolConfiguration(pointSize: 30)
        let image = UIImage(systemName: "location.fill", withConfiguration: imageSize)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let locationLabel = {
        let label = UILabel()
        label.text = "서울 영등포구"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    let shareButton = {
        let button = UIButton()
         let imageSize = UIImage.SymbolConfiguration(pointSize: 20)
         let image = UIImage(systemName: "square.and.arrow.up", withConfiguration: imageSize)
         button.setImage(image, for: .normal)
         button.tintColor = .white
         return button
    }()
    
    let refreshButton = {
        let button = UIButton()
         let imageSize = UIImage.SymbolConfiguration(pointSize: 20)
         let image = UIImage(systemName: "arrow.clockwise", withConfiguration: imageSize)
         button.setImage(image, for: .normal)
         button.tintColor = .white
         return button
    }()
    
    let tempLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "지금은 26°C 입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    let humidLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "습도는 90% 입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    let windLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "풍속은 2m/s 입니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    let weatherImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.rain.fill")
        imageView.tintColor = .black
        imageView.backgroundColor = .white
//        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let messageLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "오늘 하루도 수고하셨습니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backgroundImageView,
         timeLabel,
         locationButton,
         locationLabel,
         shareButton,
         refreshButton,
         tempLabel,
         humidLabel,
         windLabel,
         weatherImage,
         messageLabel].forEach {
            view.addSubview($0)
        }
        

        
        makeConstraints()
    }

    func makeConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        locationButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(timeLabel.snp.bottom).offset(12)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationButton)
            make.leading.equalTo(locationButton.snp.trailing).offset(12)
        }
        
        shareButton.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.equalTo(locationButton)
        }
        
        refreshButton.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.equalTo(locationButton)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(shareButton.snp.trailing).offset(20)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(locationButton.snp.bottom).offset(20)
        }
        
        humidLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(tempLabel.snp.bottom).offset(20)
        }
        
        windLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(humidLabel.snp.bottom).offset(20)
        }
        
        weatherImage.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(windLabel.snp.bottom).offset(20)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
        }
    }
    
}
