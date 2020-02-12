library(readr)
library(KernSmooth)

#load data
dataset<- read.csv("D:/kulina/Preliminary-Test-master/Statistics/dataset.csv", header = TRUE)

#set as data frame
dataset_frame<-data.frame(dataset)

histogram<-hist(dataset_frame$user_id, freq = FALSE, main="Histogram User Purchased")
lines(density(dataset_frame$user_id))#default kernel density estimation
summary(density(dataset_frame$user_id))
summary(dataset_frame$user_id)

#Choose optimum kernel bandwith
h_normal <-dpik(dataset_frame$user_id,kernel="normal")
est_normal <- bkde(dataset_frame$user_id,kernel="normal",bandwidth=h_normal)
h_box <- dpik(dataset_frame$user_id,kernel="box")
est_box <- bkde(dataset_frame$user_id,kernel="box",bandwidth=h_box)
h_epanech <-dpik(dataset_frame$user_id,kernel="epanech")
est_epanech <- bkde(dataset_frame$user_id,kernel="epanech",bandwidth=h_epanech)
h_biweight <- dpik(dataset_frame$user_id,kernel="biweight")
est_biweight <- bkde(dataset_frame$user_id,kernel="biweight",bandwidth=h_biweight)
h_triwight <-dpik(dataset_frame$user_id,kernel="triweight")
est_triwight <- bkde(dataset_frame$user_id,kernel="triweight",bandwidth=h_triwight)

#comparison --the highest bandwith make smooothest density graph
h_optimum <- cbind(h_normal,h_box,h_epanech,h_biweight,h_triwight)
h_optimum

#graph
win.graph()
hist(dataset_frame$user_id, freq=FALSE,main = "Smoothing with Kernels")
lines(est_normal, col='red') # density for normal kernel #show smoothest density graph
lines(est_triwight, col='yellow') # density for triangular kernel
lines(est_box, col='blue') # density for rectangular kernel
lines(est_epanech, col='gray') # density for epanechnikov kernel
lines(est_biweight, col='green') # density for biweight kernel
lines(density(dataset_frame$user_id))


#summary
summary(est_normal)
