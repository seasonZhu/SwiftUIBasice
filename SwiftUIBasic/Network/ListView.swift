//
//  ListView.swift
//  SwiftUIBasic
//
//  Created by season on 2019/8/26.
//  Copyright © 2019 season. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State var list: [ListItem]?
    
    @State var isDisable = true
    
    @State var isNetWorkSuccess = false
    
    var body: some View {
//        List(list) { item in
//            ListCell(item: item)
//        }
            
        List {
            Section {
                Button(action: addListItem) {
                    Text("Add")
                }.font(.headline)
                .foregroundColor(.orange)
            }
            
            Section {
                if isNetWorkSuccess {
                    ForEach(list!) {
                        ListCell(item: $0)
                    }
                    .onDelete(perform: deleteARow(_:))
                    .onMove(perform: move(from:to:))
    //                .deleteDisabled(isDisable)
                }

            }
        }
        .navigationBarTitle("List View")
//        .navigationBarItems(trailing: Button(action: {
//            self.isDisable = !self.isDisable
//            print("state: \(self.isDisable)")
//        }) {
//            Text("Edit")
//        })
        .navigationBarItems(trailing: EditButton())
        .listStyle(GroupedListStyle())
        .onAppear {
            print("视图即将展现")
            self.netWorkRequest()
        }.onDisappear {
            print("视图即将消失")
        }
    }
    
    func netWorkRequest() {
        ViewModel.getListModelInfo { (list, error) in
            self.isNetWorkSuccess = list != nil
            self.list = list
        }
    }
    
    func addListItem() {
        guard let _ = list else {
            return
        }
        let index = Int.random(in: 0..<list!.count)
        let item = list![index]
        list = list! + [item]
    }
    
    func deleteARow(_ offset: IndexSet?) {
        guard let offset = offset else {
            return
        }
        
        guard let _ = list else {
            return
        }
        list!.remove(atOffsets: offset)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        guard let _ = list else {
            return
        }
        list!.move(fromOffsets: source, toOffset: destination)
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
