

#First clean up names on fasta file using (to remove the long description after GenBank accession number)
    #cat ./my_shared_data_folder/raw_data.fasta | sed '/^>/s/\..*//' >rawData_cleanedNames.fasta

require("pacman")
pacman::p_load(tidyverse, stringR, dplyr)

bigDta<-read.csv("metadata.csv", header=T)
head(bigDta)

selection<-c("MT653071" ,"MT653080","MW566800","OK018220" ,"OK018237","OK001876" ,"OK354409",'MZ172409',
             'MW703381','MZ040128','MZ040130','MZ150527','MT890205','MZ622025','MZ619091','OK348762',
             'MW751124','MW018428','MZ054879','MW474741','MT731327','MZ571142','MT994707','MZ854386',
             'MT872497','MZ520070','MT324062','OK091660','MZ149969','MZ215672','MZ540788','MW426406',
             'MZ287350','MZ287361','MT790522','LR963402','LR963451')

annotationData<-bigDta %>%
  subset(
    Accession %in% selection
  ) %>% 
  select (
    Accession, Country, Pangolin, Collection_Date
  )

head(annotationData)

write_csv(annotationData, "annotation.csv")



