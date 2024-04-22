//
//  Footer.swift
//  Check24Challenge
//
//  Created by Kostiantyn Kaniuka on 22.04.2024.
//

import SwiftUI

struct FooterView: View {
    private let link: EndPoint = .webLink
    
    var body: some View {
        NavigationLink {
            WebView(url: link.url)
                       .edgesIgnoringSafeArea(.all)
        } label: {
            HStack {
                Text("© 2024 Check24")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                
            }
            .offset(x: 16)
        }
    }
    
}

#Preview {
    FooterView()
}
