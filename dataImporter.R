library(readxl)

#fpath <- "PopulationJapan/Source/2020_12.xlsx"

dataImporter <- function(fpath){
  # Check year and month
  year_month <- strsplit(fpath, "/")
  pos_fname <- length(year_month[[1]])
  year_month <- year_month[[1]][pos_fname]
  year_month <- strsplit(year_month,"\\.")[[1]]
  year_month <- strsplit(year_month,"_")[[1]]
  
  ym_value <- as.numeric(paste0(year_month[1], year_month[2]))
  
  year_month <- as.numeric(year_month)
  
  if (ym_value<=202011){
    # for 2016 - 2020 Nov
    flg_xls <- length(grep(".xls$", fpath))>=1
    
    if (flg_xls){
      tmp <- readxl::read_xls(fpath, sheet=2, range="B7:B12", col_names = F)
    }else{
      tmp <- readxl::read_xlsx(fpath, sheet=2, range="B7:B12", col_names = F)  
    }
    
  }else{
    # for 2020 Dec ~
    tmp <- readxl::read_xlsx(fpath, sheet=1, range="C7:C12", col_names = F)
  }
  
  tmp <- as.vector(unlist(tmp))
  
  res <- data.frame(Year=year_month[1],
                    Month=year_month[2],
                    Born=tmp[1],
                    Death=tmp[2],
                    Natual_Change=tmp[3],
                    Stillbirth=tmp[4],
                    Marriage=tmp[5],
                    Divorce=tmp[6])
  
  return(res)
  
}


