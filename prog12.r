library(dplyr)
library(ggplot2)

df<-read.csv("C:/Users/dhruv/OneDrive/Desktop/Studies/SEM_5/R lab/data.csv")
#task01
str(df)
summary(df)

#task02
total_matches<-nrow(df)
unique_matches<-length(unique(c(df$team1,df$team2,df$winner)))

print(total_matches)
print(unique_matches)

#task03
matches_won_per_team<-table(df$winner)
avg_total_runs<-mean(as.numeric(df$win_by_runs,na.rm=TRUE))
total_wickets<-mean(as.numeric(df$win_by_wickets,na.rm=TRUE))

print(matches_won_per_team)
print(round(avg_total_runs,2))
print(round(total_wickets,2))

#task04

most_freq_venue<-names(sort(table(df$venue),decreasing=TRUE)[1])
print(most_freq_venue)
matches_won_data <- as.data.frame(matches_won_per_team)
matches_won_data$Team <- rownames(matches_won_data)
barplot(matches_won_per_team, main = "Number of Matches Won by Each Team",
        xlab = "Team", ylab = "Wins", col =rainbow(unique_matches))