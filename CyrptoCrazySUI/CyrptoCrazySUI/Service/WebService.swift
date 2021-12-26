//
//  WebService.swift
//  CyrptoCrazySUI
//
//  Created by Doğanay Şahin on 3.10.2021.
//

import Foundation

class Webservice{
    
    func downloadCurrenciessAsync(url : URL) async throws -> [CryptoCurrenct]{
       let (data, _) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([CryptoCurrenct].self, from: data)
        
        return currencies ?? []
    }
    
    func downloadCurrencies(url : URL, completion : @escaping(Result<[CryptoCurrenct]?, DownloadErrors>) -> Void) {
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let currencies =  try? JSONDecoder().decode([CryptoCurrenct].self, from: data) else{
                return completion(.failure(.parseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
    
    

}
enum DownloadErrors : Error{
    case badUrl
    case noData
    case parseError
}
