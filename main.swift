//
//  main.swift
//  VideoSearch
//
//  Created by Student on 05.12.2024.
//

import Foundation

struct Video{
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video]{
    return [
        Video(title: " Swift - Getting Started ", views: 160000, url: "https://www.youtube.com/watch?v=bjPENR6sHRU&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=1"),

              Video(title: " Swift - Variables & Constants ", views: 61000, url: "https://www.youtube.com/watch?v=xKf6iNilRYI&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index="),

                    Video(title: " Swift - Types ", views: 31000, url: "https://www.youtube.com/watch?v=48v8FH46mQs&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=3"),

                          Video(title: "Swift - Functions & Parameters ", views: 35000, url: "https://www.youtube.com/watch?v=fffG55Ei1Qc&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=4"),

                                Video(title: " Swift - Classes & Structs ", views: 27000, url: "https://www.youtube.com/watch?v=ys3dPSKssgk&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=5"),

                                      Video(title: " Swift - Loops ", views: 17000, url: "https://www.youtube.com/watch?v=8Z0mImrIITA&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=6"),

                                            Video(title: " Swift - Optionals & Unwrapping ", views: 24000, url: "https://www.youtube.com/watch?v=9K89xEuSiYA&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=7"),

                                                  Video(title: " Swift - If Else Conditionals ", views: 13000, url: "https://www.youtube.com/watch?v=rBotA3jwWkY&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=8"),

                                                        Video(title: " Swift - Guard Statements ", views: 21000, url: "https://www.youtube.com/watch?v=DTd7HHSAw-4&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=9"),

                                                              Video(title: "Swift - Enums & Switch Statements", views: 35000, url: "https://www.youtube.com/watch?v=_qxm-MvRw_Y&list=PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW&index=10")]
}

func sortVideosByViews(videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}

func printVideoDetails(video: Video) {
    print(" Деталі відео:")
    print(" Назва: \(video.title)")
    print(" Перегляди: \(video.views)")
    print(" URL: \(video.url)")
}


func printVideos(videos: [Video]){
    if videos.isEmpty{
        print("список відео порожній")
    }
    else{
        for(index, video) in videos.enumerated(){
            print("\(index + 1). Назва: \(video.title),  Перегляди: \(video.views)")
        }
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    return videos.filter { $0.title.lowercased().contains(title.lowercased()) }
}

func main(){
    let videos = generateSampleVideos()
    while true {
        print(" \nВітаємо! Оберіть дію:")
        print(" 1. Показати всі відео")
        print(" 2. Знайти відео за назвою")
        print(" 3. Сортувати відео за переглядами")
        print(" 4. Показати деталі відео")
        print(" 5. Вийти ")

    if let choice = readLine() {
        switch choice {
        case "1":
            print(" Список відео: ")
            printVideos(videos: videos)
        case "2":
            print(" Введіть назву для пошуку: ")
            if let searchTerm = readLine() {
                let results = searchVideos(by: searchTerm, in: videos)
                print(" Результати пошуку: ")
                printVideos(videos: results)
            }
        case "3":
            let sortedVideos = sortVideosByViews(videos: videos)
            print(" Відео, відсортовані за переглядами: ")
            printVideos(videos: sortedVideos)
        case "4":
            print(" Введіть номер відео для перегляду деталей: ")
            if let input = readLine(), let index = Int(input), index > 0, index <= videos.count {
                let selectedVideo = videos[index - 1]
                printVideoDetails(video: selectedVideo)
            } else {
                print(" Невірний номер відео. ")
            }
        case "5":
            print(" Вихід з програми. ")
            return
        default:
            print(" Невірний вибір. ")
        }
    }
}
}
main()
