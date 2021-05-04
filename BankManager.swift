//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private var customers: [Customer] = []
    
    func openBank() {
        let bankOpenMenuState: Bool = bankOpenMenu()
        
        if bankOpenMenuState {
            customers = visitCustomers()
            bankWorkProgress()
            openBank()
        }
    }
    
    private func bankOpenMenu() -> Bool {
        
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator : "")
            
            guard let inputNumber = readLine() else {
                return false
            }
            
            if inputNumber == "1" {
                return true
            } else if inputNumber == "2" {
                return false
            } else {
                print("잘못된 입력입니다, 다시 입력해주세요.")
            }
        }
    }
   
    private func bankWorkProgress() {
        let totalCustomersCount: Int = self.customers.count
        var remainingCustomerCount: Int = totalCustomersCount
        
        while remainingCustomerCount > 0 {
            remainingCustomerCount = self.customers.count
        
            if remainingCustomerCount == 0 {
                finishBank(totalCustomerCount: totalCustomersCount)
                break
            } else {
                let customer: Int = matchBankerAndCustomer()
                bankerWorkProgress(customerNumber: customer)
            }
        }
    }
    
    private func bankerWorkProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }

    private func finishBank(totalCustomerCount: Int) {
        var workTime = Double(totalCustomerCount) * 0.7
        workTime = round(workTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무 시간은 \(workTime)초 입니다.")
    }
    
    private func visitCustomers() -> [Customer] {
        var result: [Customer] = []
        let waitNumbers: [Int] = Array(1...Int.random(in: 10...30))

        for number in waitNumbers {
            let customer: Customer = Customer(waitNumber: number)
            result.append(customer)
        }

        return result
    }
    
    private func matchBankerAndCustomer() -> Int {
        let customer: Customer = self.customers.removeFirst()
        
        return customer.waitNumber
    }
    
}
