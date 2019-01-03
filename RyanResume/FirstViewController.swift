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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sizeToFit()
        setupTableViewArray()
    }
    
    //MARK: TableView Functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewArray[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            print("email selected")
            if let myEmail = Constants.resumeObject.myEmail {
                sendEmail(emailAddress: myEmail)
            }
        case 2:
            print("phone selected")
            if let myPhone = Constants.resumeObject.myPhone, let number = URL(string: "tel://" + myPhone) {
                myPhone.makeACall()
            }
        default: break
        }
    }
    
//MARK: Compose Email
    
    func sendEmail(emailAddress: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([emailAddress])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
            print("email failed to present")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
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
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
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
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
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
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
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
                let skillzArray = skillString.split{$0 == ","}.map(String.init)
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
                cell.cellLabel?.isHidden = true
            }
            Constants.objectCount += 1
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: TableView Cell

class resumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var cellImageView: UIImageView?
    @IBOutlet weak var cellButton: UIButton?
}

extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
