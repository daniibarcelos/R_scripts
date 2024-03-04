
######## Extrair informações de metadados de arquivos ###########

#especificar a pasta local onde estão os arquivos para extrair as infos. Pode ser a pasta que contém as pastas de cada ponto
setwd("C:/Users/Daniele Barcelos/OneDrive/Biotropicos/OCC_caju_2023") 

#listar os arquivos (incluir subpastas dentro da pasta local)
files <- list.files(recursive = TRUE, full.names = F, include.dirs = TRUE) 

#extrair as infos de metadados dos arquivos listados, transformar em tabela e salvar na mesma pasta local
metadata <- file.info(files) 
df <- data.frame(rownames(metadata),metadata$mtime) #apenas nome das linhas e coluna da data de modificação são de interesse 
write.csv(df, "extrated_metadata.csv") 


##### Apenas para FOTOS usando pacote "exiftoolr"

library(exiftoolr)
Sys.which("exiftool.exe")
exiftoolPath(exiftoolDir = "C:/ProgramData/win_exe")

#especificar a pasta local onde estão os arquivos para extrair as infos.
setwd("C:/Users/Daniele Barcelos/OneDrive/Biotropicos/OCC_caju_2023/OCPC44") 

#listar os arquivos (incluir subpastas dentro da pasta local)
files <- list.files(recursive = TRUE, full.names = F, include.dirs = TRUE) 

#extrair metadados dos arquivos listados, e salvar tabela
metadata <- exif_read(files, tags=c('FileName','DateTimeOriginal', 'ModifyDate', 'CreateDate'), pipeline = "csv")
write.csv(metadata, "extrated_metadata.csv") 
