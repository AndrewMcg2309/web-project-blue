//
//  ContentView.swift
//  saturn-app
//
//  Created by andrew.mcgowan on 4/20/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Saturn App")
            
            Button(action: AwsStart) {
                Text("Start Instance")
            }
        }
        .padding()
    }
}

func AwsStart(){
    let url_start = URL(string: "https://fyrbzl2e5j.execute-api.eu-west-1.amazonaws.com/startWebsite")!
    let message = Message(
        message: "Request from iPhone"
    )
    struct Message: Encodable {
        let message: String
    }
    let data = try! JSONEncoder().encode(message)
    
    var request = URLRequest(url: url_start)
    request.httpMethod = "POST"
    request.httpBody = data
    request.setValue(
        "application/json",
        forHTTPHeaderField: "Content-Type"
    )
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        let statusCode = (response as! HTTPURLResponse).statusCode

        if statusCode == 200 {
            print("Succesful POST")
        } else {
            print("POST failed")
        }
    }
    task.resume()
}

#Preview {
    ContentView()
}