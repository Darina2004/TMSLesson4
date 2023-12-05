//
//  ViewController.swift
//  TMSLesson4
//
//  Created by Mac on 29.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sum = operation(a: 4, b: 8)
        print("Сумма: \(sum)")
        
        let substruct = operation(c: 9, d: 6)
        print("Вычитание: \(substruct)")
        
        let multiplay = operation (k: 5, l: 4)
        print("Умножение: \(multiplay)")
        
        let divide = operation(m: 10, n: 5)
        print("Деление: \(divide)")
        
        let digitSum = digitSum(n: 1234)
        print("Сумма цифр четырехзначного числа: \(digitSum)")
        
        let string = stringComparison(str1: "ввш", str2: "авб")
        print(string)
        
        var result = 1
        var number = exponentiation(number: 5)
        
        
        // 1. Универсальные функции сложения, вычитания, умножения и
        //деления (перегрузка функций)
        
        func operation(a: Int, b: Int) -> Int {
            return a + b
        }
        
        func operation(c: Int, d: Int) -> Int {
            return c - d
        }
        
        func operation(k: Int, l: Int) -> Int {
            return k * l
        }
        
        func operation(m: Int, n: Int) -> Int {
            return m / n
        }
        
        
        // 2. Вычислить сумму цифр четырехзначного числа
        
        func digitSum(n : Int) -> Int {
            var sum = 0
            var num = n
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            return sum
        }
        
        
        // 3. Функция сравнения строк - "ввш" больше "авб"
        
        func stringComparison(str1: String, str2: String) -> String {
            if str1 > str2 {
                return ("\(str1) больше, чем \(str2)")
            } else {
                return ("\(str2) больше, чем \(str1)")
            }
            
        }
        
        
        // 5. Функция возведения в степень с дефолтным параметром
        
        func exponentiation(number: Int, exponent: Int = 3) -> Int {
            for _ in 1...exponent {
                result *= number
            }
            print("\(number) в степени \(exponent) = \(result)")
            return result
            
        }
        
        
        // 4. Циклический вызов функций - поломать приложение
        
                func infiniteRecursion() {
                    infiniteRecursion()
                }
        
                infiniteRecursion()
        
        
        // Универсальные функции сложения, вычитания, умножения и деления через замыкание
        
        let sum2 = {(a: Int, b: Int)-> Int in
            return a + b
        }
        print("Сумма: \(sum2(8, 4))")
        
        let substruct2 = {(a: Int, b: Int)-> Int in
            return a - b
        }
        print("Вычитание: \(substruct2(8, 4))")
        
        let multiplay2 = {(a: Int, b: Int)-> Int in
            return a * b
        }
        print("Умножение: \(multiplay2(8, 4))")
        
        let divide2 = {(a: Int, b: Int)-> Int in
            return a / b
        }
        print("Деление: \(divide2(8, 4))")
        
        
        // Замыкание внутри которой при вызове происходит увеличение счётчика на +1
        
        func counter() -> ()-> Int {
            var count = 0
            return {
                count += 1
                return count
            }
        }
        
        let increase = counter()
        print(increase())
        print(increase())
        print(increase())
        print(increase())
        
        // Замыкание в котором ты проверяешь полил ли ты цветок, если нет то напоминание полить цветок
        func checkFlowerWatering(isWatered: Bool) -> () -> Void {
            return {
                if !isWatered {
                    print("Не забудьте полить цветок")
                }
            }
        }
        var isWatered = false
        let flowerReminder = checkFlowerWatering(isWatered: isWatered)
        isWatered = true
        flowerReminder()
        
        
        // Выполнить любое замыкание внутри замыкания по очереди
        
        func closureWithinClosure(closure1: () -> Void, closure2: () -> Void){
            closure1()
            closure2()
        }
        
        let closure1 = {
            print("Первое замыкание")}
        let closure2 = {
            closureWithinClosure(closure1: {
                print("Вложенное замыкание 1")
            }, closure2: {
                print("Вложенное замыкание 2")
            })
        }
        
        closureWithinClosure(closure1: closure1, closure2: closure2)
        
        
        // замыкание внутри любой функции
        
        func closureInsideFunction(closure: () -> Void) {
            print("Выполнение функции")
            closure()
        }
        let closure = {
            print("Выполнение замыкания")
        }
        closureInsideFunction(closure: closure)
    }
}

