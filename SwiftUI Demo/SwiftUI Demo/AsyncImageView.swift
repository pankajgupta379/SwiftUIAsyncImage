//
//  AsyncImageView.swift
//  SwiftUI Demo
//
//  Created by Pankaj Gupta on 03/06/23.
//

import Foundation
import SwiftUI

extension Image {
    func modifyImage() -> some View{
        self
            .resizable()
            .padding(8)
    }
    func modifyIcon() -> some View{
        self
            .modifyImage()
            .frame(maxWidth: 128,
                   maxHeight: 128,
                   alignment: .center)
            .foregroundColor(.purple)
            .opacity(0.4)
    }
}

struct AsyncImageView: View {
    var imageUrlStr: URL? = URL(string: "https://credo.academy/credo-academy@3x.png")
    
    var body: some View {
        
        // MARK: - Async Image
        
//        AsyncImage(url: URL(string: imageUrlStr))
        
        // MARK: - Async Image with scale
        
//        AsyncImage(url: imageUrlStr, scale: 3)
        
        // MARK: - Async Image With Placeholder
        
//        AsyncImage(url: imageUrlStr) { image in
//            image
//                .resizable()
//                .padding(8)
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .resizable()
//                .frame(maxWidth: 128,
//                       maxHeight: 128,
//                       alignment: .center)
//                .padding(8)
//                .foregroundColor(.purple)
//                .opacity(0.4)
//        }
        
        // MARK: - With Extension
        
//        AsyncImage(url: imageUrlStr) { image in
//            image.modifyImage()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").modifyIcon()
//        }
        
        // MARK: - With Phase
        
//        AsyncImage(url: imageUrlStr) { phase in
//            switch phase {
//            case .success(let image):
//                image.modifyImage()
//            case .failure(_):
//                Image(systemName: "ant.circle.fill").modifyIcon()
//            case .empty:
//                Image(systemName: "photo.circle.fill").modifyIcon()
//            @unknown default:
//                ProgressView()
//            }
//        }
        
        // MARK: - Animation
        
        AsyncImage(url: imageUrlStr, transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .modifyImage()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").modifyIcon()
            case .empty:
                Image(systemName: "photo.circle.fill").modifyIcon()
            @unknown default:
                ProgressView()
            }
        }
        
    }
}

struct AsyncImageView_Preview: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
