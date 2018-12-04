//
//  LoadingViewController.swift
//  RyanResume
//
//  Created by ryan kowalski on 11/24/18.
//  Copyright © 2018 ryan kowalski. All rights reserved.
//

import UIKit
import Alamofire

class LoadingViewController: UIViewController {
    
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    let imageWidth = 274.0
    let imageHeight = 257.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    func setupView() {
        let image = UIImage(named: "AppIcon")
        let imageView = UIImageView(image: image)

        imageView.frame = CGRect(x: (view.frame.width - 274) / 2, y: (view.frame.height - 257) / 2, width: 274, height: 257)
//        loadingImageView.image = UIImage(named: "AppIcon")
        view.addSubview(imageView)
        

        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 2.0, animations: { () -> Void in
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = 360 //Double.pi
//                rotationAnimation.duration = 2.0
                
                imageView.layer.add(rotationAnimation, forKey: nil)
            }) { (succeed) -> Void in
                self.getAPIData()
//                self.navigateToNextScreen()
            }
        }
    }

    
    func getAPIData() {
        let url = "http://mockx.io/apis/15429800845bf801f48e335"
        let headers = [
            "Content-Type":"application/JSON",
            "authorization" : "15429800845bf801f48e335"
        ]
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
    }
    
    func navigateToNextScreen() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            self.present(vc, animated: true, completion: nil)
        }
    }
}
