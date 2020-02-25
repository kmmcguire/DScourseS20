rm(list = ls())
#Initialize libraries and API Keys
library(rtweet)
token <- create_token(
  app = "Sentiment Analysis OU",
  consumer_key = "u3RQAeo8kB9OCXE2n84UoLCTd",
  consumer_secret = "xb815Auhi5k2Zy6zu5Hx5bAt6EKMJ5j8jcEsxEokEGjMfeGzxF",
  access_token = "815792344901554176-ao9zGNzbpkX1BbeBZ5ofKZ4kspjrQEe",
  access_secret = "5u4ceFwlq7ibpBZLR7PeRVyjW5dL4vHbnGxU2FXpGB2Oi"
)

#Set date range from target start date to date after target end date
dateStart = "2020-02-22"
dateEnd = "2020-02-23"

sanders_query = paste0("@BernieSanders -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
sanders_tweets <- search_tweets(sanders_query, n = 100000, retryonratelimit = TRUE)
save(sanders_tweets,file=paste0("sanders_",dateStart,".Rda"))

biden_query = paste0("@JoeBiden -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
biden_tweets <- search_tweets(biden_query, n = 100000, retryonratelimit = TRUE)
save(biden_tweets,file=paste0("biden_",dateStart,".Rda"))

warren_query = paste0("@ewarren -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
warren_tweets <- search_tweets(warren_query, n = 100000, retryonratelimit = TRUE)
save(warren_tweets,file=paste0("warren_",dateStart,".Rda"))

buttigieg_query = paste0("@PeteButtigieg -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
buttigieg_tweets <- search_tweets(buttigieg_query, n = 100000, retryonratelimit = TRUE)
save(buttigieg_tweets,file=paste0("buttigieg_",dateStart,".Rda"))

klobuchar_query = paste0("@amyklobuchar -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
klobuchar_tweets <- search_tweets(klobuchar_query, n = 100000, retryonratelimit = TRUE)
save(klobuchar_tweets,file=paste0("klobuchar_",dateStart,".Rda"))

bloomberg_query = paste0("@MikeBloomberg -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
bloomberg_tweets <- search_tweets(bloomberg_query, n = 100000, retryonratelimit = TRUE)
save(bloomberg_tweets,file=paste0("bloomberg_",dateStart,".Rda"))

steyer_query = paste0("@TomSteyer -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
steyer_tweets <- search_tweets(steyer_query, n = 100000, retryonratelimit = TRUE)
save(steyer_tweets,file=paste0("steyer_",dateStart,".Rda"))

#Dropped out 2/11/20
#yang_query = paste0("@AndrewYang -filter:retweets -filter:replies since:",dateStart," until:",dateEnd)
#yang_tweets <- search_tweets(yang_query, n = 100000, retryonratelimit = TRUE)
#save(yang_tweets,file=paste0("yang_",dateStart,".Rda"))

rm(list = ls())

