//
//  RegisterVM.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import Foundation

class RegisterVM {
    
    private(set) var registerList = [RegisterDetail]()
    
    enum State {
        case getList
    }
    var viewState: ViewState<State> = .empty {
        didSet {
            DispatchQueue.main.async {
                self.onViewStateChange?(self.viewState)
            }
        }
    }
    var onViewStateChange: ((_ viewState: ViewState<State>) -> Void)?
    
    func getRegisterList() {
        viewState = .loading
        guard let  url = Bundle.main.url(forResource: "RegisterDetails", withExtension: "json")  else {
            viewState = .error("Something Went Wrong.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let dataResponse = try decoder.decode(ResponseList.self, from: data)
            self.registerList = dataResponse.list
            viewState = .ready(.getList)
        } catch {
            print("error:\(error)")
        }
    }
    
}


enum ViewState<T> {
    case empty
    case loading
    case ready(T)
    case error(String)

    var isLoading: Bool {
        switch self {
        case .loading : return true
        default: return false
        }
    }
}
