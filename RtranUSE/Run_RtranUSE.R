# Script written by Juanmi Requena, please contact via mail: juanmir@ual.es

require('raster')
require('abind')
require('xlsx')

# How to run RtranUSE to compute land cover & land use changes that occurred in large geographic regions

# You need to follow the steps below: (please, pay attention where you need to replave or add information)

# STEP 0: creates a raster mask from your study region (with value 1 inside and value 0 outside) and cut it into tiles using a cut tool in a GIS software, e. g., the plugin 'Grid splitter' for QGIS (http://krambach.de/gridsplitter/)
# pay special attention in this step because the names of the mask tiles should be named as follows: tile_1.tif, tile_2.tif and so on

# STEP 1: importing to R the tiles obtained in the step above

nRaster<-n # replace n with the number of tiles obtained in the STEP 0 in geotiff format

for (i in c(1:nRaster)) {
  
  rasterFirstDate<-raster(file="path to the raster file of the land cover & land use map of the first date")# Import the Land cover and use raster map for the first date
  rasterSecondDate<-raster(file="path to the raster file of the land cover & land use map of the second date")# Import the Land cover and use raster map for the second date
  
  
  mask<-raster(paste0("path to the mask tile/tile_",i,".tif"))
  names(rasterFirstDate)<-"layer"
  names(rasterSecondDate)<-"layer"
  
  tileFirstDate<-mask*rasterFirstDate
  tileSecondDate<-mask*rasterSecondDate
  nc<-ncell(tileFirstDate)
  
  
  date1<-as.data.frame(tileFirstDate)
  date2<-as.data.frame(tileSecondDate)

  
  Index<-as.vector(c(1:nc))
  Code1<-as.vector(date1$layer)
  Code2<-as.vector(date2$layer)
  Code1[is.na(Code1)]<--999
  Code2[is.na(Code2)]<--999
  Label1<-rep("nolabel",nc)
  Label2<-rep("nolabel",nc)
  Change<-NA

  
  data<-data.frame(Index,Code1,Code2,Label1,Label2,Change)
  write.csv(data,paste0("path to save the csv files/","tile_",i,".csv"),row.names=FALSE,quote=F)
}

# STEP 2: runing tranUSE

setwd('path to the folder where the java executable is')# for example, C:/Program Files/Java/jdk1.7.0_67/bin/

for (i in 1:nRaster) {
  command <- paste0(sprintf(fmt='java -jar -Xmx4000m -Xms4000m path to the RtranUSE jar file/RtranUSE.jar %s %s %s %s %s %s %s %s',
  # please, pay special attention here, you should include as many '%s' symbols as arguments you have. For example, in this example there are 8 arguments
  paste0('path to the folder where the csv files were saved, see the line 48/tile_',i,'.csv'),'name of the change process 1',
  'path to the csv file defining the change process 1/name of the change process 1.csv','name of the change process 2', 
  'path to the csv file defining the change process 2/name of the change process 2.csv','name of the change process 3',
  'path to the csv file defining the change process 3/name of the change process 3.csv', 
  paste0('path to save the output of tranUSE/output_',i,'.csv')))
  system(command,intern=T)
}

# STEP 3: Transforms the outputs of tranUSE in raster format

nr<-n # replace n with the number of change processes defined by the user + 2

for (i in 1:nRaster) {
  
  mask<-raster(paste0("path to the mask tile/tile_",i,".tif"))
  csvR1<-read.csv(paste0('path to the folder where the output of tranUSE were saved/output_',i,'.csv'))
  csvR2<-as.matrix(csvR1$Change)
  csvR2[csvR2=="name of the change process 1"]<-1
  csvR2[csvR2=="name of the change process 2"]<-2
  csvR2[csvR2=="No_change"]<-3
  csvR2[csvR2=="name of the change process 3"]<-4
  csvR2[is.na(csvR2)]<-5
  # add as many lines as change process you have. For example, csvR2[csvR2=="name of the change process 4"]<-6 and so on
  csvR3<-matrix(as.numeric(csvR2),nrow=nr,ncol=ncol(mask),byrow=T)
  
  csvR4<-raster(csvR3,template=mask)
  rm(csvR1)
  rm(csvR2)
  rm(csvR3)
  
  writeRaster(csvR4,file=paste0("path to save the raster files/Result_",i,".tif"))
}

# STEP 4: adds all the raster tiles in only one

setwd('path to the folder where the raster files of the tranUSE output were saved/')

f <-list.files(pattern = ".tif")
numbers = as.numeric(regmatches(f, regexpr("[0-9]+", f)))
f2<-f[order(numbers)]

r <- lapply(f2, raster) 
 
x <- do.call("merge",r)

writeRaster(x,file="path to save the final raster file/name.tif")