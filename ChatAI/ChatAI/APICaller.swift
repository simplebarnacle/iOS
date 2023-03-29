//
//  APICaller.swift
//  ChatAI
//
//  Created by jayden on 2023/03/29.
//

import Foundation
import OpenAISwift

final class APICaller {
    static let shared = APICaller()
    
    @frozen enum Constants {
        static let key = "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"
    }
    
    private var client: OpenAISwift?
    
    private init() {}
    
    public func setup() {
        self.client = OpenAISwift(authToken: Constants.key)
    }
    
    public func getResponse(input: String, completion: @escaping (Result<String, Error>) -> Void ) {
        client?.sendCompletion(with: input
                               , model: .codex(.cushman)
                               ,completionHandler: { result in
            switch result {
            case .success(let model):
                print(String(describing: model.choices))
                let output = model.choices.first?.text ?? ""
                completion(.success(output))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
