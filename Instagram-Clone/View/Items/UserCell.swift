//
//  UserCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .symbolVariant(.circle)
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("User01").font(.system(size: 14, weight: .semibold))
                Text("User test").font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
