library('caret')
library('corrplot')

if (!file.exists('uscrime.txt')) {
    download.file('http://www.statsci.org/data/general/uscrime.txt', destfile = 'uscrime.txt')
}

q5_data <- read.table('uscrime.txt', header = TRUE)

q5_data$So <- as.factor(q5_data$So)

data.predictors <- q5_data[,-16]

#data.scaled <- scale(as.matrix(q5_data[,]))

nzv <- nearZeroVar(data.predictors, saveMetrics = TRUE)
# No predictors with near zero variance. Good.

pairs(data.predictors)

# Possible colinearity:
# Po1 and Po2
# Ed and Wealth
# Wealth and Ineq
# Po1 and Wealth
# Po2 and Wealth

correlations <- cor(data.predictors[,-2])

corrplot(correlations, order = c('hclust'))
