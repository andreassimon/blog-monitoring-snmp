responseTimes<-read.table("response-times.csv",
                          header=TRUE,
                          colClasses=c('numeric','integer','factor','factor','factor','factor','factor','logical','integer','integer'),
                          sep=","
)
snmps<-read.table("snmp.csv",
                  header=FALSE,
                  col.names=c('host','timestamp','valueType','value'),
                  colClasses=c('factor','numeric','factor','character'),
                  sep=","
)

png(width=1200, height=900, filename="response-times-vs-snmp.png")
par(mfrow=c(2,1))

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

legend(0, 2500,
       c("200", "503"),
       col=c("dodgerblue3","tomato3"),
       yjust=0.5,
       pch=18
)

ssCpuUser<-snmps[ snmps$valueType == 'ssCpuUser', ]
plot((ssCpuUser$timestamp-min(ssCpuUser$timestamp))/1000/60,
     ssCpuUser$value,
     type='o',
     main=expression(bold(paste(ssCpuUser, ", ", 1-textstyle(frac(memAvailReal, memTotalReal))))),
     xlab="Test time [min]",
     ylab="Utilization [%]",
     ylim=c(0,100),
     col="purple",
     pch=18
)

timestamps<-snmps[ snmps$valueType == 'memTotalReal', ]$timestamp
memTotalReal<-as.numeric(sub("([0-9]+) kB", "\\1", snmps[ snmps$valueType == 'memTotalReal', ]$value))
memAvailReal<-as.numeric(sub("([0-9]+) kB", "\\1", snmps[ snmps$valueType == 'memAvailReal', ]$value))
reservedMem<-1-memAvailReal/memTotalReal

lines((timestamps-min(timestamps))/1000/60,
      reservedMem*100,
      type='o',
      ylim=c(0,100),
      col="orange",
      pch=18
)
legend(0, 20,
       c("ssCpuUser", expression(1-textstyle(frac(memAvailReal, memTotalReal)))),
       col=c("purple", "orange"),
       yjust=0.5,
       pch=18
)
dev.off()
