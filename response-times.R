# responseTimes<-read.table("response-times.csv",
#                           header=TRUE,
#                           colClasses=c('numeric','integer','factor','factor','factor','factor','factor','logical','integer','integer'),
#                           sep=","
# )

# png(width=1200,height=900,filename="response-times.png")
colors <- c("dodgerblue3","tomato3","tomato4")
names(colors) <- c("200", "503")

plot((responseTimes$timeStamp-min(responseTimes$timeStamp))/1000/60,
     responseTimes$Latency,
     main="Response Codes over Time",
     xlab="Test time [min]",
     ylab="Latency [ms]",
     col=colors[responseTimes$responseCode],
     pch=18
)
legend(0,2500,c("200", "503") ,col=c("dodgerblue3","tomato3"),yjust=0.5,pch=18)
