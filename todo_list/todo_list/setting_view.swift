//
//  setting_view.swift
//  todo_list
//
//  Created by KIET58 on 02/09/26.
//

import SwiftUI

struct setting_view: View {
    @State var ar:[String] = ["User profile","Privacy","Notifications","Help","Feedback","Sign out"]
    @State var theme:[Color] = [Color.purple,Color.cyan,Color.blue]
    @Binding var c: Color
    var body: some View {
       Text("").navigationBarTitle("Settings")
        List{
            ForEach(ar,id:\.self){
                index in
                Text(index).font(.title3)
            }
       
       
            ForEach(theme,id:\.self){
                index in
                Text(index).font(.title3)
                
                    Button{
                        c = index
                    }label: {
                    HStack {
                        Text("Change color")
                        Spacer()
                        Circle()
                            .fill(index)
                            .frame(width: 30, height: 30)
                    }
                }
                
            }
            
         }.listStyle(.plain)
        
    }
            
}

#Preview {
    setting_view(c: .constant(.cyan))
}
