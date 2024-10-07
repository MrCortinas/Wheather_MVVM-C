//
//  NetworkRequest.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation

class NetworkRequest: NetworkProtocols {
    static var shared: NetworkProtocols = NetworkRequest()
    
    func getWeatherData(url:URL, success: @escaping (weatherData)->(), failure: @escaping (APIError)->()) {
        print("\n===================================Request==================================\n")
        print("URL: \(url.description)")
        print("\n===================================Request==================================\n")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("\n===================================Request==================================\n")
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("\n\nError, unexpected status code:\n☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️\n\(String(describing: dump(response)))\n☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️☠️")
                print("\n===================================Response==================================\n")
                failure(.apiError(reason: "❌ BAD ERROR CODE ❌"))
                return
            }
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers), let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                print("URL: \(url)")
                print("Status Code: \(httpResponse.statusCode)")
                print("Headers:")
                httpResponse.allHeaderFields.forEach { print("✅ \($0): \($1)") }
                print("Json response: 📝\n\(String(decoding: jsonData, as: UTF8.self))")
            } else {
                print("❌ json data malformed and/or it's not a json ❌")
            }
            if error != nil {
                print(error?.localizedDescription ?? "unkwon error")
                failure(.apiError(reason: error?.localizedDescription ?? "unkwon error"))
            }
            
            guard let data = data else {
                failure(.apiError(reason: "❌ missing data ❌"))
                print("\n===================================Request==================================\n")
                return
            }
            do {
                let UserData = try JSONDecoder().decode(weatherData.self, from: data)
                DispatchQueue.main.async { success(UserData) }
            } catch let jsonError {
                print(jsonError)
                failure(.apiError(reason: "❌ json data malformed and/or it's not a json ❌"))
            }
            print("\n===================================Request==================================\n")
            }.resume()
    }
}
