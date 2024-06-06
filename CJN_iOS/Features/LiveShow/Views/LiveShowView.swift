//
//  LiveShowView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 25/05/24.
//

import SwiftUI

struct LiveShowView: View {
    @StateObject private var feedbackViewModel = FeedbackViewModel()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
               
                    liveShowImage()
                    Divider()
                    liveChatInfo()
                    Divider()
                    iconsRow()
                    Divider()
                    chatSection()
                        /*.padding(.bottom, 60)*/ // Add padding to prevent content from being hidden under the input field
                
                
            }

            
            VStack {
                Spacer()
                HStack{
                    
                }
                chatInputField()
            }
        }
        
        .onAppear {
            Task {
                await feedbackViewModel.fetchFeedback()
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(Text("Live Show").font(.largeTitle))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrowshape.backward.circle.fill")
                        .foregroundStyle(Color.accentColor)
                        .scaleEffect(1.5)
                }
            }
        }
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
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func liveChatInfo() -> some View {
        VStack(alignment: .leading) {
            Text("Live chat")
                .font(.headline)
            HStack {
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
    }

    private func iconsRow() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<5) { index in
                    iconThumbnail(imageName: "QR")
                }
            }
        }
    }

    private func iconThumbnail(imageName: String) -> some View {
        VStack {
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
        VStack(alignment: .leading) {
            ScrollView() {
                ForEach(feedbackViewModel.feedback?.responseMessage ?? []){ feedback in
                    chatBubble(user: feedback.feedbackUser, message: feedback.feedbackText)
                }
            }
            .scrollIndicators(.hidden)
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
        .background(Color.gray.opacity(0.15))
        .cornerRadius(8)
    }

    private func chatInputField() -> some View {
        HStack(alignment:.bottom) {
            TextField("Chat...", text: .constant(""))
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Spacer()
                        Button {

                        } label: {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing)
                    }
                )
        }

    }
}

#Preview {
    NavigationStack {
        LiveShowView()
    }
}
