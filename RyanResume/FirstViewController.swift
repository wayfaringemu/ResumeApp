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
    
    
    let myPhoneObject = TextObject()
    let myAddressObject = TextObject()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sizeToFit()
        setupTableViewArray()
    }
    
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
    
    // MARK: - Array Setup
    
    func setupTableViewArray() {
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "Ryan Kowalski", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "rykowalspt@gmail.com", labelType: .cellButton, fontType: nil, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "248-431-2816", labelType: .cellButton, fontType: nil, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Ortonville, Mi. 48462", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "PROFESSIONAL EXPERIENCE", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
        
        // MARK: - First Job
        tableViewArray.append(modelVc.createResumeCell(displayString: "2015-Present             Quicken Loans                       Detroit, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "iOS Developer", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Keep up to date with latest UI and code standards", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Build features and apps based on requirements from our business partners", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Assisting Quality Engineers with testing of our apps", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Build features both with and without Storyboards", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Utilizing libraries such as Alamofire to make and process network calls to Rest API", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Worked in fast paced AGILE environment", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        
        // MARK: - Second Job
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "2011-2015             Quicken Loans                       Detroit, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Mac Systems Engineer/ App Developer", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Wrote custom apps and scripts using Bash and Applescript", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Wrote Obj-C company directory iOS app", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Rewrote company directory iOS app in Swift", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Wrote company survey app in Swift", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Automated processes to make Mac’s perform as needed in our environment", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Built and maintained custom proprietary encryption enterprise solution", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Built and maintained custom Lock Screen implementation to work with all different screen sizes, company logos, and OS versions", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Built and maintained custom Mac and Linux vm’s for testing and production", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Architected and set up multiple MDM POC environments", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        
        // MARK: - Third Job
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "2009-2011             Quicken Loans                       Detroit, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Mac and Windows Desktop Technician", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Troubleshoot system issues with Mac’s and pc’s", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Deploy Mac and Windows machines to team members", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Work with Engineering teams to accomplish permanent resolutions", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        
        // MARK: - Education
        tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "EDUCATION", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "2014             Grand Circus                       Detroit, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "iOS Development Class", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "2011             Apple                       Novi, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Apple Certified Mac Technician", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "1997-2001             University of Michigan                       Flint, MI", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Business Major", labelType: .cellLabel, fontType: helveticaFont.italicBold, justification: .leftJustify))
        
        
        // MARK: - Skills
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "SKILLS", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .leftJustify))
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Bash, Applescript", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Swift / Objective C", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Agile", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Rest API", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * CocoaPods", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Carthage", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Alamofire", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "         * Linux", labelType: .cellLabel, fontType: helveticaFont.italic, justification: .leftJustify))
        
        self.tableView.reloadData()
    }
}

// MARK: - TableView Cell

class resumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var cellImageView: UIImageView?
    @IBOutlet weak var cellButton: UIButton?
}
