import org.apache.spark.mllib.linalg.Vectors
import org.apache.spark.mllib.regression.LabeledPoint
import org.apache.spark.mllib.tree.DecisionTree
import org.apache.spark.mllib.tree.model.DecisionTreeModel
import org.apache.spark.mllib.util.MLUtils


// Load the file from local filesystem(use hdfs://PATH  to load the file from HDFS)

val data = sc.textFile("file:///home/cloudera/Desktop/new1")


val parsedData = data.map { line =>            // take each line from data at at ime
	val parts = line.split(',')                // split each line using ',' as the delimiter and store it as a array in the variable parts   
	LabeledPoint(parts(7).toDouble, Vectors.dense(parts(1).toDouble, parts(2).toDouble, parts(3).toDouble, parts(5).toDouble, parts(6).toDouble, parts(8).toDouble, parts(9).toDouble, parts(10).toDouble, parts(11).toDouble, parts(13).toDouble, parts(15).toDouble))
}   // 8th columnn in the data is CHURN which is passed as LABEL for each Vector , first seven columns are used as features on which CHURN depends 

val splits = parsedData.randomSplit(Array(0.7, 0.3))  // Split the available data into training set(70%) and testing set(30%)

val training = splits(0)
val test = splits(1)

val numClasses = 2   // num of classes that labels need to be divided into
val categoricalFeaturesInfo = Map[Int, Int]() // details of any categorical features else all features are considered continuous
val impurity = "gini" 
val maxDepth = 7   // Depth of the tree after which further construction of nodes will stop
val maxBins = 32   // Bins into which data needs to be partitioned 

val model = DecisionTree.trainClassifier(training, numClasses, categoricalFeaturesInfo, impurity, maxDepth, maxBins)  // train the model over training data

val pred = test.map { point =>                           // for each abeled point in test data 
	val prediction = model.predict(point.features)       // use the generated model and predict label(churn) for the respective features
	(point.label, prediction)                            // store original label(churn) and predicted churn for each tuple of test set in the variable pred
}

val testErr = pred.filter(r => r._1 != r._2).count.toDouble / test.count()   // calculate the error in prediction

println("ERROR = " + testErr)
