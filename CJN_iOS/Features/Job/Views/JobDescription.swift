//
//  JobDescription.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct JobDescription: View {
    let responsibilities = [
        "Project Management: Overseeing project timelines, milestones, and deliverables to ensure successful completion.",
        "Team Leadership: Leading, mentoring, and supporting a team to achieve organizational goals and objectives.",
        "Client Communication: Managing client relationships and communication to ensure satisfaction and address any concerns.",
        "Data Analysis: Analyzing data to identify trends, insights, and areas for improvement in business processes.",
        "Budget Management: Creating, monitoring, and adjusting budgets to ensure financial goals are met.",
        "Strategic Planning: Developing and implementing strategic plans to drive growth and improve operational efficiency.",
        "Quality Assurance: Ensuring products and services meet quality standards and regulatory requirements.",
        "Training and Development: Organizing and conducting training sessions to enhance team skills and knowledge.",
        "Problem Solving: Identifying issues, developing solutions, and implementing corrective actions to resolve problems.",
        "Reporting and Documentation: Preparing reports and maintaining documentation to track progress and support decision-making processes."
    ]
    let requirements = [
        "Bachelor's degree in Computer Science or a related field.",
        "3+ years of experience in software development.",
        "Strong knowledge of Swift and iOS development."
    ]
    @State private var showMore = false
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment:.leading){
            ScrollView(showsIndicators:false){
                VStack(alignment:.center,spacing: 20){
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
                        Spacer()
                    }
                    .padding(.bottom)
                    VStack(alignment:.leading){
                      Text("Description")
                            .bold()
                            .font(.callout)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus egestas nisl sit amet nibh tempor, vel malesuada magna laoreet. Morbi et dapibus turpis, in tempus eros. Nunc viverra mauris et diam laoreet, et lacinia urna molestie. Donec vel sem ullamcorper, consectetur nunc id, viverra ligula.")
                            .font(.footnote)
                            Divider()
                        Text("About Role")
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus egestas nisl sit amet nibh tempor, vel malesuada magna laoreet. Morbi et dapibus turpis.")
                            .font(.footnote)
                        Divider()
                        Text("Responsibilities")
                        ForEach(responsibilities.indices){ index in
                            if index < 2 {
                                Text("\(index+1). \(responsibilities[index])")
                                    .font(.caption)
                                    
                            } else {
                                if showMore {
                                    Text("\(index+1). \(responsibilities[index])")
                                        .font(.caption)
                                        
                                }
                                
                            }
                           
                        }
                        HStack{
                            Button{
                                showMore.toggle()
                            } label : {
                                Text("Show \(showMore ? "Less" : "More")")
                                    .font(.footnote)
                                    .padding(8)
                                    .foregroundStyle(Color.secondary)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.secondary)
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        Divider()
                        VStack(alignment:.leading){
                            Text("Requirements")
                            
                            ForEach(requirements.indices){ index in
                                Text("\(index+1). \(requirements[index])")
                                    .font(.caption)
                                    
                            }
                            
                        }
                    }
                    VStack{
                        Text("Terms and Conditions")
                            .fontWeight(.semibold)
                        Text("Payment required for priority interview. After payment, an assignment is given, followed by a link for breakout rooms.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Button{
                            
                        } label: {
                            Text("Proceed")
                                .padding()
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 10))
                                
                        }
                    }
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.secondary)
                    }
                }
                .padding()
                
                .frame(width: geo.size.width*9/10)
                
            }
            .frame(maxWidth: .infinity)
               
            }
        }
        
    }
}

#Preview {
    JobDescription()
}
