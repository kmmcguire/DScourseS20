#Download FiveThirtyEight polling average file
download.file("https://projects.fivethirtyeight.com/2020-primary-data/pres_primary_avgs_2020.csv",
              "538_avg.csv")

poll_avg = read.csv("538_avg.csv")

#Filter state polling averages
poll_avg_nat = poll_avg[ which (poll_avg$state == "National" 
                                & as.Date(poll_avg$modeldate,"%m/%d/%Y") >= as.Date("2/4/2020","%m/%d/%Y")),]

poll_avg_state = poll_avg[ which (poll_avg$state != "National"
                                  & as.Date(poll_avg$modeldate,"%m/%d/%Y") >= as.Date("2/4/2020","%m/%d/%Y")),]
rm(poll_avg)

save(poll_avg_nat, file="poll_avg_nat.Rda")
save(poll_avg_state, file="poll_avg_state.Rda")

rm(poll_avg_nat)
rm(poll_avg_state)



