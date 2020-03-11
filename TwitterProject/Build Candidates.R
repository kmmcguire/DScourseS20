candidate <- c('Bernie Sanders', 
               'Joe Biden', 
               'Elizabeth Warren', 
               'Amy Klobuchar',
               'Pete Buttigieg',
               'Mike Bloomberg',
               'Tom Steyer',
               'Andrew Yang')

tag <- c('sanders',
         'biden',
         'warren',
         'klobuchar',
         'buttigieg',
         'bloomberg',
         'steyer',
         'yang')

handle <- c('@BernieSanders',
            '@JoeBiden',
            '@ewarren',
            '@PeteButtigieg',
            '@amyklobuchar',
            '@MikeBloomberg',
            '@TomSteyer',
            '@AndrewYang')

dropout <- as.Date(c('2021-01-01', #Bernie Sanders
                     '2021-01-01', #Joe Biden
                     '2020-03-05', #Elizabeth Warren
                     '2020-03-01', #Pete Buttigieg
                     '2020-03-02', #Amy Klobuchar
                     '2020-03-04', #Mike Bloomburg
                     '2020-02-29', #Tom Steyer
                     '2020-02-11'))#Andrew Yang

notes <- c('', #Bernie Sanders
           '', #Joe Biden
           '', #Elizabeth Warren
           '', #Pete Buttigieg
           '', #Amy Klobuchar
           '', #Mike Bloomburg
           '', #Tom Steyer
           '') #Andrew Yang

tweets <- data.frame(candidate, tag, handle, dropout, notes) 
save(tweets,file="~/DScourseS20/TwitterProject/Candidates.Rda")

