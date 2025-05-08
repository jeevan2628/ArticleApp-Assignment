//
//  ArticleModel.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

/*
  create model class ArticleModel for the json file article.json in folder Mock Json
 */

// MARK: - ArticleModel
// Models/Article.swift
struct ArticleDetailResponse: Codable {
  let status: Int
  let message: String
  let data: Article

  enum CodingKeys: String, CodingKey {
    case status, message, data
  }
}

struct Article: Codable {
  let id: String
  let published: String
  let author: Author
  let category: Category
  let tags: [String]
  let title: String
  let subtitle: String?
  let hero: String
  let description: String
  
  enum CodingKeys: String, CodingKey {
    case id = "articleId"
    case published, author, category, tags, title
    case subtitle = "Subtitle"
    case hero, description
  }
}

struct Author: Codable {
  let id: String
  let image: String
  let name: String

  enum CodingKeys: String, CodingKey {
    case id = "authorId"
    case image = "authorImage"
    case name = "authorName"
  }
}
