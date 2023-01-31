
library(keras)
library(tensorflow)
library(fst)
library(data.table)
library(progress)
library(depstats)

sample_sizes <- c(30, 50, 100, 200, 300, 400)

#Thresholds for models
image_model <- load_model_hdf5("3_Models/image.h5")
score_model <- load_model_hdf5("3_Models/score.h5")
combined_model <- load_model_tf("3_Models/score_image")

image_thresholds <- data.table(sample_size = sample_sizes)
score_thresholds <- data.table(sample_size = sample_sizes)
combined_thresholds <- data.table(sample_size = sample_sizes)

pb <- progress_bar$new(total = length(sample_sizes) * 3)

#compute 95% quantiles
for (n in sample_sizes) {
  d <- cbind(read.fst(sprintf("1_Threshold/threshold/%s/thres.fst", n)), n,
             read.fst(sprintf("1_Threshold/threshold/%s/thres_image.fst", n)))

  image_thresholds[sample_size == n,
                   thres := quantile(model_predict(image_model, 'image', d),
                                     0.95)]
  pb$tick()
  score_thresholds[sample_size == n,
                   thres := quantile(model_predict(score_model, 'score', d),
                                     0.95)]
  pb$tick()
  combined_thresholds[sample_size == n,
                      thres := quantile(model_predict(combined_model, 'combined', d),
                                        0.95)]
  pb$tick()
}

image_thresholds %>% saveRDS('4_Estimated Thresholds/image_thresholds.RDS')
score_thresholds %>% saveRDS('4_Estimated Thresholds/score_thresholds')
combined_thresholds %>% saveRDS('4_Estimated Thresholds/combined_thresholds')

#data written into the package
#usethis::use_data(image_thresholds, overwrite=TRUE)
#usethis::use_data(score_thresholds, overwrite=TRUE)
#usethis::use_data(combined_thresholds, overwrite=TRUE)

#Thresholds for other measures/tests
library(foreach)

other_thresholds <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  d <- cbind(read.fst(sprintf("1_Threshold/threshold/%s/thres.fst", n)))
  sapply(d[,1:19], function(x){quantile(x, 0.95)})
} %>% data.table

colnames(other_thresholds) <- paste0('score', 1:19)

other_thresholds[, sample_size := sample_sizes]

other_thresholds %>% saveRDS('4_Estimated Thresholds/other_thresholds.RDS')

#data written into the package
#usethis::use_data(other_thresholds, overwrite=TRUE)
