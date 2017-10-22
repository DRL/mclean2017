library(readr)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(RColorBrewer)
library(ggthemes)
library(tools)
library(plyr)
library(stringr)
library(gtools)
library(gridExtra)
library(grid)
library(ggExtra)

data0 <- data.frame(read_csv(file = "heterorhabditis_bacteriophora.PRJNA13977.WBPS8.splice_site_table.txt.GCAG_ids.txt.counts_per_gene.txt", col_names = c('count', 'gene')))
#data0$species = 'H. bacteriophora (Bai et al., 2013)'
data0$species = 'Bai2013'
data0$genus = 'Heterorhabditis'
data1 <- data.frame(read_csv(file = "Heterorhabditis_bacteriophora_M31e_PRJNA13977.splice_sites_table.txt.GCAG_ids.txt.counts_per_gene.txt", col_names = c('count', 'gene')))
#data1$species = 'H. bacteriophora (BRAKER1/soft-masked)'
data1$species = 'BRAKER'
data1$genus = 'Heterorhabditis'
data2 <- data.frame(read_csv(file = "caenorhabditis_elegans.PRJNA13758.WBPS8.splice_site_table.txt.GCAG_ids.txt.counts_per_gene.txt", col_names = c('count', 'gene')))
#data2$species = 'C. elegans (GCA_000002985.3)'
data2$species = 'CELEG'
data2$genus = 'Caenorhabditis'

gcag_count_prelim <- rbind(data0, data1, data2)
gcag_count <- subset(gcag_count_prelim[gcag_count_prelim$count <= 9,])
gcag_count$count = factor(gcag_count$count)
gcag_count$species = factor(gcag_count$species)
gcag_count$count
gcag_count$genus = factor(gcag_count$genus, levels=c('Caenorhabditis','Heterorhabditis'))
gcag_count$species = factor(gcag_count$species, levels=c('Bai2013','BRAKER', 'CELEG'))
ggplot(gcag_count) + geom_bar(aes(x = count, fill=species), width = 1, colour="white", position = "dodge", show.legend = F) + facet_wrap(~species)+ scale_x_discrete() + xlab("GC/AG introns per gene")
