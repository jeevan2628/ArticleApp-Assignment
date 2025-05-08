//
//  HomePageView.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

/*
 Can you create SwiftUI view called homePageView that will load list of Articles using HomePageModel. Each article should have Title, Image, Tag, with short description. Make sure you follow MVVM architecture.
 */

import Foundation
import SwiftUI

struct HomeView: View {

  @StateObject private var viewModel = ArticleViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        if viewModel.isLoading {
          ProgressView()
        } else if let error = viewModel.error {
          ErrorView(error: error, retryAction: {
            viewModel.fetchHomePageArticles()
            viewModel.fetchCategories()
          })
        } else {
          List {
            ForEach(viewModel.filteredArticles) { article in
              NavigationLink(destination: ArticleDetailPageView(articleId: article.id)) {
                ArticleRow(article: article)
              }
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Articles")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          categoryFilterMenu
        }
      }
      .onAppear {
        viewModel.fetchHomePageArticles()
        viewModel.fetchCategories()
      }
    }
  }

  private var categoryFilterMenu: some View {
    Menu {
      Button("All Categories") {
        viewModel.selectedCategory = nil
      }

      ForEach(viewModel.categories) { category in
        Button(category.name) {
          viewModel.selectedCategory = category.id
        }
      }
    } label: {
      Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
    }
  }
}

