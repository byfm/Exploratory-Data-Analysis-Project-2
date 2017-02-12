# Use Readdata.R prior to that script

# Loading provided datasets - loading local data

library(ggplot2)

# Loading provided datasets - loading from local machine

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2008'))

# Subsetting
# Baltimore City, Maryland == fips

MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate

MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Generate the graph in the same directory as the source code

png('plot5.png')

ggplot(data=MD.df, aes(x=year, y=Emissions)) + guides(fill=F) + 
    geom_bar(stat="identity", aes(fill=year)) +
    ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') +
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') +
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))


dev.off()




