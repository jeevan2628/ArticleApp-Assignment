//
//  CategoriesModel.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

/*
 Similar to ArticleModel, create a model class CategoriesModel for the json file categories.json in folder Mock Json
 */

// MARK: - CategoriesModel
// Models/CategoriesResponse.swift
struct CategoriesResponse: Codable {
  let status: Int
  let message: String
  let data: CategoriesData
}

struct CategoriesData: Codable {
  let categories: [Category]
}

struct Category: Codable, Identifiable {
  let id: String
  let name: String

  enum CodingKeys: String, CodingKey {
    case id = "categoryId"
    case name = "categoryName"
  }
}
