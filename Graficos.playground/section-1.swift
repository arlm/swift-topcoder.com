import UIKit

var j = 2

for var i = 0; i < 5; i++ {
     j +=  j  * i
}
j

let sineArraySize = 64

let frequency1 = 4.0
let phase1 = 0.0
let amplitude1 = 2.0
let sineWave = (0..<sineArraySize).map {
    amplitude1 * sin(2.0 * M_PI / Double(sineArraySize) * Double($0) * frequency1 + phase1)
}

let frequency2 = 1.0
let phase2 = M_PI / 2.0
let amplitude2 = 1.0
let sineWave2 = (0..<sineArraySize).map {
    amplitude2 * sin(2.0 * M_PI / Double(sineArraySize) * Double($0) * frequency2 + phase2)
}

var combinedSineWave = [Double](count:sineArraySize, repeatedValue:0.0)
for currentIndex in 0..<sineArraySize {
    combinedSineWave[currentIndex] = sineWave[currentIndex] + sineWave2[currentIndex]
}

let combinedSineWave2 = sineWave + sineWave2

let testLabel = UILabel(frame: CGRectMake(0, 0, 220, 40))
testLabel.text = "Olá, Interopmix!"
testLabel.backgroundColor = UIColor(red: 0.9, green: 0.2, blue: 0.2, alpha: 1.0)
testLabel.textAlignment = NSTextAlignment.Center
testLabel.layer.masksToBounds = true
testLabel.layer.cornerRadius = 10

testLabel

let testArray = [0, 1, 2, 3, 4]
let odds = testArray.filter{$0 % 2 == 1}
odds
