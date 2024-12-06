//
//  ViewController.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

import UIKit

class ViewController: UIViewController {
    let cardContent : [CardContent] = CardContent.getImages()
    lazy var tableView = {
        $0.dataSource = self // !!
        $0.register(CardCellView.self, forCellReuseIdentifier: CardCellView.identifier) // !!
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // !!
        cardContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // !!
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardCellView.identifier, for: indexPath) as? CardCellView // !!
        else { return UITableViewCell() }
        
        cell.setupCell(cardContent: cardContent[indexPath.row]) // !!
        cell.selectionStyle = .none
        return cell
    }
}
