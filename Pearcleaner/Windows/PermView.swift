//
//  PermView.swift
//  Pearcleaner
//
//  Created by Alin Lupascu on 11/16/23.
//


import SwiftUI

struct PermView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                Text("Cyclear Permissions")
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                    .padding(.top, 5)

                Spacer()
                
            }

            Divider()
                .padding(.bottom)

            Spacer()

            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 20) {
                    Image(systemName: "externaldrive")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                    Text("Full Disk Access permission to find and delete files in system paths")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }

                HStack(alignment: .top, spacing: 20) {
                    Image(systemName: "accessibility")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                    Text("Accessibility permission to delete files via Finder")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }

                HStack(alignment: .top, spacing: 20) {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                    Text("Add Cyclear in both Privacy panes via the + or by dragging the app over the pane. If the app is already pre-populated in the list, just toggle On if neeeded. Restart app when both permissions are granted")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    relaunchApp(afterDelay: 1)
                }) {
                    Text("Restart")
                }
                .buttonStyle(SimpleButtonBrightStyle(icon: "arrow.uturn.left.circle", help: "Restart", color: .red))
                .padding()
                
                Button(action: {
                    if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Text("Full Disk Access")
                }
                .buttonStyle(SimpleButtonBrightStyle(icon: "externaldrive", help: "Full Disk", color: .accentColor))

                .padding()
                
                Button(action: {
                    if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Text("Accessibility")
                }
                .buttonStyle(SimpleButtonBrightStyle(icon: "accessibility", help: "Accessibility", color: .accentColor))
                .padding()
                

            }
            
            
        }
        .padding(EdgeInsets(top: -25, leading: 0, bottom: 25, trailing: 0))
        
        
        
    }
    
    
}


