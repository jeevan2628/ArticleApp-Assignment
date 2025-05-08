//
//  ErrorView.swift
//  ArticleApp-Assignment
//
//  Created by Jeevan Rao on 08/05/25.
//

import SwiftUI

struct ErrorView: View {
  let error: Error
  let retryAction: () -> Void

  var body: some View {
    VStack {
      Text("An error occurred:")
        .font(.headline)
      Text(error.localizedDescription)
        .font(.subheadline)
        .multilineTextAlignment(.center)
        .padding()

      Button("Retry", action: retryAction)
        .buttonStyle(.borderedProminent)
    }
    .padding()
  }
}
