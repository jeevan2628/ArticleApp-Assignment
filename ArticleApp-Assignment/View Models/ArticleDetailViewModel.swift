//
//  ArticleDetailViewModel.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

// ViewModels/ArticleDetailViewModel.swift
final class ArticleDetailViewModel: ObservableObject {
  @Published var article: Article?
  @Published var isLoading = false
  @Published var error: Error?

  private let articleId: String
  
  /// Initialisation
  /// - Parameter articleId: Initialisation of article ID for which detail requested
  init(articleId: String) {
    self.articleId = articleId
  }

  func fetchArticleDetails() {
    isLoading = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  [weak self] in
      self?.isLoading = false
      self?.article = self?.getArticleDetailModel()?.data
    }
  }

  func getArticleDetailModel() -> ArticleDetailResponse? {
    let jsonDecoder = JSONDecoder()
    let jsonData = MockJsonProvider.getJsonData(fileName: "article")
    do {
      let model = try jsonDecoder.decode(ArticleDetailResponse.self, from: jsonData)
      return model
    } catch {
      print("Error decoding JSON: \(error)")
      return nil
    }
  }

}
