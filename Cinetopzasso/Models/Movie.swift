//
//  Movie.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 06/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let titulo: String
    let ano: String
    let censura: String
    let trilha: [Int]
    let duracao: String
    let genero: String
    let diretor: String
    let elenco: String
    let sinopse: String
    let imagem: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id  = try container.decode(Int.self, forKey: .id)
        self.titulo = try container.decode(String.self, forKey: .titulo)
        self.ano = try container.decode(String.self, forKey: .ano)
        self.censura = try container.decode(String.self, forKey: .censura)
        self.trilha = try container.decode([Int].self, forKey: .trilha)
        self.duracao = try container.decode(String.self, forKey: .duracao)
        
        if let genero = try? container.decode(String.self, forKey: .genero) {
            self.genero = genero
        } else {
            self.genero = try container.decode([String].self, forKey: .genero).joined(separator: ", ")
        }
        
        
        self.diretor = try container.decode(String.self, forKey: .diretor)
        self.elenco = try container.decode(String.self, forKey: .elenco)
        self.sinopse = try container.decode(String.self, forKey: .sinopse)
        self.imagem = try container.decode(String.self, forKey: .imagem)
    }
    
    private enum CodingKeys: CodingKey {
        case id
        case titulo
        case ano
        case censura
        case trilha
        case duracao
        case genero
        case diretor
        case elenco
        case sinopse
        case imagem
    }
}
