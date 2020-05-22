//
//  NetworkResult.swift
//  iOS_Week1_Exercise_Login
//
//  Created by 양지영 on 2020/05/16.
//  Copyright © 2020 양지영. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
