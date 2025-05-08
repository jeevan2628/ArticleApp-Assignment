//
//  MockJsonProvider.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

// MARK: - MockJsonProvider
struct MockJsonProvider {
  static func getJsonData(fileName: String) -> Data {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
      fatalError("Unable to find \(fileName).json")
    }

    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      fatalError("Unable to load \(fileName).json: \(error)")
    }
  }
}
