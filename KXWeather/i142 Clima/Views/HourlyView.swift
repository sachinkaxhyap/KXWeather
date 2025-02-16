//
//  HourlyView.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 15/02/2025.
//

import SwiftUI

struct HourlyView: View {
    var body: some View {
        HStack {
            VStack {
                Text("13°")
                    .font(.system(size: 42))
                    .foregroundColor(.primary)
                
                Image(systemName: "cloud.fill")
                    .font(.system(size: 42))
                    .foregroundColor(.primary)
                
                Text("Now")
                    .font(.system(size: 32))
                    .foregroundColor(.primary)
                    .opacity(0.8)
                
            }
        
        }
    }
}

#Preview {
    HourlyView()
}
