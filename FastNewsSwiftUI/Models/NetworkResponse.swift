//
//  NetworkResponse.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

enum NetworkResponse: String, Error {
    case success
    case authenticationError = "Você não possui acesso a esta funcionalidade ou precisa estar logado no sistema."
    case badRequest = "Falha na requisição."
    case outdated = "A Url requisitada não foi encontrada."
    case failed = "Requiição na rede falhou."
    case noData = "Resposta do servidor não teve resultados para conversão."
    case unableToDecode = "Não foi possivel converter a resposta da requisição."
}

public enum NetworkError : String, Error {
    case parametersNil = "Parâmetros estavam nulos."
    case encodingFailed = "Falha na conversão dos parâmetros."
    case missingURL = "URL estava nula."
    case resolvingFailed = "URL da API não foi resolvida."
}
