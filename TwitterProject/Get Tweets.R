#Initialize libraries
library(rtweet)

#Set date range from target start date to date after target end date
dateStart = "2020-03-04"
dateEnd = "2020-03-05"

sanders_query = paste0("@BernieSanders -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
sanders_tweets <- search_tweets(sanders_query, n = 100000, retryonratelimit = TRUE)
save(sanders_tweets,file=paste0("TwitterProject/RawTweets/sanders_",dateStart,".Rda"))

biden_query = paste0("@JoeBiden -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
biden_tweets <- search_tweets(biden_query, n = 100000, retryonratelimit = TRUE)
save(biden_tweets,file=paste0("TwitterProject/RawTweets/biden_",dateStart,".Rda"))

#Dropped out 3/5/20
#warren_query = paste0("@ewarren -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#warren_tweets <- search_tweets(warren_query, n = 100000, retryonratelimit = TRUE)
#save(warren_tweets,file=paste0("TwitterProject/RawTweets/warren_",dateStart,".Rda"))

#Dropped out 3/1/20
#buttigieg_query = paste0("@PeteButtigieg -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#buttigieg_tweets <- search_tweets(buttigieg_query, n = 100000, retryonratelimit = TRUE)
#save(buttigieg_tweets,file=paste0("TwitterProject/RawTweets/buttigieg_",dateStart,".Rda"))

#Dropped out 3/2/20
#klobuchar_query = paste0("@amyklobuchar -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#klobuchar_tweets <- search_tweets(klobuchar_query, n = 100000, retryonratelimit = TRUE)
#save(klobuchar_tweets,file=paste0("TwitterProject/RawTweets/klobuchar_",dateStart,".Rda"))

#Dropped out 3/4/20
#bloomberg_query = paste0("@MikeBloomberg -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#bloomberg_tweets <- search_tweets(bloomberg_query, n = 100000, retryonratelimit = TRUE)
#save(bloomberg_tweets,file=paste0("TwitterProject/RawTweets/bloomberg_",dateStart,".Rda"))

#Dropped out 2/29/20
#steyer_query = paste0("@TomSteyer -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#steyer_tweets <- search_tweets(steyer_query, n = 100000, retryonratelimit = TRUE)
#save(steyer_tweets,file=paste0("TwitterProject/RawTweets/steyer_",dateStart,".Rda"))

#Dropped out 2/11/20
#yang_query = paste0("@AndrewYang -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#yang_tweets <- search_tweets(yang_query, n = 100000, retryonratelimit = TRUE)
#save(yang_tweets,file=paste0("TwitterProject/RawTweets/yang_",dateStart,".Rda"))

rm(list = ls())

