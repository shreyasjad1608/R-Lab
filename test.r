library(dplyr)
library(ggplot2)

data<-read.csv("C:/Users/dhruv/OneDrive/Desktop/Studies/SEM_5/R lab/data.csv")

str(data)
summary(data)

total_matches<-nrow(data)
unique_matches<-(unique(c(data$team1,data$team2,data$winner)))

print(total_matches)
print(length(unique_matches))

matches_won_per_team<-table(data$winner)
print(matches_won_per_team)

avg_wickets<-round(mean(as.integer(data$win_by_wickets)),2)
avg_runs<-round(mean(as.integer(data$win_by_runs)),2)

print(avg_wickets)
print(avg_runs)

venue<-names(sort(table(data$venue),decreasing = TRUE)[1])
print(venue)

matches_won<-as.data.frame(matches_won_per_team)
print(matches_won)
matches_won$data<-rownames(matches_won)
print(matches_won)

bar<-ggplot(matches_won,aes(x=unique_matches,y=Freq,fill=unique_matches))+geom_bar(stat = "identity")+labs(title="bar plot")
print(bar)

