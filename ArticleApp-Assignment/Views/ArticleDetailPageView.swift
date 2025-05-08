//
//  ArticleDetailView.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import Foundation
import SwiftUI
import WebKit

struct ArticleDetailPageView: View {

  // MARK: - Properties
  @StateObject private var viewModel: ArticleDetailViewModel
  @State private var htmlDescription: String = ""
  // MARK: - Initializer
  init(articleId: String) {
    _viewModel = StateObject(wrappedValue: ArticleDetailViewModel(articleId: articleId))
  }

  /*
   Give me article detail page UI for the given Article model in SwiftUI.
   */
  // MARK: - Body
  var body: some View {
    ScrollView {

      AsyncImage(url: URL(string: viewModel.article?.hero ?? "")) { phase in
        if let image = phase.image {
          image
            .resizable()
            .scaledToFit()
        } else if phase.error != nil {
          Color.gray
        } else {
          ProgressView()
        }
      }
      .frame(maxHeight: 280)
      .background(Color.gray.opacity(0.2))
      .clipped()

      VStack(alignment: .leading, spacing: 16) {

        Text(viewModel.article?.title ?? "")
          .font(.title)
          .fontWeight(.bold)
          .padding(.horizontal)

        Text(viewModel.article?.subtitle ?? "")
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.horizontal)

        HStack {
          if let image = viewModel.article?.author.image, !image.isEmpty {
            AsyncImage(url: URL(string: image)) { phase in
              if let image = phase.image {
                image
                  .resizable()
                  .scaledToFit()
              } else if phase.error != nil {
                Color.gray
              } else {
                ProgressView()
              }
            }
            .frame(width: 50, height: 50)
            .background(Color.gray.opacity(0.2))
            .clipped()
          }

          VStack(alignment: .leading) {
            Text(viewModel.article?.author.name ?? "")
              .font(.headline)

            Text(viewModel.article?.published ?? "")
              .font(.subheadline)
              .foregroundColor(.gray)
          }

          Spacer()
        }

        if let categoryName = viewModel.article?.category.name {
          Text(categoryName)
            .font(.subheadline)
            .padding(.horizontal)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(8)
        }

        Spacer()

        // Render the text view for viewModel.article?.description which has HTML content.
        Text(htmlDescription)

      } // VStack ends
      .padding(.horizontal)


    } // ScrollView ends
    .navigationTitle("Article Detail")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(false)
    .onReceive(viewModel.$article) { article in
      htmlDescription = article?.description.htmlToPlainText() ?? ""
    }
    .onAppear {
      viewModel.fetchArticleDetails()
    }
  }

}

#Preview {
  ArticleDetailPageView(articleId: "1")
    .environmentObject(ArticleDetailViewModel(articleId: "1"))
}
