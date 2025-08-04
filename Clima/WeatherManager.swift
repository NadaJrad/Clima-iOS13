

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather (_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a30f7789c8f1ef6bc3c875987dd8763a&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
       performRequest(with: urlString)
    }
    
    func performRequest (with urlString:String) {
        // 1- create a URL
        
        if let url = URL(string: urlString){
            // 2- create a urlSession
            
            let session = URLSession(configuration: .default)
            // 3- give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJson(safeData){
                    
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4- start task
            task.resume()
        }
    }
    func parseJson (_ weatherData : Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
          let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
           return weather
        } catch {
            delegate?.didFailError(error: error)
            return nil
        }
        
    }
    
    
    

    }
    

