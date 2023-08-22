//
//  SnapViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView 위치
 superView
 offset inset
 RTL: leading vs left, trailing vs right
 */

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    let whiteView = UIView()
    let yellowView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
    
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(200)
        }
        
        whiteView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            make.edges.equalTo(whiteView).inset(50)
        }

    }
    

}
