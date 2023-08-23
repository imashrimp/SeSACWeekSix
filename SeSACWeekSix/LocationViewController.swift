//
//  LocationViewController.swift
//  SeSACWeekSix
//
//  Created by 권현석 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 임포트
import MapKit
import SnapKit

class LocationViewController: UIViewController {
    
    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManger = CLLocationManager()
    
    let mapView = MKMapView()
    let tteokbokkiButton = UIButton()
    let noodleButton  = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        
        [tteokbokkiButton, noodleButton].forEach {
            view.addSubview($0)
        }
        
        tteokbokkiButton.backgroundColor = .red
        tteokbokkiButton.addTarget(self, action: #selector(tteokbokkiButtonTapped), for: .touchUpInside)
        
        
        noodleButton.backgroundColor = .blue
        
        tteokbokkiButton.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(50)
        }
        
        noodleButton.snp.makeConstraints { make in
            make.top.equalTo(tteokbokkiButton.snp.top)
            make.leading.equalTo(tteokbokkiButton.snp.trailing).offset(30)
            make.size.equalTo(50)
        }
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManger.delegate = self
        
        //Info.plist에서 설정한 것과 같은 걸로 골라야함.
        //얼럿 문구 띄우는 용도
        //        locationManger.requestWhenInUseAuthorization()
        setAnnotation(type: 0)
        
        checkDeviceLocationAhthorization()
        //37.517829, 126.886270
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
//        setRegionAndAnnotation(center: center)
    }
    
    @objc func tteokbokkiButtonTapped() {
        
        setAnnotation(type: 1) // 1
        print("+++")
    }
    
    func setAnnotation(type: Int) {
     //   37.518940, 126.885853 //걸작 떡볶이
      //  37.518829, 126.887853 //제주 올래 국수

        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.518940, longitude: 126.885853)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.518829, longitude: 126.887853)

        mapView.addAnnotations([annotation1, annotation2])
        
        
        if type == 0 { //viewDidLoad 상태
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation1])
        }
    }
    
    func setRegionAndAnnotation(center : CLLocationCoordinate2D) {
        //지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        //지도에 어노테이션(맵에 표시되는 핀) 추가
        let annotation = MKPointAnnotation()
        annotation.title = "영등포 새싹"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) {_ in
            
            //설정에서 직접적으로 앱 설정화면에 들어간적이 없다면
            //한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            //설정 페이지로 넘어갈지, 설정 상세 페이지 결정 불가능
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    
    func checkDeviceLocationAhthorization() {
        
        //iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                //현재 상용자의 권한 상태를 가져옴
                let authorization: CLAuthorizationStatus
                if #available(iOS 14.0, *) {
                    authorization = self.locationManger.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스 꺼져 있어서 위치 권한 요청 못함.")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check", status)
        
        switch status {
        case .notDetermined: //사용자가 앱에 처음 들어왔다거나 권한을 한 번만 허용한 경우
            locationManger.desiredAccuracy = kCLLocationAccuracyBest //정확도 설정
            locationManger.requestAlwaysAuthorization() //얼럿, infoplist 설정이 중요함.
        case .restricted:
            print("restricted")
        case .denied:
            print( "denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            //didUpdateLocation 메서드 실행
            locationManger.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default: //위치 권한 종류가 더 생길 가능성 대비
            print("default")
        }
    }
}


//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    //한 번만 실행되는게 아님. => iOS 위치 업데이트가 필요한 시점에 알아서 여러번 호출됨.
    //kCLLocationAccuracyBest 이 친구가 업데이트 되어야한다고 판단하면 호출됨.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
            //날씨 api 호출
        }
        
        //위치 업데이트를 한 번만 하고 싶은 경우 아래의 로직 실행하면 됨.
        //지속적인 추적(네비게이션 앱, 러닝앱)의 경우는 아래의 로직을 안 쓰지만 그렇지 않은 경우(날씨앱)은 아래의 로직을 사용함.
//        locationManger.stopUpdatingLocation()
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


extension LocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
}
