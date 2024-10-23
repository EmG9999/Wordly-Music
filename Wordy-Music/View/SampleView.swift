//
//  SampleView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 22/10/2024.
//

import SwiftUI

struct SampleView: View {
    @StateObject private var viewModel = DescriptionViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.description) { desc in
                NavigationLink(destination: DescriptionView(description: desc)) {
                    HStack {
                        AsyncImage(url: URL(string: desc.image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 60)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 60)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(desc.titre)
                                .font(.headline)
                        }
                        .padding(.leading, 8)
                    }
                }
            }
            .navigationTitle("Samples")
            .onAppear {
                viewModel.fetchSample()
            }
        }
    }
}
#Preview {
    SampleView()
}
