//
//  ViewController.swift
//  MyCustomTableView
//
//  Created by M3ts LLC on 10/22/21.
//

import UIKit
import SpreadsheetView

class ViewController: UIViewController, SpreadsheetViewDataSource, SpreadsheetViewDelegate {
    
    // MARK: - Properties
   private let spreadsheetView = SpreadsheetView()
    let data = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView.register(MyLabelCell.self, forCellWithReuseIdentifier: MyLabelCell.identifier)
        spreadsheetView.gridStyle = .solid(width: 1, color: .link)
        spreadsheetView.delegate = self
        spreadsheetView.dataSource = self
        view.addSubview(spreadsheetView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        spreadsheetView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height - 100)
    }
    
    // MARK: - SpreadsheetViewDataSource, SpreadsheetViewDelegate
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: MyLabelCell.identifier, for: indexPath) as! MyLabelCell
        if indexPath.section == 0 { // first column
            cell.setup(with: data[indexPath.row])
            cell.backgroundColor = .systemTeal
        } else {
            cell.setup(with: "Enter Task")
            
        }
        return cell
    }
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 200
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return data.count
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        return 80
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        return 40
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - MyLabelCell
class MyLabelCell: Cell {
    static let identifier = "MyCell"
    private let lable = UILabel()
    public func setup(with text: String) {
        lable.text = text
        lable.textAlignment = .center
        contentView.addSubview(lable)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lable.frame = contentView.bounds
    }
}
