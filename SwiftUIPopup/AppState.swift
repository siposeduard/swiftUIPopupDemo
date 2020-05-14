//
//  AppState.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import Combine

class AppState: ObservableObject {
    
    var showPopup = PassthroughSubject<PopupIntent, Never>()

    var dismissPopup = PassthroughSubject<Bool, Never>()
    
    var popupStack: Stack<PopupIntent> = Stack()
}

enum PopupIntent {
    case somepopup
    case someFullScreenPopup(text: String)
}

struct Stack<Element> {
    fileprivate var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }
}
