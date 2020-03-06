library(plyr)
#Create vector of all daily sentiment data frames
loopFile = paste0("_cs.Rda")
setwd("~/DScourseS20/TwitterProject/ProcessedTweets")
my_files <- list.files(pattern = loopFile)

#Initialize master data frame
fs <- data.frame(Month = integer(), 
                 Day = integer(), 
                 Candidate = character(),
                 Text = character(),
                 Sentiment = double())

#Combine all daily sentiment data frames into master data frame
for (i in my_files){
  load(i)
  fs <- rbind(fs, cs)
  rm(cs)
}

#Create summary statistics
fs$Abs_Sentiment = abs(fs$Sentiment)
avg_sentiment <- aggregate(fs[2:2], list(fs$Candidate, fs$Day, fs$Month), mean)
avg_sentiment <- plyr::rename(avg_sentiment, c("Group.1" = "Candidate", "Group.2" = "Day", "Group.3" = "Month"))

avg_abs_sentiment <- aggregate(fs[6:6], list(fs$Candidate, fs$Day, fs$Month), mean)
avg_abs_sentiment <- plyr::rename(avg_abs_sentiment, c("Group.1" = "Candidate", "Group.2" = "Day", "Group.3" = "Month"))

total_sentiment <- aggregate(fs[2:2], list(fs$Candidate, fs$Day, fs$Month), sum)
total_sentiment <- plyr::rename(total_sentiment, c("Group.1" = "Candidate", "Group.2" = "Day", "Group.3" = "Month"))

absolute_sentiment <- aggregate(fs[6:6], list(fs$Day, fs$Month, fs$Candidate), sum)
temp_sentiment <- aggregate(fs[6:6], list(fs$Day, fs$Month), sum)
absolute_sentiment <- merge(absolute_sentiment, temp_sentiment, by=c("Group.1","Group.2"))
absolute_sentiment$Percent_Sentiment = absolute_sentiment$Abs_Sentiment.x/absolute_sentiment$Abs_Sentiment.y
absolute_sentiment <- plyr::rename(absolute_sentiment, c("Group.1" = "Day", "Group.2" = "Month", "Group.3" = "Candidate"))

count_tweets <- as.data.frame(table(fs$Day, fs$Month, fs$Candidate))
temp_tweets <- as.data.frame(table(fs$Day, fs$Month))
count_tweets <- merge(count_tweets, temp_tweets, by=c("Var1","Var2"))
count_tweets$Percent_Tweets = count_tweets$Freq.x/count_tweets$Freq.y
count_tweets <- plyr::rename(count_tweets, c("Var1" = "Day", "Var2" = "Month", "Var3" = "Candidate"))
rm(fs, temp_sentiment, temp_tweets)

#Consolidate summary statistics

statistics <- merge(absolute_sentiment, total_sentiment, by=c("Day", "Month", "Candidate"))
statistics <- merge(statistics, count_tweets, by=c("Day", "Month", "Candidate"))
statistics <- merge(statistics, avg_sentiment, by=c("Day", "Month", "Candidate"))
statistics <- merge(statistics, avg_abs_sentiment, by=c("Day", "Month", "Candidate"))
statistics$Date = paste0(statistics$Month,"/",formatC(statistics$Day, width = 2, format ="d", flag = "0"),"/2020")
rm(absolute_sentiment, total_sentiment, count_tweets, avg_sentiment, avg_abs_sentiment)
statistics <- within(statistics, rm(Abs_Sentiment.y, Freq.y, Day, Month))
statistics <- plyr::rename(statistics, c("Abs_Sentiment.x" = "Total_Absolute_Sentiment",
                                   "Sentiment.x" = "Total_Sentiment",
                                   "Freq.x" = "Count_Tweets",
                                   "Sentiment.y" = "Average_Sentiment",
                                   "Abs_Sentiment" = "Average_Absolute_Sentiment"))

save(statistics, file = "statistics.Rda")

