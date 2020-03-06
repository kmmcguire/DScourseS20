library(tidyverse)
library(sentimentr)

#Set date range of files to clean
startYear = "2020"
startMonth = "03"
startDay = 01
endDay = 04

for (j in startDay:endDay) {
  loopDate = paste0(startYear,"-",startMonth,"-",formatC(j, width = 2, format ="d", flag = "0"))
  setwd("~/DScourseS20/TwitterProject/RawTweets")
  loopFile = paste0(loopDate,".Rda")
  my_files <- list.files(pattern = loopFile)
  my_data <- lapply(my_files, load, .GlobalEnv)
  
  setwd("~/DScourseS20/TwitterProject/ProcessedTweets")
  if(exists("sanders_tweets")){
    sanders_temp_df <- sentiment(get_sentences(c(sanders_tweets$text)))
    sanders_temp_df <- aggregate(sentiment ~ element_id, sanders_temp_df, sum)
    sanders_output_df <- merge(sanders_tweets$text,sanders_temp_df$sentiment,by="row.names")
    sanders_output_df <- within(sanders_output_df, rm("Row.names"))
    sanders_output_df <- rename(sanders_output_df,"Text" = x,"Sentiment" = y)
    save(sanders_output_df, file = paste0("sanders_",loopDate,"_sentiment.Rda")) 
    rm(sanders_tweets, sanders_temp_df, sanders_output_df)
  }
  
  if(exists("biden_tweets"))
  {
    biden_temp_df <- sentiment(get_sentences(c(biden_tweets$text)))
    biden_temp_df <- aggregate(sentiment ~ element_id, biden_temp_df, sum)
    biden_output_df <- merge(biden_tweets$text,biden_temp_df$sentiment,by="row.names")
    biden_output_df <- within(biden_output_df, rm("Row.names"))
    biden_output_df <- rename(biden_output_df,"Text" = x,"Sentiment" = y)
    save(biden_output_df, file = paste0("biden_",loopDate,"_sentiment.Rda")) 
    rm(biden_tweets, biden_temp_df, biden_output_df)
  }
  
  if(exists("warren_tweets")){
    warren_temp_df <- sentiment(get_sentences(c(warren_tweets$text)))
    warren_temp_df <- aggregate(sentiment ~ element_id, warren_temp_df, sum)
    warren_output_df <- merge(warren_tweets$text,warren_temp_df$sentiment,by="row.names")
    warren_output_df <- within(warren_output_df, rm("Row.names"))
    warren_output_df <- rename(warren_output_df,"Text" = x,"Sentiment" = y)
    save(warren_output_df, file = paste0("warren_",loopDate,"_sentiment.Rda")) 
    rm(warren_tweets, warren_temp_df, warren_output_df)
  }
  
  if(exists("buttigieg_tweets")){
    buttigieg_temp_df <- sentiment(get_sentences(c(buttigieg_tweets$text)))
    buttigieg_temp_df <- aggregate(sentiment ~ element_id, buttigieg_temp_df, sum)
    buttigieg_output_df <- merge(buttigieg_tweets$text,buttigieg_temp_df$sentiment,by="row.names")
    buttigieg_output_df <- within(buttigieg_output_df, rm("Row.names"))
    buttigieg_output_df <- rename(buttigieg_output_df,"Text" = x,"Sentiment" = y)
    save(buttigieg_output_df, file = paste0("buttigieg_",loopDate,"_sentiment.Rda")) 
    rm(buttigieg_tweets, buttigieg_temp_df, buttigieg_output_df)
  }
  
  if(exists("klobuchar_tweets"))
  {
    klobuchar_temp_df <- sentiment(get_sentences(c(klobuchar_tweets$text)))
    klobuchar_temp_df <- aggregate(sentiment ~ element_id, klobuchar_temp_df, sum)
    klobuchar_output_df <- merge(klobuchar_tweets$text,klobuchar_temp_df$sentiment,by="row.names")
    klobuchar_output_df <- within(klobuchar_output_df, rm("Row.names"))
    klobuchar_output_df <- rename(klobuchar_output_df,"Text" = x,"Sentiment" = y)
    save(klobuchar_output_df, file = paste0("klobuchar_",loopDate,"_sentiment.Rda")) 
    rm(klobuchar_tweets, klobuchar_temp_df, klobuchar_output_df)
  }
  
  if(exists("bloomberg_tweets")){
    bloomberg_temp_df <- sentiment(get_sentences(c(bloomberg_tweets$text)))
    bloomberg_temp_df <- aggregate(sentiment ~ element_id, bloomberg_temp_df, sum)
    bloomberg_output_df <- merge(bloomberg_tweets$text,bloomberg_temp_df$sentiment,by="row.names")
    bloomberg_output_df <- within(bloomberg_output_df, rm("Row.names"))
    bloomberg_output_df <- rename(bloomberg_output_df,"Text" = x,"Sentiment" = y)
    save(bloomberg_output_df, file = paste0("bloomberg_",loopDate,"_sentiment.Rda")) 
    rm(bloomberg_tweets, bloomberg_temp_df, bloomberg_output_df)
  }
  
  if(exists("steyer_tweets")){
    steyer_temp_df <- sentiment(get_sentences(c(steyer_tweets$text)))
    steyer_temp_df <- aggregate(sentiment ~ element_id, steyer_temp_df, sum)
    steyer_output_df <- merge(steyer_tweets$text,steyer_temp_df$sentiment,by="row.names")
    steyer_output_df <- within(steyer_output_df, rm("Row.names"))
    steyer_output_df <- rename(steyer_output_df,"Text" = x,"Sentiment" = y)
    save(steyer_output_df, file = paste0("steyer_",loopDate,"_sentiment.Rda")) 
    rm(steyer_tweets, steyer_temp_df, steyer_output_df)
  }
  
  if(exists("yang_tweets")){
    yang_temp_df <- sentiment(get_sentences(c(yang_tweets$text)))
    yang_temp_df <- aggregate(sentiment ~ element_id, yang_temp_df, sum)
    yang_output_df <- merge(yang_tweets$text,yang_temp_df$sentiment,by="row.names")
    yang_output_df <- within(yang_output_df, rm("Row.names"))
    yang_output_df <- rename(yang_output_df,"Text" = x,"Sentiment" = y)
    save(yang_output_df, file = paste0("yang_",loopDate,"_sentiment.Rda"))
    rm(yang_tweets, yang_temp_df, yang_output_df)
  }
}
