df = read.csv("USA_Housing.csv", header=T)
plot(df$Area.Population, df$Price)
lmfit(Price~Area,Population, df)
set.seed(101)
sample <- sample.int(n = nrow(df), size = floor(.75*nrow(df)), replace = F)
train <- df[sample, ]
test <- df[-sample, ]
pred = predict.lm(lmfit, test)
rmse = (1-sqrt(mean((pred-df$Price)/df$Price)^2))*100
print(rmse)