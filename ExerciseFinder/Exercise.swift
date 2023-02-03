//
//  Exercise.swift
//  ExerciseFinder
//
//  Created by James Penny on 03/02/2023.
//

import Foundation

struct Exercise: Codable, Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var muscle: String
    var equipment: String
    var difficulty: String
}

class Api : ObservableObject{
    @Published var exercises = [Exercise]()
    
//    func loadData(name: String, type: String, muscle: String, equipment: String, difficulty: String, completion:@escaping ([Exercise]) -> ()) {
//        let name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let type = type.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let muscle = muscle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let equipment = equipment.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let difficulty = difficulty.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?name="+name!+"&type="+type!+"&muscle="+muscle!+"&equipment="+equipment!+"&difficulty="+difficulty!)!
//        var request = URLRequest(url: url)
//        request.setValue("0Rzx34mN+oPvjXnJFFuB3Q==AnmYCust1NLLgnAU", forHTTPHeaderField: "X-Api-Key")
//        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
//            guard let data = data else { return }
//            print("Data is \(String(data: data, encoding: .utf8)!)")
//        }
//        task.resume()
//    }
    
    func loadData(name: String, type: String, muscle: String, equipment: String, difficulty: String, completion:@escaping ([Exercise]) -> ()) {
        let name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let type = type.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let muscle = muscle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let equipment = equipment.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let difficulty = difficulty.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?name="+name!+"&type="+type!+"&muscle="+muscle!+"&equipment="+equipment!+"&difficulty="+difficulty!)!
        var request = URLRequest(url: url)
        request.setValue("0Rzx34mN+oPvjXnJFFuB3Q==AnmYCust1NLLgnAU", forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let exercises = try! JSONDecoder().decode([Exercise].self, from: data!)
            print(exercises)
            DispatchQueue.main.async {
                completion(exercises)
            }
        }.resume()
    }
    
    
    
    
    
    
    
    
}
