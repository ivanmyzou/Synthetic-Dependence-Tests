
library(keras)
library(tensorflow)
library(fst)
library(data.table)
library(progress)
library(depstats)

sample_sizes <- c(30, 50, 100, 200, 300, 400)

image_model <- load_model_hdf5("3. Models/image.h5")
score_model <- load_model_hdf5("3. Models/score.h5")
combined_model <- load_model_tf("3. Models/score_image")


image_thresholds <- readRDS('4. Estimated Thresholds/image_thresholds.RDS')
score_thresholds <- readRDS('4. Estimated Thresholds/score_thresholds')
combined_thresholds <- readRDS('4. Estimated Thresholds/combined_thresholds')

other_thresholds <- readRDS('4. Estimated Thresholds/other_thresholds.RDS')


library(foreach)

##########
#dependent
# "Linear", "Diamond", "Triangle", "Crescent", "Points", "Expo-nential",
# "Circles", "Cross", "Wedge", "Cubic", "W-shape", "Parabola", "Two-parabola",
# "Sine", "Doppler", "Heavy-sine", "Heart", "Spiral", "Taegeuk", "Sam-taegeuk"

pb <- progress_bar$new(total = length(sample_sizes) * 3 * 20)

powers <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  df <- read.fst(sprintf("2. Testing/dependent tests/%s/deptest.fst", n))

  foreach(k = 1:20, .combine = 'rbind') %do% {

    d <- df[(1 + 1000 * (k - 1)):(1000 * k),]

    image_power <- mean(model_predict(image_model, 'image', d) > image_thresholds[sample_size == n, thres])
    pb$tick()
    score_power <- mean(model_predict(score_model, 'score', d) > score_thresholds[sample_size == n, thres])
    pb$tick()
    combined_power <- mean(model_predict(combined_model, 'combined', d) > combined_thresholds[sample_size == n, thres])
    pb$tick()

    otherpower <- foreach(i = 1:19, .combine = 'cbind') %do% {
      mean(d[,i] >= other_thresholds[sample_size == n, get(paste0('score',i))])
    }

    c(combined_power, score_power, image_power, otherpower)
  }
}

powers <- data.table(powers)

colnames(powers) <- c('combined', 'score', 'image', paste0('score', 1:19))

powers[, `:=`(sample_size = rep(sample_sizes, each = 20),
              scenario = rep(1:20, 6))]

powers %>% saveRDS('5. Powers/dep_powers.RDS')

dep_powers <- powers

#data written into the package
#usethis::use_data(dep_powers, overwrite=TRUE)

##########
#additional
# '1A', '1B', '2A', '2B', '3A', '3B', '4A', '4B',
# '5A', '5B', '6A', '6B', '7A', '7B'

pb <- progress_bar$new(total = length(sample_sizes) * 3 * 14)

powers <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  df <- cbind(read.fst(sprintf("2. Testing/additional tests/%s/add.fst", n)), n,
              read.fst(sprintf("2. Testing/additional tests/%s/add_image.fst", n)))

  foreach(k = 1:14, .combine = 'rbind') %do% {

    d <- df[(1 + 1000 * (k - 1)):(1000 * k),]

    image_power <- mean(model_predict(image_model, 'image', d) > image_thresholds[sample_size == n, thres])
    pb$tick()
    score_power <- mean(model_predict(score_model, 'score', d) > score_thresholds[sample_size == n, thres])
    pb$tick()
    combined_power <- mean(model_predict(combined_model, 'combined', d) > combined_thresholds[sample_size == n, thres])
    pb$tick()

    otherpower <- foreach(i = 1:19, .combine = 'cbind') %do% {
      mean(d[,i] >= other_thresholds[sample_size == n, get(paste0('score',i))])
    }

    c(combined_power, score_power, image_power, otherpower)
  }
}

powers <- data.table(powers)

colnames(powers) <- c('combined', 'score', 'image', paste0('score', 1:19))

powers[, `:=`(sample_size = rep(sample_sizes, each = 14),
              scenario = rep(1:14, 6))]

powers %>% saveRDS('5. Powers/add_powers.RDS')

add_powers <- powers

#data written into the package
#usethis::use_data(add_powers, overwrite=TRUE)

##########
#images
# 'Image 1', 'Image 2', 'Image 3', 'Image 4'

pb <- progress_bar$new(total = length(sample_sizes) * 3 * 4)

