//
//  ViewController.swift
//  RyanResume
//
//  Created by ryan kowalski on 11/13/18.
//  Copyright © 2018 ryan kowalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var tableViewArray = [TextObject]()
    let modelVc = ModelViewController()

    
    let myPhoneObject = TextObject()
    let myAddressObject = TextObject()

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            setupTableViewArray()
    }
    
    func setupTableViewArray() {
        
        tableViewArray.append(modelVc.createResumeCell(displayString: "Ryan Kowalski", labelType: .cellLabel, fontType: chalkBoardFont.bold, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "rykowalspt@gmail.com", labelType: .cellButton, fontType: nil, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "248-431-2816", labelType: .cellButton, fontType: nil, justification: .centerJustify))
        tableViewArray.append(modelVc.createResumeCell(displayString: "Ortonville, Mi. 48462", labelType: .cellLabel, fontType: helveticaFont.regular, justification: .centerJustify))

//        tableView.reloadData()
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
                cell.cellLabel?.textAlignment = NSTextAlignment.center
            case .cellButton?:
                cell.cellButton?.setTitle(tableViewArray[indexPath.row].buttonString, for: .normal)
                cell.cellLabel?.isHidden = true
            default: break
            }

            
            return cell
        }
        return UITableViewCell()
    }
}



class resumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel?
    @IBOutlet weak var cellImageView: UIImageView?
    @IBOutlet weak var cellButton: UIButton?
}
