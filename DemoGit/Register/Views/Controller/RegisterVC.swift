//
//  RegisterVC.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet private var tableView: UITableView!
    var viewModel = RegisterVM()
        
    //MARK:- view controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    func initialSetup() {
        tableView.register(UINib.init(nibName: "ListCell", bundle: nil) , forCellReuseIdentifier: "ListCell")
        viewModel.getRegisterList()
        self.observeViewState()
    }

    private func observeViewState() {
        self.viewModel.onViewStateChange = { _ in
            self.onStateChange()
        }
        onStateChange()
    }
    
    
    // MARK: - View state change
    private func onStateChange() {
        switch viewModel.viewState {
        case .empty:
            break

        case .ready(let status):
            switch status {
            case .getList:
                self.tableView.reloadData()
            }
        case .error(let error):
            print("error == \(error)")
        default:
            break
        }
    }
    
    //MARK:- button actions
    
    func btnRegisterClicked() {
        let storyboardIn = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboardIn.instantiateViewController(identifier: "ProfileVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension RegisterVC: UITableViewDelegate,
                        UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.registerList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let dict = viewModel.registerList[indexPath.section]
        listCell.configure(dict)
        listCell.selectionStyle = .none
        return listCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let view = HeaderView.instantiateFromNib() {
                view.registerBtnClicked = { [weak self] in
                    self?.btnRegisterClicked()
                }
                return view
            }
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 530
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == viewModel.registerList.count - 1 {
            if let view = FooterView.instantiateFromNib() {
                return view
            }
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == viewModel.registerList.count - 1 {
            return 380
        }
        return 0
    }
}
