//
//  ArticleRow.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import SwiftUI

struct ArticleRow: View {
  let article: HomeArticle

  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      AsyncImage(url: URL(string: article.hero)) { phase in
        if let image = phase.image {
          image
            .resizable()
            .scaledToFill()
        } else if phase.error != nil {
          Color.gray
        } else {
          ProgressView()
        }
      }
      .frame(width: 80, height: 80)
      .cornerRadius(8)
      .clipped()

      VStack(alignment: .leading, spacing: 4) {
        Text(article.title)
          .font(.headline)
          .lineLimit(2)

        Text("Technology") // In a real app, we'd get the category name from the categoryId
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
    }
    .padding(.vertical, 8)
  }
}
