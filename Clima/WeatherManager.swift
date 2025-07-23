

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a30f7789c8f1ef6bc3c875987dd8763a&units=metric"
    
    func fetchWeather (cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
       performRequest(urlString: urlString)
    }
    
    func performRequest (urlString:String) {
        // 1- create a URL
        
        if let url = URL(string: urlString){
            // 2- create a urlSession
            
            let session = URLSession(configuration: .default)
            // 3- give the session a task
            
            let task = session.dataTask(with: url, completionHandler:handle(data:response:error:))
            // 4- start task
            task.resume()
        }
    }
        func handle (data:Data?, response:URLResponse?, error:Error?){
            if error != nil {
                print(error!)
                return
            }
        }
    }

