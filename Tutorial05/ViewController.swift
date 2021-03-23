//
//  ViewController.swift
//  Tutorial05
//
//  Created by Kaito Hattori on 2021/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var fruits: [String] = [
        "オレンジ",
        "リンゴ",
        "ブドウ",
        "バナナ",
        "キウイ",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.reloadData()
    }
    
    // セルの数。realoadData()を呼び出された後、最初に一回だけ呼び出される。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    // セルの内容を返す。realoadData()を呼び出された後、セルの数だけ呼び出される。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // fruitCellというidを持ったcellをFruitCell型として読み込む。idはMain.storyboardのcellの設定に記述している。
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath) as! FruitCell
        // cellのtitleLabelのtextをfruitsの{indexPath.row}番目の要素にする。indexPath.rowはfruitsの数だけ０から{fruits.count - 1}まで順番に呼び出される。
        cell.titleLabel.text = fruits[indexPath.row]
        // cellを返す。
        return cell
    }
    
}
