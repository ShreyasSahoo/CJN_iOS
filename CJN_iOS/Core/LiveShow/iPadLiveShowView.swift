//
//  iPadLiveShowView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import SwiftUI

struct iPadLiveShowView: View {
    @State private var  searchText = ""
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                       ScrollView {
                           
                           VStack(alignment: .center, spacing: 10) {
                               Spacer()
                               HeaderView(width: geo.size.width/2, searchText: $searchText)

                              Spacer()
                               HStack(spacing:10){
                                   Spacer()
                                   VStack{
                                       Image("Ad")
                                           .resizable()
                                           .scaledToFill()
                                           .clipShape(.rect(cornerRadius: 20))
                                           .frame(width:geo.size.width/5, height: geo.size.height*3/5)
                                           
                                   }
                                   Spacer()
                                   VStack(){
                                       
                                       Image("LiveShow")
                                           .resizable()
                                           .scaledToFit()
                                           .clipShape(.rect(cornerRadius: 20))
                                           .frame(width:geo.size.width/2,height: geo.size.height*3/5)
                                       

                                           Text("2.4 K Watching |    2000 Opening |    3500 Interviews   |     1200 Offers")
                                       
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                       .background(.secondary.opacity(0.25))
                                       .clipShape(.rect(cornerRadius: 20))
                                       
                                   }
                                   .padding(.bottom,100)
                                   .frame(height: geo.size.height*3/5)
                                   .overlay{
                                       RoundedRectangle(cornerRadius: 25)
                                           .stroke(.secondary)
                                   }
                                   Spacer()
                                   VStack(alignment : .leading){
                                       Text("Live Chat")
                                           .font(.subheadline)
                                       Divider()
                                       VStack{
                                           ChatMessageView(message: "hello", sender: "Ramesh", time: "18:31")
                                           ChatMessageView(message: "hi", sender: "Ram;a", time: "18:30")
                                           ChatMessageView(message: "whatsup", sender: "Radha", time: "18:26")
                                           ChatMessageView(message: "nice to meet you", sender: "Nandini", time: "18:24")
                                       }
                                       Spacer()
                                   }
                                   .padding()
                                   .frame(height:geo.size.height*3/5)
                                   .overlay{
                                       RoundedRectangle(cornerRadius: 20)
                                           .stroke(.secondary)
                                   }
                                   
                                   Spacer()
                               }
                               .frame(width: geo.size.width)

                               Spacer()
                               
                               
                               
                                   ScrollView(.horizontal){
                                       Spacer()
                                       HStack{
                                           ForEach(1..<10){ _ in
                                               VStack{
                                                   
                                                   Image("QR")
                                                       .resizable()
                                                       .scaledToFit()
                                                       .frame(width: 100)
                                                   
                                                   Text("Link")
                                                   
                                               }
                                               
                                               
                                           }
                                       }
                                       .padding()
                                       .overlay{
                                           RoundedRectangle(cornerRadius: 25)
                                               .stroke(.secondary)
                                       }
                                       Spacer()
                                   }
                               
                                   .frame(width: geo.size.height)
                          
                              
                               Spacer()
                             
                               
                               
                           }
                           .padding(.horizontal)
                       }
                       .padding(.horizontal)
                       
                       
//                       .navigationBarHidden(true)
            }
            .padding(.horizontal)
        }
    }
}


struct ChatMessageView: View {
    let message: String
    let sender: String
    let time: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(sender)
                .foregroundStyle(.secondary)
            Text(message)
                .font(.callout)
            HStack {
                Spacer()
                Text(time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(.secondary.opacity(0.1))
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading:  0,bottomLeading: 30, bottomTrailing: 30, topTrailing: 30)))
        .shadow(radius: 2)
    }
}


#Preview {
    iPadLiveShowView()
}

struct HeaderView: View {
    var width : CGFloat
    @Binding var searchText : String
    var body: some View {
        HStack {
            
            Image(systemName: "text.justify")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing,10)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
            
            Spacer()
            
            
            TextField("Search for jobs", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .frame(width: width)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                )
            
            
        }
        .padding(.vertical,4)
        .padding(.horizontal)
    }
}
