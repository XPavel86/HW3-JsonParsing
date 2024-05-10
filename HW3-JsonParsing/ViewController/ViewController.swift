//
//  ViewController.swift
//  HW3-JsonParsing
//
//  Created by Pavel Dolgopolov on 10.05.2024.
//

import UIKit

final class ViewController: UIViewController {

    private let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&APPID=4f7dd0216b1e869d2a717e512544f020")!
    
    @IBAction func buttonPressed() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No Error description")
                return
            }
            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                print(weatherData)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

