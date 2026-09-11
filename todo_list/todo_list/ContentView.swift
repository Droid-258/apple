//
//  ContentView.swift
//  todo_list
//
//  Created by KIET58 on 01/09/26.
//

import SwiftUI
struct item{
     var name:String
     var completed:Bool
     var important:Bool
}
struct ContentView:  View{
    @State var task = ""
    @State var arr:[item] = [item(name:"study",completed : false,important:false),item(name:"gym",completed : false,important:false)]
    @State var rm  = 0
    @State var c = Color.cyan
    var body: some View{
        NavigationStack{
            Text("To do List")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(c)
            
            HStack{
                TextField("ENTER THE TASK", text: $task,prompt:Text("Enter the task").foregroundStyle(.black))
                    .frame(width:300,height:25)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .background(.ultraThinMaterial)
                    .foregroundStyle(.black)
                    .clipShape(.rect(cornerRadius:30))
                Button(){
                    addtask()
                    
                    //            .buttonStyle(.borderedProminent)
                    //            .font(.title)
                }label:{
                    Text("+")
                        .font(.title2)
                        .padding(20)
                        .background(c)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                }
            }
            List{
                ForEach(arr.indices,id:\.self){
                    index in
                    HStack{
                        
                        Button{
                            
                            arr[index].completed.toggle()
                            
                            //                        remove(index)
                        }
                        label:{
                            if(arr[index].completed){
                                
                                
                                Image(systemName: "checkmark.circle")
                                
                                
                            }
                            else{
                                Image(systemName: "circle")
                            }
                        }
                        
                        Text(arr[index].name)
                        if(arr[index].important){
                            Image(systemName: "star.fill")
                        }
                    }
                    
                    .swipeActions(edge : .leading){
                        Button{
                            arr[index].important.toggle()
                        }
                        label:{
                            Text("Mark important")
                            
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing){
                        Button{
                            arr.remove(at:index)
                        }
                        label:{
                            Text("delete")
                            
                        }
                        .tint(.red)
                    }
                }
            }
            .listStyle(.plain)
            .font(.title2)
            NavigationLink{
                setting_view(c:$c)
                
            }
            label:{
                HStack{
                    Text("Settings").foregroundStyle(c).font(.title3).bold()
                    Image(systemName:"gear" )
                }
            }
            
        }
    }
    func addtask(){
        if(task != ""){
            arr.append(item(name: task,completed:false,important: false))
            task = ""
        }
        else{
            print("empty")
        }
    }
   
}
    
#Preview {
    ContentView()
}

