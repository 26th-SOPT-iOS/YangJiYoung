//
//  SigninData.swift
//  
//
//  Created by 양지영 on 2020/05/16.
//

import Foundation

struct SiginData: Codable { //인코딩, 디코딩 모두 가능하도록
    // 앞에 key 값만 같으면 됨
    var status: Int
    var success: Bool
    var message: String
    var data: TokenData? // 실패했을 경우 nil 처리 해주기 위함
    
    enum CodingKeys: String, CodingKey { // 중요!!!
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
}

struct TokenData: Codable {
    var jwt: String
}
