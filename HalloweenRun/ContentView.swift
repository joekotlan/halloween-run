//
//  ContentView.swift
//  HalloweenRun
//
//  Created by Joe Kotlan on 9/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("ghost")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0), .black, .black.opacity(0)]), startPoint: .top, endPoint: .bottom))
                VStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 30) {
                        Text("Enjoy a virtual run with friends")
                            .font(Font.custom("Gotham-Ultra", size: 35))
                            .multilineTextAlignment(.center)
                            .lineSpacing(2)
                        Text("Get ready to run for your life on the run of your life. Complete tasks to survive.")
                            .font(Font.custom("HelveticNeueLTStd-Md", size: 18))
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .opacity(0.6)
                            .padding(.bottom, 20)
                        NavigationLink(destination: Map()) {
                            Text("Get started")
                                .font(Font.custom("Gotham-Ultra", size: 20))
                                .padding(30)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("light-purple"), Color("dark-purple")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .cornerRadius(22)
                        }
                    }
                    .padding(.top, 80)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 30)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("peach"), Color("pink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(30)
                    .foregroundColor(.white)
                }
                .padding(20)
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
