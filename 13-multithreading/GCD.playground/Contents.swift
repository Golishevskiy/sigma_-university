import UIKit
// 1. Створити масив для зберігання emoji.
var emojiArray = [String]()
var group = DispatchGroup()

// 2. Створити асинхронну кастомну чергу.
let customQueue = DispatchQueue.init(label: "customQueue", qos: .userInteractive)

var task125: DispatchWorkItem?
task125 = DispatchWorkItem(qos: .userInteractive) {
    group.enter()
    for i in 1...125 {
        guard let task = task125,
              !task.isCancelled
        else {
            print("Cancelled")
            break
        }
        // 8. При додаванні кожного 15 emoji зупинити весь процес на 3 секунди
        if emojiArray.count % 15 == 0 && emojiArray.count != 0 {
            sleep(1)
            print("wait 3 seconds")
        }
        emojiArray.append("😃")
        // 6. Трекати прогрес додавання emoji (виводити в лог)
        print("😃 - \(i)")
    }
}

task125?.notify(queue: .main) {
    print("Done")
}

// 3. Додати через асинхронну чергу 125 emoji, по завершенню процесу
//вивести повідомлення
customQueue.async(execute: task125!)

// 5. Додати можливість відміни поточних задач
DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
    task125!.cancel()
}

// 7. Зчитати та вивести всі смайлики використавши ітерацію від 0 до 125
task125?.notify(queue: .main, execute: {
    for i in 0..<emojiArray.count {
        print(emojiArray[i])
    }
})

// 9. Створити ще одну асинхронну чергу з меншим пріоритетом і
// запустити додавання 25 emoji з неї в той самий масив
let customQueue25 = DispatchQueue.init(label: "customQueue25", qos: .background)


var task25: DispatchWorkItem?
task25 = DispatchWorkItem(qos: .background) {
    for i in 1...25 {
        guard let task = task25,
              !task.isCancelled
        else {
            print("Cancelled")
            break
        }
        emojiArray.append("🎃")
        print("🎃 - \(i)")
    }
}

customQueue25.async(execute: task25!)













