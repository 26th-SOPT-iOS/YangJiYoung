//
//  LoginService.swift
//  iOS_Week1_Exercise_Login
//
//  Created by 양지영 on 2020/05/16.
//  Copyright © 2020 양지영. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService() // shared:전역으로 사용가능, static let어디서든 접근 가능
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["id": id, "password":pwd]
    }
    func login(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"] //httpheaders는 alanmofire 레퍼런스
        // 요청에해당하는 객체 생성
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
        //데이터 통신시작
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                // statuscode를 헤더에 넣을경우 분기처리 적게해서 더 좋음(?), 지금은 쪼개면서 2번 분기처리
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data) //데이터를 넣어서 판단 시작
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    // 디코딩해줄 객체
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SigininData.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        return .success(tokenData.jwt)
    }
}
