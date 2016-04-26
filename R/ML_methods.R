#http://vitalflux.com/cheat-sheet-10-machine-learning-algorithms-r-commands/
dataset=iris
y=dataset$Sepal.Length
X=model.matrix(~Sepal.Width+Petal.Length+Petal.Width, data=dataset)
X.df=as.data.frame(X)
  
#Supervised
lm_model=lm(y~X, data=dataset)
summary(lm_model)

glm_model <- glm(y~X family=binomial(link="logit"), data=dataset)
summary(glm_model)

#Unsupervised
kmeans_model <- kmeans(x=X, centers=3)
summary(kmeans_model)

knn_model <- knn(train=X_train, test=X_test, cl=as.factor(labels), k=K)
summary(knn_model)

require("e1071")
naiveBayes_model <- naiveBayes(y~X, data=dataset)
summary(naiveBayes_model)

require("rpart")
dt_model <- rpart(y~X, data=dataset, method="class")
summary(dt_model)

require("e1071")
svm_model <- svm(x=X, y=as.factor(labels), kernel ="radial", cost=C)
summary(svm_model)

require("neuralnet")
ann_model <- neuralnet(y~X, data=X.df, hidden=1)
p <- compute(ann_model,dataset)#prediction
summary(ann_model)

require("arules")
apriori_model <- apriori(as.matrix(sampleDataset), parameter = list(supp = 0.8, conf = 0.9))
summary(apriori_model)

require("rpart")
boost_model <- ada(x=X, y=labels)
summary(boost_model)

#For most of the above formulas including linear regression model, one could use following function to predict:
predicted_values <- predict(some_model, newdata=as.data.frame(cbind(x1_test, x2_test)))