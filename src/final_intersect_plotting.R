
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)
library(dplyr)
library(ggplot2)

###
setwd('C:/Users/Артём/Desktop/HSE/Бионформатика/Проект/hse21_H3K36me3_G4_group/')

file_name <- 'final_intersection.merged'

bed_df <- read.delim(paste0(file_name, '.bed'), 
                     as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(file_name, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('histograms/','len_hist.', file_name, '.pdf'), width = 10, dpi = 600)


txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(paste0(file_name, '.bed'), tssRegion=c(-3000, 3000), 
                           TxDb=txdb, annoDb="org.Hs.eg.db")

pdf(paste0('histograms/', 'chip_seeker.', file_name, '.plotAnnoPie.pdf'))
plotAnnoPie(peakAnno)
dev.off()
