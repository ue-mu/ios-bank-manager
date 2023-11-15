//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by uemu on 2023/11/15.
//

struct Bank {
    private let customerQueue = CustomerQueue<Customer>()
    private let clerk = Clerk()
    private var isRunning: Bool = true
    private var officeHours: Double = 0.0
    
    mutating func start() {
        while isRunning {
            print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
            let input = readLine()
            
            switch input {
            case "1":
                officeHours = 0.0
                startTask()
            case "2":
                isRunning = false
            default:
                print("잘못 입력하셨습니다.")
            }
        }
    }
    
    mutating private func startTask() {
        let customerCount = Int.random(in: 10...30)
        
        setUpCustomerQueue(count: customerCount)
        
        while !customerQueue.isEmpty() {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            self.clerk.work(customer: customer)
            officeHours += 0.7
        }
        
        showTaskResult(customerCount: customerCount)
        start()
    }
    
    private func setUpCustomerQueue(count: Int) {
        for turn in 1...count {
            let customer = Customer(order: turn)
            customerQueue.enqueue(value: customer)
        }
    }
    
    private func showTaskResult(customerCount: Int) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(String(format: "%.2f", officeHours))초입니다.")
    }
}
