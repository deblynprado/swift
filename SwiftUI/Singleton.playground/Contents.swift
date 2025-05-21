class SomeClass {
    @MainActor static let shared: SomeClass = SomeClass()
    
    private init() {
        
    }
    
    func something() {
        
    }
}


// Singleton
SomeClass.shared.something()
