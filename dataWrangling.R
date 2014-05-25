stormData <- read.csv("data/repdata-data-StormData.csv.bz2")
summary(stormData$FATALITIES)
summary(stormData$INJURIES)
summary(stormData$PROPDMG)
harmfulEvents <-aggregate(FATALITIES+INJURIES ~ EVTYPE, data=stormData, FUN=sum)
colnames(harmfulEvents) <- c("EventType","Sum")
harmfulEvents.summary <-head(harmfulEvents[order(-harmfulEvents$Sum),],10)
print(harmfulEvents.summary)
barplot(harmfulEvents.summary,names.arg=harmfulEvents.summary,main='Sum of deaths and injuries in US',ylab='Event',xlab='Sum of deaths and injuries')

ggplot(data=harmfulEvents.summary, aes(x=EventType, y=Sum, fill=EventType)) + geom_bar(stat="identity") + ylab("Sum of deaths and injuries") + xlab("Event") +
  ggtitle("Most harmful events in the US")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))


harmfulEventsDamage <-aggregate(PROPDMG ~ EVTYPE, data=stormData, FUN=sum)
colnames(harmfulEventsDamage) <- c("EventType","SumOfDamage")
harmfulEventsDamage.summary <-head(harmfulEventsDamage[order(-harmfulEventsDamage$SumOfDamage),],10)
print(harmfulEventsDamage.summary)
ggplot(data=harmfulEventsDamage.summary, aes(x=EventType, y=SumOfDamage, fill=EventType)) + geom_bar(stat="identity") + ylab("Sum of property damage in $ million") + xlab("Event") +
  ggtitle("Greatest economic consequences of events")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))