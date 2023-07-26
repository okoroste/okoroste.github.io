community<- c("A", "A", "A", "A", "A", "B", "B", "B", "B", "B", "C",
              "C", "C", "C", "C")
BMI<- c(29.3, 31.4, 38.7, 33.2, 30.3, 42.0, 39.9, 44.5, 40.7, 38.9,
        28.8, 36.1, 37.5, 31.0, 33.2)

summary(model<- aov(BMI~community))

TukeyHSD(model)

