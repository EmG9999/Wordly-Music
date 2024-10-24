//
//  SampleView.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 22/10/2024.
//

import SwiftUI

struct SampleView: View {
    @StateObject private var viewModel = DescriptionViewModel()
    @State private var showingSheet = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(red: 0.0/255.0, green: 77.0/255.0, blue: 99.0/255.0), location: 0.45),
                    .init(color: Color(red: 4.0/255.0, green: 156.0/255.0, blue: 204.0/255.0), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
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
                .scrollContentBackground(.hidden)
                .navigationTitle("")
                .onAppear {
                    viewModel.fetchSample()
                        
                }
            }
        }
    }
}
#Preview {
    SampleView()
}
