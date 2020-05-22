//
//  NetworkResult.swift
//  
//
//  Created by 양지영 on 2020/05/16.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
