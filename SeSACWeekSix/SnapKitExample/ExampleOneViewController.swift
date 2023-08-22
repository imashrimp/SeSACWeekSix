//
//  ExampleOneViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleOneViewController: UIViewController {

    let grayView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleTextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 15)
        textField.layer.borderWidth = 2
       return textField
    }()
    
    let dateTextField = {
       let textField = UITextField()
        textField.placeholder = "날짜를 입력해주세요."
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 15)
        textField.layer.borderWidth = 2
        return textField
    }()
    
    let detailTextVeiw = {
       let textView = UITextView()
        textView.clipsToBounds = true
        textView.layer.borderWidth = 2
        textView.font = .systemFont(ofSize: 15)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(grayView)
        view.addSubview(titleTextField)
        view.addSubview(dateTextField)
        view.addSubview(detailTextVeiw)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        grayView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(10)
            make.top.equalTo(grayView.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(10)
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        detailTextVeiw.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(10)
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
