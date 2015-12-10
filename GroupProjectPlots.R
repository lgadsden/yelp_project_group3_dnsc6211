library(RMySQL)
library(ggplot2)
#Use this connection first if database doesn't exist
#mydb = dbConnect(MySQL(), user='root', password='root', host='localhost')

#Connect to GroupProj MySQL database
mydb = dbConnect(MySQL(), user='root', password='root',dbname = 'GroupProj',host='localhost')

#If database doesn't already exist, create it.
#dbSendQuery(mydb, "CREATE DATABASE if not exists GroupProj;")

#Read in restaurant data from table
restaurantData = dbReadTable(mydb, "restaurants")



#Makes the Dist. by Rating Histogram
q <- ggplot(restaurantData, aes(x=rating)) + 
   geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
                 breaks = seq(0,5,by=0.5), RIGHT = FALSE, 
                 colour="black", fill="#56B4E9") +
   scale_x_continuous(breaks = round(seq(0, 5, by = 0.5),0.5)) +
   ggtitle("Distribution by Yelp Rating") +
   ylab("Percentage") 
  
q + theme(axis.text.x = element_text(face="bold", color="#009E73", size=12),
          axis.text.y = element_text(face="bold", color="#009E73", size=12),
          panel.border = element_rect(colour = "black", fill=NA, size=1),
          plot.title = element_text(face="bold")) 

#Makes the Counts by Price Histogram
p <- ggplot(restaurantData, aes(price)) + 
  geom_histogram(RIGHT = FALSE, 
                 colour="black", fill="#CC79A7") +
  ggtitle("Counts of Top Restaurants by Price Range") +
  ylab("Counts") +
  xlab("Price Range")

p + theme(axis.text.x = element_text(face="bold", color="#009E73", size=12),
          axis.text.y = element_text(face="bold", color="#009E73", size=12),
          panel.border = element_rect(colour = "black", fill=NA, size=1),
          plot.title = element_text(face="bold")) 

#Makes the Counts by State Histogram
s <- ggplot(restaurantData, aes(x=state)) + 
  geom_histogram(RIGHT = FALSE, 
                 colour="black", fill="#E69F00") +
  ggtitle("Count of Top Restaurants by State") +
  ylab("Counts") 

s + theme(axis.text.x = element_text(face="bold", color="#009E73", size=12),
          axis.text.y = element_text(face="bold", color="#009E73", size=12),
          panel.border = element_rect(colour = "black", fill=NA, size=1),
          plot.title = element_text(face="bold")) 

                                               