import Cocoa
import CreateML



let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/kyle/Downloads/twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.5, seed: 1)

let classifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let eval = classifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let accuracy = (1 - eval.classificationError) * 100

let metadata = MLModelMetadata(author: "Kyle", shortDescription: "Twitter Classifier", version: "1.0")

try classifier.write(to: URL(fileURLWithPath: "/Users/kyle/Downloads/TweetClassifier.mlmodel"))




