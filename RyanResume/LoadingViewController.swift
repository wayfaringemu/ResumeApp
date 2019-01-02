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
            }
        }
    }
    
    func getAPIData() {
        let url = Constants.apiUrl
        let headers = [
            "Content-Type":"application/JSON",
            "authorization" : Constants.apiKey
        ]
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response

    //MARK: Header
                
                if let myName = json.value(forKeyPath: "headerOne.name") as? String,
                    let myAddress = json.value(forKeyPath: "headerOne.address") as? String,
                    let myEmail = json.value(forKeyPath: "headerOne.email") as? String,
                    let myPhone = json.value(forKeyPath: "headerOne.phone") as? String {
                    Constants.resumeObject.myName = myName
                    Constants.resumeObject.myAddress = myAddress
                    Constants.resumeObject.myEmail = myEmail
                    Constants.resumeObject.myPhone = myPhone
                }
                
    //MARK: Job One
                
                if let jobOneTitle = json.value(forKeyPath: "jobs.jobOne.title") as? String,
                    let jobOneYearCompanyLoc = json.value(forKeyPath: "jobs.jobOne.yearCompanyDates") as? String,
                    let jobOneExperiences = json.value(forKeyPath: "jobs.jobOne.experiences") as? String {
                    Constants.resumeObject.jobOneTitle = jobOneTitle
                    Constants.resumeObject.jobOneYearCompanyLoc = jobOneYearCompanyLoc
                    Constants.resumeObject.jobOneExperiences = jobOneExperiences
                }
                
    //MARK: Job Two
                
                if let jobTwoTitle = json.value(forKeyPath: "jobs.jobTwo.title") as? String,
                    let jobTwoYearCompanyLoc = json.value(forKeyPath: "jobs.jobTwo.yearCompanyDates") as? String,
                    let jobTwoExperiences = json.value(forKeyPath: "jobs.jobTwo.experiences") as? String {
                    Constants.resumeObject.jobTwoTitle = jobTwoTitle
                    Constants.resumeObject.jobTwoYearCompanyLoc = jobTwoYearCompanyLoc
                    Constants.resumeObject.jobTwoExperiences = jobTwoExperiences
                }
                
    // MARK: Job Three
                
                if let jobThreeTitle = json.value(forKeyPath: "jobs.jobThree.title") as? String,
                    let jobThreeYearCompanyLoc = json.value(forKeyPath: "jobs.jobThree.yearCompanyDates") as? String,
                    let jobThreeExperiences = json.value(forKeyPath: "jobs.jobThree.experiences") as? String,
                    let skillString = json.value(forKeyPath: "skills.skillNamesCSV") as? String {
                    Constants.resumeObject.jobThreeTitle = jobThreeTitle
                    Constants.resumeObject.jobThreeYearCompanyLoc = jobThreeYearCompanyLoc
                    Constants.resumeObject.jobThreeExperiences = jobThreeExperiences
                    Constants.resumeObject.jobSkillString = skillString
                }

    //MARK: Education
                
                if let schoolOneTitle = json.value(forKeyPath: "jobs.education.placeOne.className") as? String,
                    let schoolOneYearCompanyDates = json.value(forKeyPath: "jobs.education.placeOne.yearCompanyDates") as? String,
                    let schoolTwoTitle = json.value(forKeyPath: "jobs.education.placeTwo.className") as? String,
                    let schoolTwoYearCompanyDates = json.value(forKeyPath: "jobs.education.placeTwo.yearCompanyDates") as? String,
                    let schoolThreeTitle = json.value(forKeyPath: "jobs.education.placeThree.className") as? String,
                    let schoolThreeYearCompanyDates = json.value(forKeyPath: "jobs.education.placeThree.yearCompanyDates") as? String
                {
                    Constants.resumeObject.schoolOneYearCompanyDates = schoolOneYearCompanyDates
                    Constants.resumeObject.schoolOneTitle = schoolOneTitle
                    Constants.resumeObject.schoolTwoYearCompanyDates = schoolTwoYearCompanyDates
                    Constants.resumeObject.schoolTwoTitle = schoolTwoTitle
                    Constants.resumeObject.schoolThreeYearCompanyDates = schoolThreeYearCompanyDates
                    Constants.resumeObject.schoolThreeTitle = schoolThreeTitle
                }
                self.navigateToNextScreen()
            }
        }
    }
    
    func navigateToNextScreen() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            self.present(vc, animated: true, completion: nil)
        }
    }
}
