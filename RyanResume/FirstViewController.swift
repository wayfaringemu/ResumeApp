//
//  FirstViewController.swift
//  RyanResume
//
//  Created by ryan kowalski on 11/13/18.
//  Copyright © 2018 ryan kowalski. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var tableViewArray = [TextObject]()
    let modelVc = ModelViewController()
    
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resumeTableViewCell") as? resumeTableViewCell {
            
            switch tableViewArray[indexPath.row].labelType {
            case .cellLabel?:
                cell.cellLabel?.text = tableViewArray[indexPath.row].labelString
                cell.cellLabel?.font = tableViewArray[indexPath.row].fontType
                cell.cellButton?.isHidden = true
                if indexPath.row < 5 {
                    cell.cellLabel?.textAlignment = NSTextAlignment.center
                } else {
                    cell.cellLabel?.textAlignment = NSTextAlignment.left
                }
            case .cellButton?:
                cell.cellButton?.setTitle(tableViewArray[indexPath.row].buttonString, for: .normal)
                cell.cellLabel?.isHidden = true
            default: break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            print("email selected")
        case 2:
            print("phone selected")
        default: break
        }
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
            
            tableViewArray.append(modelVc.createResumeCell(displayString: myName, labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .centerJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: myEmail, labelType: .cellButton, fontType: nil, justification: .centerJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: myPhone, labelType: .cellButton, fontType: nil, justification: .centerJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: myAddress, labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(modelVc.createResumeCell(displayString: "PROFESSIONAL EXPERIENCE", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
            
//MARK: First Job
            
            tableViewArray.append(modelVc.createResumeCell(displayString: jobOneYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: jobOneTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobOneExperiences {
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(modelVc.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        
//MARK: Second Job
        
        if let jobTwoTitle = Constants.resumeObject.jobTwoTitle,
            let jobTwoYearCompanyLoc = Constants.resumeObject.jobTwoYearCompanyLoc {
            
            tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: jobTwoYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: jobTwoTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobTwoExperiences {
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(modelVc.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        
//MARK: Third Job
        
        if let jobThreeTitle = Constants.resumeObject.jobThreeTitle,
            let jobThreeYearCompanyLoc = Constants.resumeObject.jobThreeYearCompanyLoc {
            
            tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(modelVc.createResumeCell(displayString: jobThreeYearCompanyLoc, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
            tableViewArray.append(modelVc.createResumeCell(displayString: jobThreeTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            
            if let skillz = Constants.resumeObject.jobThreeExperiences {
                let skillzArray = skillz.split{$0 == ","}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(modelVc.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
            
//MARK: Education
            
            if let schoolOneDates = Constants.resumeObject.schoolOneYearCompanyDates,
                let schoolOneTitle = Constants.resumeObject.schoolOneTitle,
                let schoolTwoDates = Constants.resumeObject.schoolTwoYearCompanyDates,
                let schoolTwoTitle = Constants.resumeObject.schoolTwoTitle,
                let schoolThreeDates = Constants.resumeObject.schoolThreeYearCompanyDates,
                let schoolThreeTitle = Constants.resumeObject.schoolThreeTitle {
                
                tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
                
                tableViewArray.append(modelVc.createResumeCell(displayString: "EDUCATION", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolOneDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolOneTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolTwoDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolTwoTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolThreeDates, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                tableViewArray.append(modelVc.createResumeCell(displayString: schoolThreeTitle, labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
            }
            
//MARK: Skills
            
            tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
            
            tableViewArray.append(modelVc.createResumeCell(displayString: "SKILLS", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
            
            if let skillString = Constants.resumeObject.jobSkillString {
                let skillzArray = skillString.split{$0 == ","}.map(String.init)
                for skill in skillzArray {
                    let skillString = "         * " + skill
                    tableViewArray.append(modelVc.createResumeCell(displayString: skillString, labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
                }
            }
        }
        self.tableView.reloadData()
    }
}

//MARK: TableView Cell

class resumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var cellImageView: UIImageView?
    @IBOutlet weak var cellButton: UIButton?
}
