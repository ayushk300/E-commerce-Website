import org.apache.spark.mllib.classification.{NaiveBayes, NaiveBayesModel}
import org.apache.spark.mllib.linalg.Vectors
import org.apache.spark.mllib.regression.LabeledPoint


//loading the file from loacl filesystem.
val data = sc.textFile("file:///root/Desktop/Churn2.csv")

//split the file using comma delimiter and store them.
val parsedData = data.map { line => val parts = line.split(',')
  LabeledPoint(parts(7).toDouble, Vectors.dense(parts(1).toDouble, parts(2).toDouble, parts(3).toDouble, parts(4).toDouble, parts(5).toDouble, parts(6).toDouble, parts(14).toDouble, parts(8).toDouble, parts(9).toDouble, parts(10).toDouble, parts(11).toDouble, parts(12).toDouble))
}

// Split data into training (60%) and test (40%).
val splits = parsedData.randomSplit(Array(0.6, 0.4), seed = 11L)
val training = splits(0)
val test = splits(1)

//training the model using train method with lamba which is the smoothing parameter and model type. here i used multinomial we can also use bernoulli
val model = NaiveBayes.train(training, lambda = 1.0, modelType = "multinomial")
// use the generated model and predict label(churn) for the respective feature
val predictionAndLabel = test.map(p => (model.predict(p.features), p.label))
//finding accuracy
val accuracy = 1.0 * predictionAndLabel.filter(x => x._1 == x._2).count() / test.count()

// Save and load model
model.save(sc, "file:///root/Desktop/NaiveBayesModel")
val sameModel = NaiveBayesModel.load(sc, "file:///root/Desktop/NaiveBayesModel")
