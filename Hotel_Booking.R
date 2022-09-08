
#Installing the packages

install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

#Loading the packages

library(tidyverse)
library(skimr)
library(janitor)

#Importing the Dataset

hotel_bookings <- read_csv("hotel_bookings.csv")

#Exploring the Data

head(hotel_bookings)

glimpse(hotel_bookings)

colnames(hotel_bookings)

#Manipulating the Dataset
#Arranging the Data by most lead time to least lead time to focus on bookings made far in advance.

arrange(hotel_bookings, lead_time)

arrange(hotel_bookings, desc(lead_time))

#The highest lead time for a hotel booking in this data set is 737


#Saving this ordered list in a new dataframe

hotel_bookings_v2 <- arrange(hotel_bookings, desc(lead_time))

#Check out the new data frame: 

head(hotel_bookings_v2)

#find out the maximum and minimum lead times without sorting the whole data set using the `arrange()` function

max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)

#Calculating the average lead time for booking

mean(hotel_bookings$lead_time)

#creating a new dataset with only city hotels

hotel_bookings_city <- filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")

head(hotel_bookings_city)

#mean lead time for the city hotels

mean(hotel_bookings_city$lead_time)

#using the pipe to store the mean, min, and max lead time in a new dataframe.

hotel_summary <- 
  hotel_bookings %>%
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))

head(hotel_summary)
