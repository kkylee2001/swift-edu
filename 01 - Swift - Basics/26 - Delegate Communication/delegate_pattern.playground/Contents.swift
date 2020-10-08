import UIKit


protocol delegate{
    func countEggs(hatched: Int, unhatched: Int)
}



class Bird{
    var delegate: delegate!
    
    var hatched = 0
    var unhatched = 0
    
    func hatchEggs(){
        self.hatched = 5
        self.unhatched = 1
        
        delegate.countEggs(hatched: hatched, unhatched: unhatched)
    }
    
    
}



let penguin = Bird()


struct birdDetector: delegate{
    func countEggs(hatched: Int, unhatched: Int) {
        print("The number of unhatched is \(unhatched) and the number of hatched is \(hatched)")
    }
    
    
    
}


penguin.delegate = birdDetector()
penguin.hatchEggs()
