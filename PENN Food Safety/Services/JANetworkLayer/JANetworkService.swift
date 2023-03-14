//
//  JANetworkService.swift
//  JASafeDemoV
//
//  Created by Jitendra Agarwal on 20/01/23.
//

import Foundation


private let BaseURL = "pcfsgateway-dev.azurewebsites.net"
/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]
class JANetworkService {
    
    static let share = JANetworkService()
    private init() {}
    
    // MARK: - GET Api
     func getData<T:Decodable>(from endpoint: ApiEndpoints, parameters: Parameters? = nil, resultType: T.Type, completionHandler:@escaping(Result<T?, NetworkError>)-> Void){
         var request =  createRequest(from: endpoint)
         request.httpMethod =  RequestMethod.get.rawValue
         self.performOperation(requestUrl: request, responseType: T.self) { (requestData) in
             completionHandler(requestData)
         }
    }
    func getData<T:Decodable>(from endpoint: ApiEndpoints, parameters: Parameters? = nil, resultType: T.Type ) async throws -> Result<T, NetworkError>  {
        var request = await createRequest(from: endpoint)
        if let params = parameters {
            request.httpBody =  try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        //  let jsonObject =  try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
        }
        
        request.httpMethod = RequestMethod.get.rawValue
        return try await self.performOperation(requestUrl: request, responseType: T.self)
             
    }
    func sendData<T: Decodable, E: Encodable>(from endpoint: ApiEndpoints, with body: E,resultType: T.Type,completionHandler:@escaping(Result<T?, NetworkError>)-> Void) {
        
    }
    
}

private extension JANetworkService {
    
    func createRequest(from endpoint: ApiEndpoints) -> URLRequest {
        let urlPath = URL(string:  BaseURL.appending(endpoint.endPoint))
        var request = URLRequest(url: urlPath!)
        if let authToken = OBJ_FOR_KEY(FSConstants.UserDefault.accessToken){
            request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func createRequest(from endpoint: ApiEndpoints) async -> URLRequest {
        let urlPath = URL(string:  BaseURL.appending(endpoint.endPoint))
        var request = URLRequest(url: urlPath!)
        if let authToken = OBJ_FOR_KEY(FSConstants.UserDefault.accessToken){
            request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
// MARK: - Perform data task

private extension JANetworkService {
    private func performOperation<T: Decodable>(requestUrl: URLRequest, responseType: T.Type, completionHandler:@escaping(Result<T?, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (data, httpUrlResponse, error) in

            let statusCode = (httpUrlResponse as? HTTPURLResponse)?.statusCode
            if(error == nil && data != nil && data?.count != 0) {
                let response = try? JSONDecoder().decode(responseType, from: data!)
                if(response != nil) {
                    completionHandler(.success(response))
                }else {
                    completionHandler(.failure(NetworkError(withServerResponse: data, forRequestUrl: requestUrl.url!, withHttpBody: requestUrl.httpBody, errorMessage: error.debugDescription, forStatusCode: statusCode!)))
                }
            }
            else {
                let networkError = NetworkError(withServerResponse: data, forRequestUrl: requestUrl.url!, withHttpBody: requestUrl.httpBody, errorMessage: error.debugDescription, forStatusCode: statusCode!)
                completionHandler(.failure(networkError))
            }

        }.resume()
    
    }
    
    private func performOperation<T: Decodable>(requestUrl: URLRequest, responseType: T.Type) async throws -> Result<T, NetworkError>  {
        let (data, response) = try await URLSession.shared.data(for: requestUrl)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            //  fatalError("Error while fetching data")
            let networkError = NetworkError(withServerResponse: data, forRequestUrl: requestUrl.url!, withHttpBody: requestUrl.httpBody, errorMessage:" error.debugDescription", forStatusCode: (response as? HTTPURLResponse)!.statusCode)
            return .failure(networkError)
            
        }
        let decodedFood = try JSONDecoder().decode(responseType.self, from: data)
        return .success(decodedFood)
    }
    
}
