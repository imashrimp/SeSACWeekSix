//
//  TextViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    let photoImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
           view.backgroundColor = .systemMint
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요,"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown

        
        [photoImageView, titleTextField].forEach {
            view.addSubview($0)
        }
        
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)
        
        makeConstraints()

    }
    
    func makeConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
//            make.leading.equalTo(view).inset(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}
