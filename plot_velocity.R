
library(ggplot2)
library(RNetCDF)
library(pracma)
library(raster)
library(rgdal)

# download data
path_download <- "https://hfrnet-tds.ucsd.edu/thredds/ncss/HFR/USWC/2km/LTA/USWC-month-LTA-2km.nc?var=u_mean&var=v_mean&north=34.5&west=-120.8&east=-118.6&south=33.7&disableProjSubset=on&horizStride=1&time_start=2018-01-01T00%3A00%3A00Z&time_end=2019-01-01T12%3A00%3A00Z&timeStride=1&accept=netcdf"

download.file(path_download,"wave_direction_monthly_2km.nc", method = "auto", quiet = FALSE, mode="wb", cacheOK = TRUE)


currents <- open.nc("wave_direction_monthly_2km.nc")
t <- var.get.nc(currents, "time")
u <- var.get.nc(currents, "u_mean")
v <- var.get.nc(currents, "v_mean")
lat <- var.get.nc(currents, "lat")
lon <- var.get.nc(currents, "lon")

# select the fifth time point as an example
usel <- u[,,5]
vsel <- v[,,5]

#change the format to array with a right dimension
latinput <- rep(lat,each=dim(lon))
loninput <- rep(lon,dim(lat))
uinput<- as.vector(usel)
vinput<- as.vector(vsel)

#plot boudary maps
usa = getData("GADM", country="USA", level=2)
ca1<-subset(usa,NAME_1=="California")

plot(ca1, xlim=c(-120.8, -118.6), ylim=c(33.7, 34.5),col="#f2f2f2", bg="white", lwd=1, border=1 )
#add velocity arrows
quiver(loninput,latinput,uinput,vinput,scale=0.001,length=0.05,angle = 10)


