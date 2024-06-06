//
//  AssessmentVie.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI
import Charts
struct Question {
    let question : String
    let answers : [String]
}
struct AssessmentView: View {
    @State  var questionsAnswered : Int
    @State  var totalQuestions : Int
    @State  var question : Question
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                                .fill(Color.black)
                                .frame(height: 2)
                Spacer()
                HStack(){
                    Text("\(questionsAnswered)/\(totalQuestions)")
                    Chart {
                        BarMark(
                            x: .value("questions answered", questionsAnswered)
//                            y: .value("Count", questionsAnswered)
                        )
                        .foregroundStyle(by: .value("Product Category", totalQuestions))

                    }
                    .chartYAxis {
                        AxisMarks(values: .automatic) { value in
                            
                          
                        }
                    }
                    .chartXAxis {
                        AxisMarks(values: .automatic) { value in
                            
                            
                        }
                    }
                    .chartYScale(domain: 0...Double(totalQuestions))
                    .frame(height: 20)

                    
                }
                Spacer()
                VStack(spacing:16){
                    
                    Text(question.question)
                        .padding()
                        .font(.title2)
                        .foregroundStyle(.white)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 25))
                    
                    ForEach(question.answers.indices){ index in
                        HStack(alignment:.top,spacing:0){
                            Text("\(index+1) ) ")
                            Text(question.answers[index])
                                
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .overlay{
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.secondary)
                        }
                        
                            
                    }
                }
                .padding()
                .overlay{
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.secondary)
                }
                Spacer()
                
                Button{
                    
                } label:{
                    ButtonView(title: "Next")
                }
            }
            .padding()
           
                
        }
        .navigationTitle("Assessment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        AssessmentView(questionsAnswered: 3, totalQuestions: 10, question: Question(question: "Which of the following best describes the primary goal of UI/UX design?", answers: [" Creating visually appealing graphics","Maximizing website traffic","Enhancing user satisfaction and usability"," Increasing advertisement revenue"]))
    }
  
}
    

struct ButtonView: View {
    @State  var title : String
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .font(.title3)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .clipShape(.rect(cornerRadius: 16))
    }
}
