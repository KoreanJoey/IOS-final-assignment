//
//  URLImageView.swift
//  Application
//
//  Created by 조성하 on 16/5/2024.
//


import SwiftUI

struct URLImageView: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    @State private var imageData: Data?

    var body: some View {
        Group {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)  // Changed to `.fill` to better fit specified dimensions
                    .frame(width: width, height: height)
                    .clipped()  // This will clip the image to the frame boundaries
            } else {
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
        .onAppear {
            fetchImageData()
        }
    }

    private func fetchImageData() {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
        }.resume()
    }
}



#Preview {
    URLImageView(urlString: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fphotos%2Ffood&psig=AOvVaw2NBgbyTqJ5zzAUPqSxC8xm&ust=1715931388048000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCezdjUkYYDFQAAAAAdAAAAABBM", width: 100, height: 100)
}
