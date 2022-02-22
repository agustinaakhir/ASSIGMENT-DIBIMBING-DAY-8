#Setup Library
list_library <- c('caret')
install.packages(list_library)
library(caret)

##Data Set
train <- read.csv("~/Assignment_Day8_Agustina Alhir/train.csv")
head((train))
View(train)
View((summary((train))

### Missing Value ####
colSums(is.na(train))
View(colSums(is.na(train)))


####Menhilaangkan kolom yang 60 persen mengandung missing value
train$FireplaceQu <- NULL
train$PoolQC <- NULL
train$Fence <- NULL
train$MiscFeature <- NULL
train$GarageQual <- NULL
train$GarageCond <- NULL
train$LotFrontAge <- NULL
View(colSums(is.na(train)))
View(train)

##### Find custom missing value
colSums(train == 'NULL')/100/91

##### Mengganti NA dengan 0
train[is.na(train$Alley),'Alley'] <- 0


#### fill missing value with 'Other'
train[is.na(train$BsmtQual),'BsmtQual'] <- 'other'
train[is.na(train$BsmtCond),' BsmtCond'] <- 'other'
train[is.na(train$BsmtExposure),'BsmtExposure'] <- 'other'
train[is.na(train$BsmtFinType1),'BsmtFinType1'] <- 'other'
train[is.na(train$BsmtFinType2),'BsmtFinType2'] <- 'other'
train[is.na(train$GarageType),'GarageType'] <- 'other'
train[is.na(train$GarageYrBlt),'GarageYrBlt'] <- 'other'
train[is.na(train$GarageFinish),'GarageFinish'] <- 'other'

#### Fill missing value with 'modus'
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(train$MasVnrType)
train[is.na(train$MasVnrType),'MasVnrType'] <- getmode(train$MasVnrType)


###Final Check  
View(colSums(is.na(train)))


#### Normalization / Standardization

###Normalization

std_scaler <- preProcess(train ['FullBath'],method = c('range'))
train['FullBath'] <- predict(std_scaler, train['FullBath'])


####Categorical Data Encoding

# One-hot Encoding #
table(train$SalePrice)

dummy <- dummyVars("~.",data=train['SalePrice'])
dummy_var <- data.frame(predict(dummy, newdata = train['SalePrice']))
View(dummy_var)

train <- cbind(train,dummy_var)
View(train)

#### Outlier Handling ####
SalePrice <- train$SalePrice
boxplot(SalePrice)

# IQR Method #

# get upper bound and lower bound

q1 <- quantile(SalePrice,0.25)
q3 <- quantile(SalePrice,0.75)

iqr <- q3 - q1

upper_bound <- q3 + 1.5 * iqr
lower_bound <- q1 - 1.5 * iqr

# filter 

train_iqr <- train[SalePrice > lower_bound & SalePrice < upper_bound,]
boxplot(train_iqr$SalePrice)

# Z-Distribution #

# get upper bound and lower bound
# alpha 5%

mean_SalePrice <- mean(SalePrice)
std_SalePrice <- sd(SalePrice)
alpha_var <- 0.05

lower_bound <- qnorm(alpha_var/2,mean=mean_SalePrice,sd = std_SalePrice)
upper_bound <- qnorm(1-alpha_var/2,mean=mean_SalePrice,sd = std_SalePrice)

train_zd5 <- train[SalePrice > lower_bound & SalePrice < upper_bound,]
boxplot(train_zd5$SalePrice)

#### Data Transformation ####
adr<- SalePrice
hist(adr)
hist(adr[adr < 1000000])

write.csv(train, file = "data_cleaning.csv")
