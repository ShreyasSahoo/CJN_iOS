//
//  SwiftUIView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 25/05/24.
//

import SwiftUI

struct UserDashView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    searchBar()
                    
                   
                    adBanner()
                    joinLiveShowButton()
                    sectionHeader(title: "Upcoming show trailers")
                    trailerScrollView()
                    sectionHeader(title: "Recommended videos")
                    recommendedVideosScrollView()
                }
                .padding()
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        
    }
    
    
    private func searchBar() -> some View {
        HStack {
            Button{
                
            } label : {
                Image(systemName: "qrcode.viewfinder")
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 10))
            }
           
            TextField("Search for jobs", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                )
        }
        .padding([.top,.horizontal],10)
    }
    
    private func adBanner() -> some View {
        VStack {
                    Image("jobsTV")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .overlay(
                            GeometryReader { geometry in
                                VStack{
                                    Text("Lorem Ipsum")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                    Button {
                                        // Button action
                                    } label: {
                                        Text("Know more")
                                            .padding(10)
                                            .frame(width: 150)
                                            .background(Color.accentColor)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                }
                                .position(x: geometry.size.width * 0.25, y: geometry.size.height * 0.6)
                            }
                        )
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.vertical)
    }
    
    private func joinLiveShowButton() -> some View {
        NavigationLink {
           LiveShowView()
        } label: {
            Text("Join live Show")
                .padding()
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
    
    private func sectionHeader(title: String) -> some View {
        Text(title)
            .font(.headline)
            .padding(.vertical)
    }
    
    private func trailerScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<3) { index in
                    videoThumbnail(imageName: "thumbnail\(index + 1)")
                }
            }
        }
    }
    
    private func recommendedVideosScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<3) { index in
                    videoThumbnail(imageName: "")
                }
            }
        }
    }
    
    private func videoThumbnail(imageName: String) -> some View {
        VStack {
            Image("jobsTV") // Replace with your video thumbnail image
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
            Text("Video Title")
                .font(.subheadline)
                .foregroundColor(.primary)
        }
        .padding(5)
        
//        .overlay{
//            RoundedRectangle(cornerRadius: 10)
//                .stroke(lineWidth: 1)
//        }
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
    }
}

struct UserDashView_Previews: PreviewProvider {
    static var previews: some View {
        UserDashView()
    }
}
