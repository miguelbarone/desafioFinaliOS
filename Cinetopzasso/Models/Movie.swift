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
    let trilha: Array<Int>
    let duracao: String
    let genero: String
    let diretor: String
    let elenco: String
    let sinopse: String
    let imagem: String
}
