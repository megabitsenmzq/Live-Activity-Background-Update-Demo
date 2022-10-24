//
//  TestAttributes.swift
//  LiveActivityBackgroundUpdateTest
//
//  Created by Jinyu Meng on 2022/10/24.
//

import ActivityKit

struct TestAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }
}
