//
//  Map.swift
//  HalloweenRun
//
//  Created by Joe Kotlan on 9/3/21.
//

import MapKit
import SwiftUI

struct Map: View {
    
    @State private var offset = CGFloat.zero
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            MapView()
                .edgesIgnoringSafeArea(.all)
                .environment(\.colorScheme, .dark)
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(.white), lineWidth: 1)
                            )
                    })
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color("dark-purple"))
                            .frame(maxWidth: 100, maxHeight: 40)
                            .cornerRadius(50)
                            .padding(.trailing, 10)
                        HStack {
                            Text("28")
                                .padding(.leading, 10)
                                .font(Font.custom("Gotham-Ultra", size: 18))
                                .foregroundColor(.white)
                            Image("candy")
                        }

                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "location.viewfinder")
                        .font(.system(size: 25))
                        .padding(15)
                        .foregroundColor(.white)
                        .background(Color("dark-purple"))
                        .cornerRadius(30)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        HStack {
                            Image("pumpkin-park")
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text("Destination")
                                    .font(Font.custom("HelveticaNeueLTStd-Md", size: 14))
                                    .opacity(0.6)
                                Text("Pumpkin Park")
                                    .font(Font.custom("Gotham-Ultra", size: 20))
                                    .padding(.bottom, 10)
                                    .padding(.top, 1)
                                HStack {
                                    Text("175m")
                                        .font(Font.custom("Gotham-Ultra", size: 18))
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 4))
                                        .opacity(0.6)
                                        .padding(.horizontal, 10)
                                    Text("5 minutes left")
                                        .font(Font.custom("HelveticaNeueLTStd-Md", size: 16))
                                        .opacity(0.6)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(5)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color("peach"), Color("pink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        //.background(offset == 0 ? Color.green : Color.blue)
                        HStack {
                            Image("pumpkin-park")
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text("Destination")
                                    .font(Font.custom("HelveticaNeueLTStd-Md", size: 14))
                                    .opacity(0.6)
                                Text("Pumpkin Park")
                                    .font(Font.custom("Gotham-Ultra", size: 20))
                                    .padding(.bottom, 10)
                                    .padding(.top, 1)
                                HStack {
                                    Text("175m")
                                        .font(Font.custom("Gotham-Ultra", size: 18))
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 4))
                                        .opacity(0.6)
                                        .padding(.horizontal, 10)
                                    Text("5 minutes left")
                                        .font(Font.custom("HelveticaNeueLTStd-Md", size: 16))
                                        .opacity(0.6)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(5)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color("peach"), Color("pink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        HStack {
                            Image("pumpkin-park")
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text("Destination")
                                    .font(Font.custom("HelveticaNeueLTStd-Md", size: 14))
                                    .opacity(0.6)
                                Text("Pumpkin Park")
                                    .font(Font.custom("Gotham-Ultra", size: 20))
                                    .padding(.bottom, 10)
                                    .padding(.top, 1)
                                HStack {
                                    Text("175m")
                                        .font(Font.custom("Gotham-Ultra", size: 18))
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 4))
                                        .opacity(0.6)
                                        .padding(.horizontal, 10)
                                    Text("5 minutes left")
                                        .font(Font.custom("HelveticaNeueLTStd-Md", size: 16))
                                        .opacity(0.6)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(5)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color("peach"), Color("pink")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .named("scroll")).origin.x)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) { print("offset >> \($0)") }
                }
                .coordinateSpace(name: "scroll")
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
