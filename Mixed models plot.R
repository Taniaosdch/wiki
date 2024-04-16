library(tidyverse)

set.seed(123)

i <- 10
num_measurements <- 12
patient_ids <- paste0("Пацієнт", 1:i)

# Generate weight measurements for each patient
weight_data <- data.frame(Weight = c(sample(100:93, num_measurements, T),
                                     sample(90:95, num_measurements, T),
                                     sample(70:75, num_measurements, T),
                                     sample(110:105, num_measurements, T),
                                     sample(50:55, num_measurements, T),
                                     sample(40:45, num_measurements, T),
                                     sample(60:75, num_measurements, T),
                                     sample(130:120, num_measurements, T),
                                     sample(100:97, num_measurements, T),
                                     sample(60:50, num_measurements, T)),
                          Patient_ID = rep(patient_ids, each = num_measurements),
                          Measurement_ID = 1:num_measurements)


weight_data %>% ggplot() +
  geom_smooth(aes(x = as.factor(Measurement_ID), 
                  y = Weight,
                  group=Patient_ID,
                  color = Patient_ID), method = 'lm', se = F, size=.5) +
  geom_point(aes(x = as.factor(Measurement_ID), 
                 y = Weight,
                 group=Patient_ID,
                 color = Patient_ID)) +
  geom_smooth(aes(x = (Measurement_ID), 
                  y = Weight), 
              method = 'lm', 
              se = F, 
              size=1, 
              col='black', 
              linetype = "dashed") +
  labs(x = "Місяць", y = "Вага (кг)") + 
  geom_text(x = 5, y = 85, label = paste("Звичайна лінійна регресія"), fontface = "italic") +
  theme_classic() 

