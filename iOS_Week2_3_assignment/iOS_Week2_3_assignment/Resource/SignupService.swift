//
//  SignupService.swift
//  
//
//  Created by 양지영 on 2020/05/16.
//

import Foundation
import Alamofire

struct SignupService {
    static let shared = SignupService() // shared:전역으로 사용가능, static let어디서든 접근 가능
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters {
        return ["id": id, "password":pwd, "name":name, "email":email, "phone":phone]
    }
    func signup(id: String, pwd: String, name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"] //httpheaders는 alanmofire 레퍼런스
        // 요청에해당하는 객체 생성
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd, name, email, phone), encoding: JSONEncoding.default, headers: header)
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
        case 200: return isSignUp(by: data) //데이터를 넣어서 판단 시작
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    // 디코딩해줄 객체
    private func isSignUp(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data) else { return .pathErr }
        if decodedData.success {return .success(data)}
        else {return .requestErr(decodedData.message)}
    }
}

