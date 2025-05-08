//
//  ArticleViewModel.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

// MARK: - ViewModel
class ArticleViewModel: ObservableObject {
  @Published var articles: [HomeArticle] = []
  @Published var categories: [Category] = []
  @Published var selectedCategory: String?
  @Published var isLoading = false
  @Published var error: Error?

  func fetchHomePageArticles() {
    isLoading = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  [weak self] in
      self?.isLoading = false
      self?.articles = self?.getHomePageModel()?.data.articles ?? []
    }
  }

  func fetchCategories() {
    isLoading = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  [weak self] in
      self?.isLoading = false
      self?.categories = self?.getCategoriesModel()?.data.categories ?? []
    }
  }

  var filteredArticles: [HomeArticle] {
    guard let selectedCategory = selectedCategory else {
      return articles
    }
    return articles.filter { $0.categoryId == selectedCategory }
  }

  // Mock responses for Home and Categories
  func getHomePageModel() -> HomePageResponse? {
    let jsonDecoder = JSONDecoder()
    let jsonData = MockJsonProvider.getJsonData(fileName: "homePage")
    do {
      let homePageModel = try jsonDecoder.decode(HomePageResponse.self, from: jsonData)
      return homePageModel
    } catch {
      print("Error decoding JSON: \(error)")
      return nil
    }
  }

  func getCategoriesModel() -> CategoriesResponse? {
    let jsonDecoder = JSONDecoder()
    let jsonData = MockJsonProvider.getJsonData(fileName: "categories")
    do {
      let homePageModel = try jsonDecoder.decode(CategoriesResponse.self, from: jsonData)
      return homePageModel
    } catch {
      print("Error decoding JSON: \(error)")
      return nil
    }
  }

}


