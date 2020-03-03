library(ggplot2)
library(ggthemes)

load("~/DScourseS20/TwitterProject/statistics.Rda")
load("~/DScourseS20/TwitterProject/poll_avg_nat.Rda")
load("~/DScourseS20/TwitterProject/poll_avg_state.Rda")

dev.off()

#Plot Percent Sentiment data
ggplot(data = statistics, 
       aes(x = as.Date(Date, "%m/%d/%Y"), 
           y = Percent_Sentiment, 
           group = Candidate, 
           color = Candidate)) +
  
        geom_line() +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Plot Average Sentiment data
ggplot(data = statistics, 
       aes(x = as.Date(Date, "%m/%d/%Y"), 
           y = Average_Sentiment, 
           group = Candidate, 
           color = Candidate)) +
  
  geom_line() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Plot FiveThirtyEight national polling average
ggplot(data = poll_avg_nat, 
       aes(x = as.Date(modeldate, "%m/%d/%Y"), 
           y = pct_estimate, 
           group = candidate_name, 
           color = candidate_name)) +
  
  geom_line() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))