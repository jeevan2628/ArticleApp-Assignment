//
//  String+Extension.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation

extension String {
  // Convert HTML to NSAttributedString
  func toNSAttributedString() -> NSAttributedString? {
    let cleanedHTML = self
      .replacingOccurrences(of: "\n", with: "")
      .replacingOccurrences(of: "'", with: "&apos;")

    guard let data = cleanedHTML.data(using: .utf8) else { return nil }

    do {
      return try NSAttributedString(
        data: data,
        options: [
          .documentType: NSAttributedString.DocumentType.html,
          .characterEncoding: String.Encoding.utf8.rawValue
        ],
        documentAttributes: nil
      )
    } catch {
      print("HTML parsing error: \(error)")
      return nil
    }
  }

  // Fallback to plain text
  func htmlToPlainText() -> String {
    return toNSAttributedString()?.string ?? self
  }
}
