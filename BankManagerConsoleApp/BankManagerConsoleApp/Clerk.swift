//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by uemu on 2023/11/15.
//

import Foundation

struct Clerk {
    func work(customer: Customer) {
        let number = customer.order
        
        print("\(number)번 고객 업무 시작")
        //sleep(UInt32(0.7))
        //usleep(useconds_t(700000))
        Thread.sleep(forTimeInterval: 0.7)
        print("\(number)번 고객 업무 완료")
    }
}
