//
//  ViewController.swift
//  Weather
//
//  Created by s ky on 2023/01/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInfomation: WeatherInfomation) {
        self.cityNameLabel.text = weatherInfomation.name
        if let weather = weatherInfomation.weather.first {
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInfomation.temp.temp - 273.15)) 도"
        self.lowTempLabel.text = "최저 \(Int(weatherInfomation.temp.temp_min - 273.15)) 도"
        self.highTempLabel.text = "최고 \(Int(weatherInfomation.temp.temp_max - 273.15)) 도"
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=37.5666791&lon=126.9782914&appid=bce8af9c66c8c1d12a7d3d2cd866f84e") else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data,response,error in
            let successRange = (200..<300)
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let data = data, error == nil else { return }
                let decoder = JSONDecoder()
                guard let weatherInfoMation = try? decoder.decode(WeatherInfomation.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInfomation: weatherInfoMation)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                
            }
        }
    }.resume()
}


