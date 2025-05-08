//
//  HomePageModel.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

/*
 Similar to ArticleModel, create a model class HomePageModel for the json file homepage.json in folder Mock Json
 */

// MARK: - HomePageModel
// Models/HomeArticle.swift (for the home page listing)
struct HomePageResponse: Codable {
  let status: Int
  let message: String
  let data: HomePageData

  enum CodingKeys: String, CodingKey {
    case status, message, data
  }
}

struct HomePageData: Codable {
  let page: Int
  let categoryId: String?
  let tag: String
  let authorName: String
  let articles: [HomeArticle]

  enum CodingKeys: String, CodingKey {
    case page, categoryId, tag, authorName, articles
  }
}

struct HomeArticle: Codable, Identifiable {
  let id: String
  let title: String
  let hero: String
  let categoryId: String
  let authorId: String
  let articleType: Int
  let tags: [String]

  enum CodingKeys: String, CodingKey {
    case id = "articleId"
    case title, hero, categoryId, authorId, articleType, tags
  }
}
