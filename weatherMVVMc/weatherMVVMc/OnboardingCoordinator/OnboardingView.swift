//
//  OnboardingView.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import SwiftUI

struct OnboardingView: View {
    
    var doneRequested: () -> ()
    
    var body: some View {
        TabView {
            
            ScaledImageView(name: "MVVMLayout")
                .tag(0)
            ScaledImageView(name: "coordinator")
                .tag(1)
            ScaledImageView(name: "MVVM-C")
                .tag(2)
            
            Button("OK GOT IT!") {
                doneRequested()
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black
            .ignoresSafeArea(.all))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneRequested: { })
    }
}
