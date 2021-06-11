//
//  RegisterDetail.swift
//  DemoGit
//
//  Created by Pradeep Kumar on 11/06/21.
//

import Foundation


struct ResponseList: Decodable {
    let list: [RegisterDetail]
}


struct RegisterDetail: Decodable {
    let title: String
    let detail: String
    let imageName: String
}

