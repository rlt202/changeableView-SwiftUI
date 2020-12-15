//
//  ContentView.swift
//  changeableView SwiftUI
//
//  Created by Даниил Никулин on 15.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var blueSlider = Double.random(in: 0...255)
    
    @State private var redValue = ""
    @State private var greenValue = ""
    @State private var blueValue = ""
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            ColorizedView(color: UIColor(
                        red: CGFloat(redSlider / 255),
                        green: CGFloat(greenSlider / 255),
                        blue: CGFloat(blueSlider / 255),
                        alpha: 1)
            )
            .padding(45)
            VStack(spacing: 15.0) {
                HStack {
                    ColorSlider(value: $redSlider,
                                background: .red,
                                accentColor: .red)
                        .onChange(of: redSlider) { TextFieldValue in
                            redValue = "\(lround(TextFieldValue))"
                        }
                    
                    TextField("\(lround(redSlider))",
                              text: $redValue)
                        .bordered()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Oops, something wrong!"),
                                  message: Text("Only numbers"),
                                  dismissButton: .destructive(Text("Cancel"))
                                  )
                        }
                        .onChange(of: redValue) { TextFieldValue in
                            if (Double(TextFieldValue) == nil) {
                                if TextFieldValue != "" {
                                    showAlert = true
                                    redValue = ""
                                }
                            }
                        }
                }
                HStack {
                    ColorSlider(value: $greenSlider,
                                background: .green,
                                accentColor: .green)
                        .onChange(of: greenSlider) { TextFieldValue in
                            greenValue = "\(lround(TextFieldValue))"
                        }
                    TextField("\(lround(greenSlider))",
                              text: $greenValue)
                        .bordered()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Oops, something wrong!"),
                                  message: Text("Only numbers"),dismissButton: .destructive(Text("Cancel"))
                            )
                        }
                        .onChange(of: greenValue) { TextFieldValue in
                            if (Double(TextFieldValue) == nil) {
                                if TextFieldValue != "" {
                                    showAlert = true
                                    greenValue = ""
                                }
                            }
                        }
                }
                HStack {
                    ColorSlider(value: $blueSlider,
                                background: .blue,
                                accentColor: .blue)
                        .onChange(of: blueSlider) { TextFieldValue in
                            blueValue = "\(lround(TextFieldValue))"
                        }
                    
                    TextField("\(lround(blueSlider))",
                              text: $blueValue)
                        .bordered()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Oops, something wrong!"),
                                  message: Text("Only numbers"),
                                  dismissButton: .destructive(Text("Cancel"))
                            )
                        }
                        .onChange(of: blueValue) { TextFieldValue in
                            if (Double(TextFieldValue) == nil) {
                                if TextFieldValue != "" {
                                    showAlert = true
                                   blueValue = ""
                                }
                            }
                        }
                }
            }
            .padding(.trailing)
            .frame(width: 350)
            
            
            Spacer()
        }
        .background(Color.black)
        .ignoresSafeArea(.all)
        }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    
    let background: Color
    var accentColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.white)
            Slider(value: $value, in: 0...255,
                   step: 0.5)
                .background(background)
                .cornerRadius(20)
                .accentColor(accentColor)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color.white)
                    )
            Text("255").foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading)
            .frame(minWidth: 50, idealWidth: 50, maxWidth: 50)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10,
                                 style: .continuous)
                    .stroke(Color.white, lineWidth: 7)
            )
    }
}

extension View {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
