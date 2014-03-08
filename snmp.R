snmps<-read.table("snmp.csv",
                  header=FALSE,
                  col.names=c('host','timestamp','valueType','value'),
                  colClasses=c('factor','numeric','factor','character'),
                  sep=","
)

par(mfrow=c(2,1))

ssCpuUser<-snmps[ snmps$valueType == 'ssCpuUser', ]
plot((ssCpuUser$timestamp-min(ssCpuUser$timestamp))/1000/60,
     ssCpuUser$value,
     type='o',
     main="CPU user time over test time",
     xlab="Test time [min]",
     ylab="CPU utilization [%]",
     ylim=c(0,100),
     pch=18
)

timestamps<-snmps[ snmps$valueType == 'memTotalReal', ]$timestamp
memTotalReal<-as.numeric(sub("([0-9]+) kB", "\\1", snmps[ snmps$valueType == 'memTotalReal', ]$value))
memAvailReal<-as.numeric(sub("([0-9]+) kB", "\\1", snmps[ snmps$valueType == 'memAvailReal', ]$value))
reservedMem<-1-memAvailReal/memTotalReal

plot((timestamps-min(timestamps))/1000/60,
     reservedMem*100,
     type='o',
     main="Reserved Memory over test time",
     xlab="Test time [min]",
     ylab="Reserved memory [%]",
     ylim=c(0,100),
     pch=18
)
