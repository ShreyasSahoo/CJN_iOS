//
//  TrainingView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 31/05/24.
//

import SwiftUI

struct TrainingView: View {
    @State var searchText = ""
    var body: some View {
        GeometryReader  { geo in
            NavigationStack{
                    ScrollView{
                  
                        SearchBarView(searchText: $searchText,width: geo.size.width)
                    
                    
                        VStack (alignment:.leading,spacing:16){
                            ForEach(0..<4){ i in
                            VStack(alignment:.leading){
                                Text("UI/UX Courses \(i)")
                                    .font(.headline)
                                    .padding(.leading)
                                
                                    ScrollView(.horizontal,showsIndicators: false) {
                                        HStack(spacing:16) {
                                            ForEach(0..<4){ i in
                                                
                                                VStack(alignment:.leading ){
                                                    Image("courseImage")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 150)
                                                        .clipShape(.rect(cornerRadius: 10))
                                                    
                                                    Text("Title of Course \(i)")
                                                        .font(.footnote)
                                                        .bold()
                                                    
                                                    Text("By Instructor")
                                                        .font(.caption)
                                                    
                                                }
                                                .padding(8)
                                                .overlay{
                                                    RoundedRectangle(cornerRadius: 16)
                                                        .stroke(.gray.opacity(0.5))
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    .padding(.top)


                }
                .navigationTitle("Training")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

#Preview {
    TrainingView()
}

struct SearchBarView: View {
    @Binding var searchText : String
    @State var width: CGFloat
    var body: some View {
        TextField("Search for Training", text: $searchText)
            .padding()
            .cornerRadius(10)
            .frame(width: width*9/10)
            .overlay{
                    HStack{
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
            }
        
    }
}
