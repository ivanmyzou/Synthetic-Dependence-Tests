
library(dplyr)
library(data.table)
library(ggplot2)
library(depstats)

sample_size <- c(30, 50, 100, 200, 300, 400)


#####
# legend

legend_data <- data.table(model = rep(c("combined", "score", "image", "others"), each = 2),
                          y = rep(c(3,2,1,0), each = 2), x = rep(c(0,1), 4))

ggplot(legend_data, aes(y = y, x = x, color = model)) +
  geom_line(size = 1) +
  theme_void() + ylim(-2, 6) + xlim(-3, 2) +
  theme(legend.position="none") +
  scale_color_manual(values = c("combined" = "royalblue2",
                                "score" = "salmon2",
                                "image" = "green3")) +
  annotate(geom="text", x=0, y=4.5, label="Legend", size = 7.5) +
  annotate(geom="text", x=-1, y=3, label="Combined Model", size = 4) +
  annotate(geom="text", x=-1, y=2, label="Score Model", size = 4) +
  annotate(geom="text", x=-1, y=1, label="Image Model", size = 4) +
  annotate(geom="text", x=-1, y=0, label="Others", size = 4)

#####
# add
powers <- readRDS('5_Powers/add_powers.RDS') %>% as.data.table

titles <- paste0(rep(1:7, each = 2), c('A', 'B'))

for (i in 1:14){
  print(plotpowers(powers[scenario == i, ], titles[i]))
}

#####
# dep
powers <- readRDS('5_Powers/dep_powers.RDS') %>% as.data.table

titles <- c("Linear", "Diamond", "Triangle", "Crescent", "Points", "Exponential",
            "Circles", "Cross", "Wedge", "Cubic", "W-shape", "Parabola", "Two-parabola",
            "Sine", "Doppler", "Heavy-sine", "Heart", "Spiral", "Taegeuk", "Samtaegeuk")

for (i in 1:20){
  print(plotpowers(powers[scenario == i, ], titles[i]))
}

#####
# image
powers <- readRDS('5_Powers/image_powers.RDS')

titles <- paste0('Image ', 1:4)

for (i in 1:4){
  print(plotpowers(powers[scenario == i, ], titles[i]))
}

#####
# scribble
powers <- readRDS('5_Powers/scribble_powers.RDS')

titles <- paste0('Scribble ', 1:6)

for (i in 1:6){
  print(plotpowers(powers[scenario == i, ], titles[i]))
}

#####
#INC

powers <- readRDS('5_Powers/increasingnoise_powers.RDS')


#Circles
titles <- paste0('Circles Noise Level ', 1:4)

for (i in 1:4){
  print(plotpowers(powers[scenario == i, ], titles[i]))
}

#Cross
titles <- paste0('Cross: noise level ', 1:4)

for (i in 1:4){
  print(plotpowers(powers[scenario == i + 4, ], titles[i]))
}

#Sine
titles <- paste0('Sine: noise level ', 1:4)

for (i in 1:4){
  print(plotpowers(powers[scenario == i + 8, ], titles[i]))
}

#Spiral
titles <- paste0('Spiral: noise level ', 1:4)

for (i in 1:4){
  print(plotpowers(powers[scenario == i + 12, ], titles[i]))
}

