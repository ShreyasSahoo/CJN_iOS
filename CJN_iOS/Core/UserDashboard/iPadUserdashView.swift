//
//  iPadUserdashView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import SwiftUI

struct iPadUserdashView: View {
    @State private var searchText = ""
    @State private var showProfileTab = false
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                       ScrollView {
                           VStack(alignment: .leading, spacing: 10) {
                               
                               HStack {
                                   
                               Button{
                                   showProfileTab.toggle()
                               } label :{
                                   Image("hamburger")
                                       .resizable()
                                       .clipShape(.rect(cornerRadius: 5))
                                       .frame(width: 30, height: 30)
                                       .padding(.trailing,10)
                               }
                                       Image("logo")
                                           .resizable()
                                           .scaledToFit()
                                           .frame(height: 40)
                                   
                                   
                                   Spacer()
                                   
                                       
                                       TextField("Search for jobs", text: $searchText)
                                           .padding()
                                           .background(Color(.systemGray6))
                                           .cornerRadius(10)
                                           .frame(width: geo.size.width/2)
                                           .overlay(
                                               HStack {
                                                   Spacer()
                                                   Image(systemName: "magnifyingglass")
                                                       .foregroundColor(.gray)
                                                       .padding(.trailing, 8)
                                               }
                                           )
                                   
                                   
                               }
                               .padding(4)

                               VStack(alignment: .leading, spacing: 20) {
                                   Image("jobsTV")
                                       .resizable()
                                       .scaledToFill()
                                       .frame(height: geo.size.height/3)
                                       .clipShape(.rect(cornerRadius: 20))
                                   
                                   
                                       NavigationLink {
                                          iPadLiveShowView()
                                       
                                   } label : {
                                       Text("Join live Show")
                                           .font(.headline)
                                           .foregroundColor(.white)
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color.blue)
                                           .cornerRadius(10)
                                   }
                                   
                               }
                               .padding()

                               // Upcoming show trailers
                               ExtractedView(width:geo.size.width/5, height: geo.size.height/10,title: "Upcoming show trailers")
                               

                               // Recommended videos
                           ExtractedView(width:geo.size.width/5, height: geo.size.height/10,title: "Recommended Videos")
                               
                               // Job Offers
                              

                               VStack(alignment:.leading){
                                   Text("Job Offers")
                                       .font(.title2)
                                       .fontWeight(.bold)
                                       .padding(.leading)
                                   ScrollView(.horizontal,showsIndicators: false){
                                       HStack(spacing: 20) {
                                           ForEach(1..<16) { index in
                                               JobOfferView(width: geo.size.width/6)
                                               
                                           }
                                       }
                                       .padding([.leading, .trailing])
                                   }
                               }
                               
                               
                           }
                       }
                       .padding(.horizontal)
                       .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    iPadUserdashView()
}



struct JobOfferView : View {
    var width : CGFloat
    var body : some View {
        VStack(alignment:.leading){
            HStack(alignment:.top){
                Image("yt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .clipShape(.rect(cornerRadius: 10))
                VStack(alignment:.leading){
                    //job role
                    Text("UX Designer Intern")
                        .font(.callout)
                        .fontWeight(.semibold)
                    //company
                    Text("Builder.ai")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    //location
                    Text("Gurugram, Haryana, India")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            VStack(alignment:.leading){
              Text("Description")
                    .bold()
                    .font(.callout)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus egestas nisl sit amet nibh tempor, vel malesuada magna laoreet. Morbi et dapibus turpis, in tempus eros. Nunc viverra mauris et diam laoreet, et lacinia urna molestie. Donec vel sem ullamcorper, consectetur nunc id, viverra ligula. Donec porta quam sit amet augue bibendum, vitae lacinia velit feugiat. Proin vel est in risus sodales dapibus. Phasellus pellentesque auctor nulla. Praesent vitae velit gravida, suscipit arcu in, laoreet augue. Mauris varius mattis bibendum.")
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
        .padding()
        
        .frame(minWidth: 150,maxWidth: width)
        
        .overlay{
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 3)
                .stroke(.secondary)
        }
    }
}

struct ExtractedView: View {
    var width,height : CGFloat
     var title : String
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(1..<16) { index in
                        Image("jobsTV")
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 15))
                            .frame(width: width*2/3)
                            
                    }
                }
                .padding([.leading, .trailing])
            }
        }
    }
}
