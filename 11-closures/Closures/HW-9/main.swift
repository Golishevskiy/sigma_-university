//
//  main.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

var alexey = Fisherman(name: "Alexey",
                       lastName: "Maslakov",
                       salary: 3000,
                       dateOfBirth: UserDate(year: 1991, month: 1, day: 21),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .fisherman,
                       married: true,
                       higherEducation: true,
                       experience: 0)

var alexey1 = Fisherman(name: "",
                       lastName: "Maslakov",
                       salary: 3000,
                       dateOfBirth: UserDate(year: 1991, month: 1, day: 21),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .fisherman,
                       married: true,
                       higherEducation: true,
                       experience: 0)

var maksim = Driver(name: "Maksim",
                       lastName: "Petrov",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .driver,
                       married: true,
                       higherEducation: true, experience: 6)

var taras = Teacher(name: "Taras",
                       lastName: "Fil",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .teacher,
                       married: true,
                       higherEducation: true, experience: 0)

var artur = Seller(name: "Artur",
                       lastName: "Semenov",
                       salary: 2200,
                       dateOfBirth: UserDate(year: 2000, month: 10, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .seller,
                       married: true,
                       higherEducation: true,
                       experience: 1)

var stas = Seller(name: "Stat",
                       lastName: "Nikitenko",
                       salary: 1800,
                       dateOfBirth: UserDate(year: 1994, month: 18, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .seller,
                       married: false,
                       higherEducation: true,
                       experience: 0)

var oleg = Seller(name: "Oleg",
                  lastName: "Stepanov",
                  salary: 2800,
                  dateOfBirth: UserDate(year: 1994, month: 7, day: 21),
                  inWorkDate: UserDate(year: 2021, month: 10, day: 11),
                  type: .seller,
                  married: true,
                  higherEducation: true,
                  experience: 5)


var directorJames = Director(name: "James")

func constructArray(workers: [Worker?]) -> [Worker] {
    var array = [Worker]()
    workers.forEach { (worker) in
        if let worker = worker {
            array.append(worker)
        }
    }
    return array
}

var arrayWorker = constructArray(workers: [alexey, maksim, taras])

let someFactory = Factory(workers: arrayWorker, director: directorJames)
someFactory.fireWorker(worker: maksim)

someFactory.changeSalary(from: alexey, newSalary: 7000)
someFactory.addWorker(worker: artur)
someFactory.addWorker(worker: oleg)


print("--------------CLOSURE------------")
/*
 1. Описати функцію у підприємстві яка буде знаходити робітників
 обраного типу (вчитель, водій, і тд) та повертати іх через замкнення.
 Якщо робітники знайдені – викликати у усіх одну функцію (на вибір:
 привітатися, їсти, тд).
 */
someFactory.search(workerType: .fisherman) { (worker) -> Void in
    worker.sayHello()
}

/*
 2. Визначити функцію, яка знаходить одного робітника (залежить від
 вхідного критерію функції, не схожий з 1-м завданням) та повертає
 його через замкнення. Якщо робітник знайден, то вивести на екран
 його ім’я та прізвище, якщо ні – вивести на екран відповідний запис.
 */
someFactory.search(for: "Alexey") { (worker) in
    if let worker = worker {
        print("Search result - " + worker.firstName + " " +  worker.lastName)
    } else {
        print("worker not found")
    }
}

someFactory.search(for: "Ahmed") { (worker) in
    if let worker = worker {
        print("Search result - " + worker.firstName + " " +  worker.lastName)
    } else {
        print("worker not found")
    }
}

/*
 3. Реалізувати делегування задач від директора робітникам
 використовуючи замкнення, а не протоколи
 */

directorJames.getFish {
    alexey?.catchAFish()
}

directorJames.trainStaff {
    taras?.toTeach()
}

directorJames.toDeliver {
    maksim?.toDeliver()
}

directorJames.sell {
    artur?.sellSomething()
    stas?.sellSomething()
}

