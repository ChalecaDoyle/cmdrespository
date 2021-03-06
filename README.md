%matplotlib inline
# Dependencies and Setup
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# File to Load (Remember to change these)
city_data_to_load = "data/city_data.csv"
ride_data_to_load = "data/ride_data.csv"

# Read the City and Ride Data

city_data=pd.read_csv(city_data_to_load)
ride_data=pd.read_csv(city_data_to_load)


# Combine the data into a single dataset

city_ride_data = pd.merge(ride_data, city_data, how="left", on=["city"])


# Display the data table for preview

city_ride_data.head()

# Obtain the x and y coordinates for each of the three city types

urban_cities = city_ride_data[city_ride_data["type"] == "Urban"]
suburban_cities = city_ride_data[city_ride_data["type"] == "Suburban"]
rural_cities = city_ride_data[city_ride_data["type"] == "Rural"]

urban_ride_count = urban_cities.groupby(["city"]).count()["ride_id"]
urban_avg_fare = urban_cities.groupby(["city"]).mean()["fare"]
urban_driver_count = urban_cities.groupby(["city"]).mean()["driver_count"]

suburban_ride_count = suburban_cities.groupby(["city"]).count()["ride_id"]
suburban_avg_fare = suburban_cities.groupby(["city"]).mean()["fare"]
suburban_driver_count = suburban_cities.groupby(["city"]).mean()["driver_count"]

rural_ride_count = rural_cities.groupby(["city"]).count()["ride_id"]
rural_avg_fare = rural_cities.groupby(["city"]).mean()["fare"]
rural_driver_count = rural_cities.groupby(["city"]).mean()["driver_count"]


# Build the scatter plots for each city types

plt.scatter(urban_ride_count,
           urban_avg_fare,
           edgecolor="black",
           c="coral",
           linewidths=1,
           marker="o",
           s=urban_driver_count*8,
           alpha=0.5,
           label="Urban")

plt.scatter(suburban_ride_count,
           suburban_avg_fare,
           edgecolor="black",
           c="skyblue",
           linewidths=1,
           marker="o",
           s=suburban_driver_count*8,
           alpha=0.5,
           label="Suburban")

plt.scatter(rural_ride_count,
           rural_avg_fare,
           edgecolor="black",
           c="gold",
           linewidths=1,
           marker="o",
           s=rural_driver_count*8,
           alpha=0.5,
           label="Rural")


# Incorporate the other graph properties
#plt.title
plt.ylabel("Average Fare ($)")
plt.xlabel("Total Number of Rides (Per City)")
plt.grid(True)


# Create a legend
lgnd=plt.legend(title="city_ride_data",loc="best",scatterpoints=1, fontsize=8);
lgnd=legendHandles[0]._sizes=[30]
lndd=legendHandles[1]._sizes=[30]
lgnd=legendHandles[2]._sizes=[30]                 


# Incorporate a text label regarding circle size
plt.text(42.5, 36.5, "Notes:", fontsize=10)
plt.text(42.5, 35, "Circle size correlates with driver count per city.", fontsizes=10)


# Save Figure
plt.savefig(""../Images/Scatter.png")

# Calculate Type Percents
urban_average_fares=pd.DataFrame(urban_cdc["fares"].sum())
suburban_average_fares=pd.DataFrame(suburban_cdc["fare"].sum())
rural_average_fares=pd.DataFrame(rural_cdc["fare"].sum())

total_average_fare = urban_average_fare.sum() + suburban_average_fare.sum() + rural_average_fare.sum()

urban_fare_percent = urban_average_fare.sum()/total_average_fare
suburban_fare_percent = suburban_average_fare.sum()/total_average_fare
rural_fare_percent = rural_average_fare.sum()/total_average_fare

#Build Pie Chart
city_ride_data = ["Rurual", "Suburban", "Urban"]
fares=[urban_fare_percent, suburban_fare_percent, rural_fare_percent]
colors=["gold", "lightskyblue", "lightcoral"]
explode=(0.1, 0.1, 0)

plt.title("% of Total Fares by City Type")
plt.pie(fares, explode=explode, labels=labels, colors=colors, autopct="%1.1f%%", shadow=True, strantangle=140)

# Save Figure
plt.savefig("../Images/TotalFares_Pie.png")


Total Rides by City Type

dat
# Calculate Ride Percents
​
Rides_CityType=_city_ride_data_df.groupby(['type']).city_data.count()
Rides_CityType

Ride_Percents=round((Rides_CityTypes/Total_Rides)*100,1)
Ride_Percents
# Build Pie Chart
labels=[urban_fare_percent, suburban_fare_percent, rural_fare_percent]
colors=["gold", "lightskyblue", "lightcoral"]
explode=(0.1, 0.1, 0)

plt.title("% of Total Rides by City Type")
plt.pie(Ride_Percents, labels=labels, colors=colors, autopct="%1.1f%%", shadow=True, strantangle=140)

# Save Figure
plt.savefig("../Images/Total_Percent_Pie.png")



# Calculate Driver Percents
Driver_CityTypes=city_ride_data.groupby(['type']).driver_count()
Driver_CityType
Driver_Percents=round((Driver_CityType/Total_driver))

# Build Pie Charts

# Save Figure
