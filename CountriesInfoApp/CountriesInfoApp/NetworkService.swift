//import Foundation
//
//enum NetworkError: Error {
//    case decodeError
//    case wrongResponse
//    case wrongStatusCode(code: Int)
//}
//class NetworkService {
//    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T,Error>) ->(Void)) {
//        guard let url = URL(string: urlString) else {
//            completion(.failure(NetworkError.wrongResponse))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                completion(.failure(NetworkError.wrongResponse))
//                return
//            }
//
//            guard (200...299).contains(httpResponse.statusCode) else {
//                completion(.failure(NetworkError.wrongStatusCode(code: httpResponse.statusCode)))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NetworkError.decodeError))
//                return
//            }
//
//            do {
//                let decodedObject = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decodedObject))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
//
////class NetworkService {
////    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T,Error>) ->(Void)) {
////        let url = URL(string: urlString)!
////
////        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
////            
////            if let error {
////                print(error.localizedDescription)
////            }
////            
////            guard let response = response as? HTTPURLResponse else {
////                return
////            }
////            
////            guard (200...299).contains(response.statusCode) else {
////                print("დაფიქსირდა შეცდომა")
////                return
////            }
////            
////            guard let data = data else { return }
////
////            do {
////                let decoder = JSONDecoder()
////                let object = try decoder.decode(T.self, from: data)
////                
////                DispatchQueue.main.async {
////                    completion(.success(object))
////                }
////            } catch {
////                completion(.failure(NetworkError.decodeError))
////            }
////        }.resume()
////    }
////}
////class NetworkService {
////    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
////        guard let url = URL(string: urlString) else {
////            completion(.failure(NetworkError.wrongResponse))
////            return
////        }
////
////        URLSession.shared.dataTask(with: url) { data, response, error in
////            if let error = error {
////                completion(.failure(error))
////                return
////            }
////
////            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
////                completion(.failure(NetworkError.wrongStatusCode(code: (response as? HTTPURLResponse)?.statusCode ?? -1)))
////                return
////            }
////
////            guard let data = data else {
////                completion(.failure(NetworkError.decodeError))
////                return
////            }
////
////            do {
////                let decoder = JSONDecoder()
////                let object = try decoder.decode(T.self, from: data)
////                completion(.success(object))
////            } catch {
////                completion(.failure(error))
////            }
////        }.resume()
////    }
////}
import Foundation

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class NetworkService {
    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T,Error>) ->(Void)) {
        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("error")
                return
            }
            
            guard let data else { return }

            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}
