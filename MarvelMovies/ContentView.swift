//
//  ContentView.swift
//  MarvelMovies
//
//  Created by Tien Dao on 2022-11-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
