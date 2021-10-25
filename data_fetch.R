source("dataImporter.R")

#t_dir <- "PopulationJapan/Source/"

data_fetch <- function(t_dir){
  f_list <- dir(t_dir)
  
  for (i in 1:length(f_list)){
    fpath <- paste0(t_dir, f_list[i])
    tmp <- dataImporter(fpath)
    if (i==1){
      res <- tmp
    }else{
      res <- rbind(res, tmp)
    }
    
  }
  return(res)
}