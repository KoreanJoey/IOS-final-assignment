//
//  ItemRow.swift
//  Application
//
//  Created by 조성하 on 30/4/2024.
//

import SwiftUI

struct ItemRow: View {
    var item : ListItem
    
    var body: some View {
        HStack {
            item.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack {
                Text(item.name)
                Text(item.expiredDate)
            }
            Spacer()
        }
    }
}

#Preview {
    Group {
        ItemRow(item: listitems[0])
        ItemRow(item: listitems[1])
    }
    
}
