#Set date range of files to clean
startYear = "2020"
startMonth = 03
startDay = 01
endDay = 04

for (j in startDay:endDay) {
  cs <- data.frame(Month = integer(), 
                   Day = integer(), 
                   Candidate = character(),
                   Text = character(),
                   Sentiment = double())
  
  loopDate = paste0(startYear,"-",
                    formatC(startMonth, width = 2, format ="d", flag = "0"),"-",
                    formatC(j, width = 2, format ="d", flag = "0"))
  
  setwd("~/DScourseS20/TwitterProject/ProcessedTweets")
  loopFile = paste0(loopDate,"_sentiment.Rda")
  my_files <- list.files(pattern = loopFile)
  my_data <- lapply(my_files, load, .GlobalEnv)
  
  if(exists("sanders_output_df")){
    sanders_output_df$Month = startMonth
    sanders_output_df$Day = j
    sanders_output_df$Candidate = "sanders"
    cs <- rbind(cs, sanders_output_df)
    rm(sanders_output_df)
  }
  
  if(exists("biden_output_df")){
    biden_output_df$Month = startMonth
    biden_output_df$Day = j
    biden_output_df$Candidate = "biden"
    cs <- rbind(cs, biden_output_df)
    rm(biden_output_df)
  }
  
  if(exists("warren_output_df")){
    warren_output_df$Month = startMonth
    warren_output_df$Day = j
    warren_output_df$Candidate = "warren"
    cs <- rbind(cs, warren_output_df)
    rm(warren_output_df)
  }
  
  if(exists("buttigieg_output_df")){
    buttigieg_output_df$Month = startMonth
    buttigieg_output_df$Day = j
    buttigieg_output_df$Candidate = "buttigieg"
    cs <- rbind(cs, buttigieg_output_df)
    rm(buttigieg_output_df)
  }
  
  if(exists("klobuchar_output_df")){
    klobuchar_output_df$Month = startMonth
    klobuchar_output_df$Day = j
    klobuchar_output_df$Candidate = "klobuchar"
    cs <- rbind(cs, klobuchar_output_df)
    rm(klobuchar_output_df)
  }
  
  if(exists("bloomberg_output_df")){
    bloomberg_output_df$Month = startMonth
    bloomberg_output_df$Day = j
    bloomberg_output_df$Candidate = "bloomberg"
    cs <- rbind(cs, bloomberg_output_df)
    rm(bloomberg_output_df)
  }
  
  if(exists("steyer_output_df")){
    steyer_output_df$Month = startMonth
    steyer_output_df$Day = j
    steyer_output_df$Candidate = "steyer"
    cs <- rbind(cs, steyer_output_df)
    rm(steyer_output_df)
  }
  
  if(exists("yang_output_df")){
    yang_output_df$Month = startMonth
    yang_output_df$Day = j
    yang_output_df$Candidate = "yang"
    cs <- rbind(cs, yang_output_df)
    rm(yang_output_df)
  }
  save(cs, file = paste0("~/DScourseS20/TwitterProject/ProcessedTweets/",loopDate,"_cs.Rda"))
  rm(cs)
}
  