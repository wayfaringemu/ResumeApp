//
//  FirstViewController.swift
//  RyanResume
//
//  Created by ryan kowalski on 11/13/18.
//  Copyright © 2018 ryan kowalski. All rights reserved.
//

import UIKit
import MessageUI

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    lazy var tableViewArray = [UITableViewCell]()
    var labelHeight: CGFloat = 0.0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewArray()
    }
    
//MARK: TableView Functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return labelHeight
        } else {
            return labelHeight + 24
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewArray[indexPath.row]
    }
    
//MARK: Array Setup
    
    func setupTableViewArray() {
        if let myName = Constants.resumeObject.myName,
            let myEmail = Constants.resumeObject.myEmail,
            let myPhone = Constants.resumeObject.myPhone,
            let myAddress = Constants.resumeObject.myAddress,
            let jobOneTitle = Constants.resumeObject.jobOneTitle,
            let jobOneYearCompanyLoc = Constants.resumeObject.jobOneYearCompanyLoc
        {
            
            tableViewArray.append(self.createResumeCell(displayString: myName, labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .centerJustify))
            tableViewArray.append(self.createResumeCell(displayString: myEmail, labelType: .cellButton, fontType: nil, justification: .centerJustify))
            tableViewArray.append(self.createResumeCell(displayString: myPhone, labelType: .cellButton, fontType: nil, justification: .centerJustify))
            tableViewArray.append(self.createResumeCell(displayString: myAddress, labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            tableViewArray.append(self.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(self.createResumeCell(displayString: "PROFESSIONAL EXPERIENCE", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
            
//MARK: First Job
            
            tableViewArray.append(self.createResumeCell(displayString: jobOneYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(self.createResumeCell(displayString: jobOneTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobOneExperiences {
                let skillzArray = skillz.split{$0 == "_"}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(self.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        
//MARK: Second Job
        
        if let jobTwoTitle = Constants.resumeObject.jobTwoTitle,
            let jobTwoYearCompanyLoc = Constants.resumeObject.jobTwoYearCompanyLoc {
            
            tableViewArray.append(self.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            tableViewArray.append(self.createResumeCell(displayString: jobTwoYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(self.createResumeCell(displayString: jobTwoTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobTwoExperiences {
                let skillzArray = skillz.split{$0 == "_"}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(self.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        
//MARK: Third Job
        
        if let jobThreeTitle = Constants.resumeObject.jobThreeTitle,
            let jobThreeYearCompanyLoc = Constants.resumeObject.jobThreeYearCompanyLoc {
            
            tableViewArray.append(self.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(self.createResumeCell(displayString: jobThreeYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(self.createResumeCell(displayString: jobThreeTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobThreeExperiences {
                let skillzArray = skillz.split{$0 == "_"}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(self.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
            
//MARK: Education
            
            if let schoolOneDates = Constants.resumeObject.schoolOneYearCompanyDates,
                let schoolOneTitle = Constants.resumeObject.schoolOneTitle,
                let schoolTwoDates = Constants.resumeObject.schoolTwoYearCompanyDates,
                let schoolTwoTitle = Constants.resumeObject.schoolTwoTitle,
                let schoolThreeDates = Constants.resumeObject.schoolThreeYearCompanyDates,
                let schoolThreeTitle = Constants.resumeObject.schoolThreeTitle {
                
                tableViewArray.append(self.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
                
                tableViewArray.append(self.createResumeCell(displayString: "EDUCATION", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolOneDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolOneTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolTwoDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolTwoTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolThreeDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(self.createResumeCell(displayString: schoolThreeTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            }
            
//MARK: Skills
            
            tableViewArray.append(self.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(self.createResumeCell(displayString: "SKILLS", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
            
            if let skillString = Constants.resumeObject.jobSkillString {
                let skillzArray = skillString.split{$0 == "_"}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(self.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        self.tableView.reloadData()
    }
    
//MARK: Create Cells:
    
    func createResumeCell(displayString: String, labelType: CellTypes, fontType: UIFont?, justification: CellJustification ) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resumeTableViewCell") as? resumeTableViewCell {
            
            switch labelType {
            case .cellLabel:
                cell.cellLabel?.text = displayString
                cell.cellLabel?.font = fontType
                cell.cellButton?.isHidden = true
                if Constants.objectCount < 5 {
                    cell.cellLabel?.textAlignment = NSTextAlignment.center
                } else {
                    cell.cellLabel?.textAlignment = NSTextAlignment.left
                }
            case .cellButton:
                cell.cellButton?.setTitle(displayString, for: .normal)
                cell.tag = Constants.objectCount
                cell.cellLabel?.isHidden = true
            }
            if let font = fontType, displayString.height(constraintedWidth: self.view.frame.width, font: font) > labelHeight {
                labelHeight = displayString.height(constraintedWidth: self.view.frame.width, font: font)
            }
            Constants.objectCount += 1
            return cell
        }
        return UITableViewCell()
    }
    
//MARK: Button Clicked Action
    
    @IBAction func cellButtonClicked(_ sender: UIButton) {
        if let emailTitle = Constants.resumeObject.myEmail {
            if sender.currentTitle == emailTitle {
                let email = emailTitle
                if let url = URL(string: "mailto:\(email)") {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            } else {
                if let myPhone = Constants.resumeObject.myPhone {
                    var phoneString = myPhone
                    phoneString = phoneString.replacingOccurrences(of: "(", with: "", options: NSString.CompareOptions.literal, range:nil)
                    phoneString = phoneString.replacingOccurrences(of: ")", with: "", options: NSString.CompareOptions.literal, range:nil)
                    phoneString = phoneString.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range:nil)
                    phoneString = phoneString.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range:nil)
                    print(phoneString)
                    
                    if let number = URL(string: "tel://" + phoneString) {
                    UIApplication.shared.open(number, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }
}

//MARK: TableView Cell

class resumeTableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var cellButton: UIButton?
}

extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
}
