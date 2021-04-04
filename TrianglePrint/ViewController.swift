//
//  ViewController.swift
//  TrianglePrint
//
//  Created by Sai Kishore on 03/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let maxNumber = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (2*maxNumber) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let modelArray = getNumberArray(index: indexPath.row
                                         , maxNumber: self.maxNumber)
        cell.configure(with: modelArray)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        100
    }
}

extension ViewController {
    // Functions
    private func getNumberArray(index: Int, maxNumber: Int) -> [CollectionModel]{
        
        var models = [CollectionModel]()
        if (index <= maxNumber) {
             models = getModelArray(upperLimit: maxNumber - index)
        }else {
            let mirroredIndex = maxNumber - (index - maxNumber)
            
             models = getModelArray(upperLimit: maxNumber - mirroredIndex)
        }
        return models
    }
    
    // creates model array and returns it 
    func getModelArray(upperLimit: Int) -> [CollectionModel] {
        
        var models = [CollectionModel]()
        for i in 0...upperLimit {
            let model = CollectionModel(text: String(i))
            models.append(model)
        }
        return models
    }
}

