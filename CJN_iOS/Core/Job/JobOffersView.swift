//
//  JobOffersView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct JobOffer : Identifiable {
    let id = UUID()
    let company: String
    let position: String
    let postedDate: String
    let salary: String
    let employmentType: String
    let location: String
    let description: String
    let applyLink: String
    let favorite: Bool
}

struct JobOffersView: View {

    let jobOffers: [JobOffer] = [
        JobOffer(
            company: "Instagram",
            position: "UI UX Designer",
            postedDate: "2 days ago",
            salary: "12,00,000 P.A",
            employmentType: "Full time",
            location: "Gurugram",
            description: "We're on a mission to make app building so easy everyone can do it – regardless of their background, tech knowledge or budget. We’ve already helped thousands of entrepreneurs, small businesses and even global brands, like the BBC, etc.",
            applyLink: "#",
            favorite: false
        ),
        JobOffer(
            company: "Google",
            position: "Software Engineer",
            postedDate: "3 days ago",
            salary: "20,00,000 P.A",
            employmentType: "Full time",
            location: "Bengaluru",
            description: "Join our team to build innovative software solutions that make a difference. Work with top talent and cutting-edge technology to create products that reach billions of users worldwide.",
            applyLink: "#",
            favorite: false
        ),
        JobOffer(
            company: "Microsoft",
            position: "Data Scientist",
            postedDate: "5 days ago",
            salary: "18,00,000 P.A",
            employmentType: "Full time",
            location: "Hyderabad",
            description: "Be a part of our data science team, where you'll analyze complex data sets to drive business decisions. Collaborate with cross-functional teams to develop and implement data-driven strategies.",
            applyLink: "#",
            favorite: false
        ),
        JobOffer(
            company: "Amazon",
            position: "Product Manager",
            postedDate: "1 week ago",
            salary: "15,00,000 P.A",
            employmentType: "Full time",
            location: "Mumbai",
            description: "Lead product development initiatives and drive the success of our products. Work with diverse teams to identify market opportunities and deliver exceptional customer experiences.",
            applyLink: "#",
            favorite: true
        ),
        JobOffer(
            company: "Facebook",
            position: "Marketing Specialist",
            postedDate: "1 day ago",
            salary: "10,00,000 P.A",
            employmentType: "Full time",
            location: "Delhi",
            description: "Develop and execute marketing strategies that elevate our brand and engage our audience. Utilize data-driven insights to optimize campaigns and achieve marketing goals.",
            applyLink: "#",
            favorite: false
        )
    ]
    
    var body: some View {
        GeometryReader{ geo in
            NavigationStack{
                ScrollView(showsIndicators:false){
                    VStack{
                        
                        TextField("Search for jobs", text: .constant(""))
                            .padding()
                            .frame(width: geo.size.width*4/5)
                            .foregroundStyle(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(.systemGray3))
                                    HStack {
                                        Spacer()
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                                
                            )
                       
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack{
                        Text("Filter")
                            .font(.title3)
                        Spacer()
                        Image("hamburger")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    }
                    VStack(spacing:20){
                        ForEach(jobOffers){ jobOffer in
                            
                            JobOfferItemView(jobOffer: jobOffer,favouriteClicked:jobOffer.favorite)
                                
                        }
                    }
                    
                    
                }
                
                .padding(.horizontal)
                .navigationTitle("Job Offers")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}



#Preview {
    NavigationStack{
        JobOffersView()
    }
  
}

struct JobOfferItemView: View {
    @State var jobOffer: JobOffer
    @State var favouriteClicked: Bool
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text(jobOffer.company)
                    Text(jobOffer.position)
                }
                Spacer()
                Text(jobOffer.postedDate)
            }
            .padding(.horizontal)
            Divider()
            HStack(alignment:.center,spacing:16){
                HStack{
                    Image(systemName: "banknote")
                        .foregroundStyle(Color.accentColor)
                    Text(jobOffer.salary)
                }
                HStack{
                    Image(systemName: "clock.badge.checkmark.fill")
                        .foregroundStyle(Color.accentColor)
                    Text(jobOffer.employmentType)
                }
                
                HStack{
                    Image(systemName: "location.fill")
                        .foregroundStyle(Color.accentColor)
                    Text(jobOffer.location)
                }
            }
            .font(.footnote)
            
            VStack(alignment:.leading){
                Text("Description")
                    .fontWeight(.semibold)
                Text(jobOffer.description)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(3)
            }
            HStack{
                Button{
                    
                } label:{
                    Text("Apply")
                        .padding()
                        .foregroundStyle(.white)
                        .font(.title3)
                        .frame(width: 200)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 16))
                }
                Spacer()
                Button{
                    favouriteClicked.toggle()
                } label:{
                    Image(systemName: favouriteClicked ? "heart.fill":"heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .tint(.red)
                }
            }
        }
        
        
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 25)
                .stroke(.secondary)
        }
    }
}
