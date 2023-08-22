//
//  LocationViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 임포트

class LocationViewController: UIViewController {
    
    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManger.delegate = self
        
        //Info.plist에서 설정한 것과 같은 걸로 골라야함.
        //얼럿 문구 띄우는 용도
        //        locationManger.requestWhenInUseAuthorization()
        
        
        checkDeviceLocationAhthorization()
    }
    
    
    func checkDeviceLocationAhthorization() {
        
        //iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManger.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                
            } else {
                print("위치 서비스 꺼져 있어서 위치 권한 요청 못함.")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestAlwaysAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print( "denied")
        case .authorizedAlways:
            print("denied")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManger.startUpdatingLocation()
        case .authorized:
            print("authorized")
        }
    }
}


//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("===", locations)
    }
    
    //6. 사용자의 위치를 가지고 오지 못한 경우. 권한에 대한 경우도 이 메서드에서 처리함.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //7. 사용자의 권한 상태가 바뀔 때를 알려줌
    //거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    //허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    //iOS 14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAhthorization()
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    
    //iOS 14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
