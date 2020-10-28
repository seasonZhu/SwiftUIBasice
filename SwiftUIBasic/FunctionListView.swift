
//
//  FunctionListView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/12/12.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI

struct FunctionListView: View {
    
    @State var isAlert = false
    
    var body: some View {
        List {
            NavigationLink(destination: ToastOrderView()) {
                Text("Next Controller")
            }
            
            NavigationLink(destination: ListView()) {
                Text("To ListView")
            }
            
            NavigationLink(destination: SFSymbolsView()) {
                Text("To SFSymbolsView")
            }
            
            NavigationLink(destination: ExampleView()) {
                Text("To ExampleView")
            }
            
            NavigationLink(destination: ControlView()) {
                Text("To ControlView")
            }
            
            NavigationLink(destination: NewsListView()) {
                Text("To UniAppExample")
            }
            
            Section(header: Text("Good Heros"), footer: Text("This is footer Powerful").foregroundColor(.yellow)){
                Text("Thanos")
                Text("Thanos")
                Text("Thanos")
                Text("Thanos")
                Text("Thanos")
                Text("Thanos")
                Text("Thanos")
                
                Group {
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                }
            }
            
            Section(header: Text("Bad Heros"), footer: Text("This is footer Not as Powerful").foregroundColor(.purple)){
                Text("Iron Man")
                Text("Iron Man")
                Text("Iron Man")
                Text("Iron Man")
                Text("Iron Man")
                Text("Iron Man")
                Text("Iron Man")
            }
        }.navigationBarItems(trailing:
            Button(action:
                {
                    print("右上按钮被点击了")
                    Alert(
                        title: Text("Title"),
                        message: Text("message"),
                        dismissButton: .default(Text("Ok!"))
                    )
                    
            }) {
            HStack {
                Image(systemName: "wrench")
                    .imageScale(.medium)
                
            }
            .frame(width: 30, height: 30)
        })
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text("some"))
        })
        
        
    }
}

struct FunctionListView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionListView()
    }
}
