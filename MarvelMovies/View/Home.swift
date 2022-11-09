//
//  Home.swift
//  MarvelMovies
//
//  Created by Tien Dao on 2022-11-09.
//

import SwiftUI

struct Home: View {
    
    // MARK: View Properties
    @State var currentTab: Tab = .home
    @Namespace var animation
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(spacing: 15){
                HeaderView()
                
                SearchBar()
                
                TabBar()
            }
            .padding([.horizontal,.top],15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background {
                GeometryReader{proxy in
                    LinearGradient(colors: [
                        .clear,
                        Color("BGTop"),
                        Color("BGBottom")
                    ], startPoint: .top, endPoint: .bottom)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: Custom Tab Bar
    @ViewBuilder
    func TabBar()->some View{
        HStack(spacing: 0){
            ForEach(Tab.allCases,id: \.rawValue){tab in
                VStack(spacing: -2){
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab{
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){currentTab = tab}
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom,10)
    }
    
    // MARK: Search Bar
    @ViewBuilder
    func SearchBar()->some View{
//        if #available(iOS 15.0, *) {
            HStack(spacing: 15){
                Image("Search")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(.gray)
                
                TextField("Search",text: .constant(""))
                    .padding(.vertical,10)
                
                Image("Mic")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.vertical,6)
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.white.opacity(0.12))
            }
            .padding(.top,20)
//        } else {
//            // Fallback on earlier versions
//        }
    }
    
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        HStack{
            VStack(alignment: .leading, spacing: 6) {
                (Text("Hello")
                    .fontWeight(.semibold) +
                 Text(" Tien Dao")
                )
                .font(.title2)
                
                Text("Book your favourite movie")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Button {
                
            } label: {
                Image("mainUser")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
