library(rtweet)
#Load Candidates
load("~/DScourseS20/TwitterProject/Candidates.Rda")

#Set date range from target start date to date after target end date
dateStart = as.Date("2020-03-29")
dateEnd = as.Date("2020-03-30")

for (row in 1:nrow(tweets)){
  if(tweets$dropout[row] > dateStart){
    candidate_query = paste0(tweets$handle[row]," -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
    candidate_tweets <- search_tweets(candidate_query, n = 100000, retryonratelimit = TRUE)
    save(candidate_tweets,file=paste0("~/DScourseS20/TwitterProject/RawTweets/",tweets$tag[row],"_",dateStart,".Rda"))
  }
}
