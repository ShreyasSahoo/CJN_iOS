//
//  LiveShowView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 25/05/24.
//

import SwiftUI

struct LiveShowView: View {
    var body: some View {
                VStack(alignment: .leading, spacing: 10) {
                    ScrollView(.vertical, showsIndicators: false){
//                            headerView()
                                          liveShowImage()
                                          Divider()
                                          liveChatInfo()
                                          Divider()
                                          iconsRow()
                                          Divider()
                                          chatSection()
                    }
                   

                }
                .padding()
                .navigationTitle("Live Show")
                .navigationBarTitleDisplayMode(.inline)
    }
    
    private func headerView() -> some View {
        HStack {
           
            Spacer()
            Text("Live Show")
                .font(.headline)
            Spacer()
        }
        .padding(.vertical)
    }
    
    private func liveShowImage() -> some View {
        Image("jobsTV") // Replace with your live show image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .clipShape(.rect(cornerRadius: 20))
    }
    
    private func liveChatInfo() -> some View {
        VStack(alignment: .leading) {
           
            Text("Live chat")
                .font(.headline)
            HStack{
                Text("Top chats")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("3.2k Watching")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
           //make it dynamic
            Text("2000 Opening | 3500 Interviews | 1300 Offer")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
//        .padding(.vertical)
    }
    
    private func iconsRow() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<5) { index in
                    iconThumbnail(imageName: "QR")
                }
            }
        }
//        .padding(.vertical)
    }
    
    private func iconThumbnail(imageName: String) -> some View {
        VStack{
            //make it dynamic by taking a qr struct
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipped()
             
            Text("Interview")
                .font(.caption)
        }
       
        
        
    }
    
    private func chatSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            
               
                    chatBubble(user: "Mudit Kumar", message: "This is a sample message.")
                    chatBubble(user: "Shivani Singh", message: "This is another sample message.")
                    chatBubble(user: "Shivani Singh", message: "This is another sample message.")
                    chatBubble(user: "Shivani Singh", message: "This is another sample message.")
                
                chatInputField()
            
            
        }
    }
    
    private func chatBubble(user: String, message: String) -> some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(user)
                    .font(.headline)
                Text(message)
                    .font(.subheadline)

            }
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.15))
        .cornerRadius(8)
    }
    
    private func chatInputField() -> some View {
        HStack {
            TextField("Chat...", text: .constant(""))
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(8)
            Button {
                // Action for sending message
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct LiveShowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
                LiveShowView()
            
        }
       
    }
}

