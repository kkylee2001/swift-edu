//MARK: - The Goal
//Create a function that adds the prevoius two numbers together
let example = [0,1,1,2,3,5]

func fibonacci(_ places: Int) -> [Int] {
    var array = [0,1]
    if places <= 0 || places == 1{
        return [0]
    }else if places == 2{
        return array
    }else{
        for i in 0...(places-3){
            let n3 = array[i] + array[i+1]
            array.append(n3)
        }
        return array}}








print(fibonacci(10))
