load("~/DScourseS20/TwitterProject/Candidates.Rda")
library(tidyverse)
library(sentimentr)

#Set date range of files to clean
startYear = "2020"
startMonth = "03"
startDay = 05
endDay = 05

for (j in startDay:endDay) {
  loopDate = paste0(startYear,"-",startMonth,"-",formatC(j, width = 2, format ="d", flag = "0"))
  setwd("~/DScourseS20/TwitterProject/RawTweets")
  loopFile = paste0(loopDate,".Rda")
  my_files <- list.files(pattern = loopFile)
  for (k in my_files){
    load(k)
    for (row in 1:nrow(tweets)){
      if(startsWith(k, as.character(tweets$tag[row]))){
        print(tweets$candidate[row])
        temp_df <- sentiment(get_sentences(c(candidate_tweets$text)))
        temp_df <- aggregate(sentiment ~ element_id, temp_df, sum)
        output_df <- merge(candidate_tweets$text,temp_df$sentiment,by="row.names")
        output_df <- within(output_df, rm("Row.names"))
        output_df <- rename(output_df,"Text" = x,"Sentiment" = y)
        save(output_df, file = paste0(tweets$tag[row],"_",loopDate,"_sentiment.Rda")) 
        rm(candidate_tweets, temp_df, output_df)
      }
    }
  }
}