//
//  ViewController.swift
//  TrianglePrint
//
//  Created by Sai Kishore on 03/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let maxNumber = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (2*maxNumber) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainTableViewCell")!
        
        let numberArray = getNumberArray(index: indexPath.row
                                         , maxNumber: self.maxNumber)
        
        cell.textLabel?.text = numberArray.description
        
        return cell
    }
}

extension ViewController {
    // Functions
    private func getNumberArray(index: Int, maxNumber: Int) -> [Int]{
        var resultArray = [Int]()
        if (index <= maxNumber) {
            resultArray = Array(0...(maxNumber-index))
        }else {
            let mirroredIndex = maxNumber - (index - maxNumber)
            
            resultArray = Array(0...(maxNumber - mirroredIndex))
        }
        return resultArray
    }
}

