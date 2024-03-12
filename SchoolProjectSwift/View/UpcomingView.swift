//
//  UpcomingView.swift
//  Netflixless
//
//  Created by Augustin Diabira on 11/02/2024.
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject private var viewModel: TMDBViewModel
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        VStack {
            Divider()

            ScrollView {
                HStack {
                    Text("Upcoming")
                        .bold()
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                if sizeClass == .regular {
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 20), count: 3), spacing: 20) {
                        ForEach(viewModel.upcoming) { upcoming in
                            UpcomingRow(tmdb: upcoming)
                        }
                    }
                } else {
                    ForEach(viewModel.upcoming) { upcoming in
                        UpcomingRow(tmdb: upcoming)
                    }
                }
            }
            .task {
                viewModel.fetchTMDBData(tmdbUrl: .upcoming)
            }
            .navigationTitle("Upcoming")
            .scrollIndicators(.hidden)
        }
        .padding(.bottom)
    }
}
#Preview {
    UpcomingView()
}
