//
//  InterviewView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 31/05/24.
//

import SwiftUI

struct InterviewView: View {
    @State var searchText = ""
    var body: some View {
        GeometryReader  { geo in
            NavigationStack{
                ScrollView(showsIndicators:false){
                    SearchBarView(searchText: $searchText, width: geo.size.width)
                    
                    ForEach(0..<4){ _ in
                        VStack(alignment:.leading){
                            Text("Microsoft")
                            
                           
                                
                                    ScrollView(.horizontal,showsIndicators: false){
                                        
                                        HStack(spacing:15) {
                                            ForEach(0..<4){ _ in
                                            VStack(){
                                                Image("logo")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geo.size.width/2)
                                                Text("Post")
                                                    .font(.footnote)
                                                    .bold()
                                                Text("Interview")
                                                    .font(.caption)
                                            }
                                            .padding()
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            }
                                            }
                                        }
                                }
                                
                            
                        }
                        .padding()
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    InterviewView()
}
