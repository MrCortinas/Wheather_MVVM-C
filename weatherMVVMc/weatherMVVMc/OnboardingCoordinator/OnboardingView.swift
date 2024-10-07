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
            
            ScaledImageView(name: "cat")
                .tag(0)
            ScaledImageView(name: "lama")
                .tag(1)
            ScaledImageView(name: "rose")
                .tag(2)
            
            Button("Done") {
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
