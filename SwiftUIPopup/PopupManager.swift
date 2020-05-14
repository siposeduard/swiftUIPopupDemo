//
//  AppState.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI
import UIKit
import Combine

class PopupManager: ObservableObject {
    
    var showPopup = PassthroughSubject<PopupIntent, Never>()

    var dismissPopup = PassthroughSubject<Bool, Never>()
    
//    explicare de ce am folosit stack
    var popupStack: Stack<PopupIntent> = Stack()
    
    
    private var popupSink: AnyCancellable? = nil
    private var dismissSink: AnyCancellable? = nil
    private var topControllerProvide: (() -> UIViewController?)?
    
    init(topControllerProvide: (() -> UIViewController?)?) {
        popupSink = showPopup.sink(receiveValue: { intent in
            var vc: UIViewController
            
            switch intent {
            case .somepopup:
                let view = Somepopup().environmentObject(self)
                vc = UIHostingController(rootView: view)
                vc.modalPresentationStyle = .overCurrentContext
            case let .someFullScreenPopup(text):
                let view = SomeFullScreenPopup(text: text).environmentObject(self)
                vc = UIHostingController(rootView: view)
                vc.modalPresentationStyle = .fullScreen
            }
            
            self.popupStack.push(intent)
            
            vc.view.backgroundColor = .clear
            topControllerProvide?()?.present(vc, animated: true, completion: nil)
        })
        
        dismissSink = dismissPopup.sink(receiveValue: { _ in
            switch self.popupStack.peek() {
            case .somepopup:
                ///here can be added some extra animations
                //some extra exemple
                topControllerProvide?()?.dismiss(animated: true, completion: nil)
            case .someFullScreenPopup:
                ///here can be added some extra animations
                topControllerProvide?()?.dismiss(animated: true, completion: nil)
            default:
                ///here is the default animation
                topControllerProvide?()?.dismiss(animated: true, completion: nil)
            }
            
            let intent = self.popupStack.pop()
            print("Popup event: dismissed popup from intent: \(String(describing: intent))")
        })
    }
}

enum PopupIntent {
    case somepopup
    case someFullScreenPopup(text: String)
}

//mutare in alt fisier
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
