//
//  ViewController.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

import UIKit

class ViewController: UIViewController {
    let content : [Content] = Content.getContent()
    lazy var tableView = {
        $0.dataSource = self // !!
        $0.register(CardCellView.self, forCellReuseIdentifier: CardCellView.identifier) // !!
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // !!
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // !!
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardCellView.identifier, for: indexPath) as? CardCellView // !!
        else { return UITableViewCell() }
        
        cell.setupCell(content: content[indexPath.row]) // !!
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.setupPage(content: content[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