powers <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  df <- foreach(j = 1:4, .combine = 'rbind') %do% {
    cbind(read.fst(sprintf("2. Testing/image tests/%simage%sSCORE.fst", n, j)), n,
          read.fst(sprintf("2. Testing/image tests/%simage%sIMAGE.fst", n, j)))
  }

  foreach(k = 1:4, .combine = 'rbind') %do% {

    d <- df[(1 + 1000 * (k - 1)):(1000 * k),]

    image_power <- mean(model_predict(image_model, 'image', d) > image_thresholds[sample_size == n, thres])
    pb$tick()
    score_power <- mean(model_predict(score_model, 'score', d) > score_thresholds[sample_size == n, thres])
    pb$tick()
    combined_power <- mean(model_predict(combined_model, 'combined', d) > combined_thresholds[sample_size == n, thres])
    pb$tick()

    otherpower <- foreach(i = 1:19, .combine = 'cbind') %do% {
      mean(d[,i] >= other_thresholds[sample_size == n, get(paste0('score',i))])
    }

    c(combined_power, score_power, image_power, otherpower)
  }
}

powers <- data.table(powers)

colnames(powers) <- c('combined', 'score', 'image', paste0('score', 1:19))

powers[, `:=`(sample_size = rep(sample_sizes, each = 4),
              scenario = rep(1:4, 6))]

powers %>% saveRDS('5. Powers/image_powers.RDS')

image_powers <- powers

#data written into the package
#usethis::use_data(image_powers, overwrite=TRUE)

##########
#scribbles
# 'Scribble 1', 'Scribble 2', 'Scribble 3', 'Scribble 4', 'Scribble 5', 'Scribble 6'

pb <- progress_bar$new(total = length(sample_sizes) * 3 * 6)

powers <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  df <-  foreach(j = 1:6, .combine = 'rbind') %do% {
    cbind(read.fst(sprintf("2. Testing/scribble tests/%sscribble%sSCORE.fst", n, j)), n,
          read.fst(sprintf("2. Testing/scribble tests/%sscribble%sIMAGE.fst", n, j)))
  }

  foreach(k = 1:6, .combine = 'rbind') %do% {

    d <- df[(1 + 1000 * (k - 1)):(1000 * k),]

    image_power <- mean(model_predict(image_model, 'image', d) > image_thresholds[sample_size == n, thres])
    pb$tick()
    score_power <- mean(model_predict(score_model, 'score', d) > score_thresholds[sample_size == n, thres])
    pb$tick()
    combined_power <- mean(model_predict(combined_model, 'combined', d) > combined_thresholds[sample_size == n, thres])
    pb$tick()

    otherpower <- foreach(i = 1:19, .combine = 'cbind') %do% {
      mean(d[,i] >= other_thresholds[sample_size == n, get(paste0('score',i))])
    }

    c(combined_power, score_power, image_power, otherpower)
  }
}

powers <- data.table(powers)

colnames(powers) <- c('combined', 'score', 'image', paste0('score', 1:19))

powers[, `:=`(sample_size = rep(sample_sizes, each = 6),
              scenario = rep(1:6, 6))]

powers %>% saveRDS('5. Powers/scribble_powers.RDS')

scribble_powers <- powers

#data written into the package
#usethis::use_data(scribble_powers, overwrite=TRUE)

##########
#increasing noise
#Circles Cross Sine Spiral
#4 noise levels

pb <- progress_bar$new(total = length(sample_sizes) * 3 * 16)

powers <- foreach(n = sample_sizes, .combine = 'rbind') %do% {
  df <- cbind(read.fst(sprintf("2. Testing/noise tests/%s/noise.fst", n)), n,
              read.fst(sprintf("2. Testing/noise tests/%s/noise_image.fst", n)))

  foreach(k = 1:16, .combine = 'rbind') %do% {

    d <- df[(1 + 1000 * (k - 1)):(1000 * k),]

    image_power <- mean(model_predict(image_model, 'image', d) > image_thresholds[sample_size == n, thres])
    pb$tick()
    score_power <- mean(model_predict(score_model, 'score', d) > score_thresholds[sample_size == n, thres])
    pb$tick()
    combined_power <- mean(model_predict(combined_model, 'combined', d) > combined_thresholds[sample_size == n, thres])
    pb$tick()

    otherpower <- foreach(i = 1:19, .combine = 'cbind') %do% {
      mean(d[,i] >= other_thresholds[sample_size == n, get(paste0('score',i))])
    }

    c(combined_power, score_power, image_power, otherpower)
  }
}

powers <- data.table(powers)

colnames(powers) <- c('combined', 'score', 'image', paste0('score', 1:19))

powers[, `:=`(sample_size = rep(sample_sizes, each = 16),
              scenario = rep(1:16, 6))]

powers %>% saveRDS('5. Powers/increasingnoise_powers.RDS')

increasingnoise_powers <- powers

#data written into the package
#usethis::use_data(increasingnoise_powers, overwrite=TRUE)
