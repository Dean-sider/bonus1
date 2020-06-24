//
//  ContentView.swift
//  bonus1
//
//  Created by User23 on 2020/6/24.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showalert = false
    @State var number :Int = 0
    @State private var Transportation = ["腳踏車","走路","搭公車","翹課","請假"]
    @State private var color:[Color] = [.yellow,.blue,.orange,.black,.pink]
   var body: some View {
    ZStack{
         Image("背景")
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
    VStack(alignment: .center){
        Text("決定今天")
        .font(.system(size: 30))
            .offset(x:-10,y: -20)
        .foregroundColor(Color.pink)
        .padding(.bottom)
        Text("怎麼去學校了嗎？!")
        .font(.system(size: 30))
            .offset(x:10,y: -15)
        .foregroundColor(Color.pink)
        .padding(.bottom)
        ZStack{
            Circle()
            .frame(width:500,height:300)
            .foregroundColor(color[number])
            Text("\(number)")
            .font(.system(size:160))
            .foregroundColor(Color.white)
        }
    Button(action:{
        let ran = 1...6
        self.number = ran.randomElement()!
        withAnimation(.default){
        }
        self.showalert = true
    }){
        Image("骰子")
        .renderingMode(.original)
        .resizable()
        .frame(width: 120,height: 120)
        .offset(x:-10,y: 35)
        Text("請點我")
        .font(.system(size: 40))
        .foregroundColor(.black)
        .padding(15)
         .background(LinearGradient(gradient: Gradient(colors:[Color(red:171/255,green:236/255,blue:214/255),Color(red:251/255,green:237/255,blue:150/255)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x:1,y:0)))
        .cornerRadius(30)
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 5))
        .offset(x:10,y: 35)
    }.alert(isPresented: $showalert) { () -> Alert in
        return Alert(title: Text(Transportation[number]))
    }
    }
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

