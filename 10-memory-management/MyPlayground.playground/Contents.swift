import UIKit

class Parent {
    let name: String
    var son: Son?
    init(name: String) {
        self.name = name
        print("Parent is being initialized")
    }
    
    deinit {
        print("Parent is being deinitialized")
    }
}

class Son {
     weak var parent: Parent?
     init(parent: Parent) {
        self.parent = parent
        print("Son is being initialized")
    }
    
    deinit {
        print("Son is being deinitialized")
    }
}

do {
    let parent = Parent(name: "SomeName")
    let son = Son(parent: parent)
    parent.son = son
}


