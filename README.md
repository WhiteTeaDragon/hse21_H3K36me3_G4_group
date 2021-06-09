# hse21_H3K36me3_G4_group

Код для получения пересечения файлов:

``cd interseсt_bed_files``

``ls > ../../../filenames.txt``

``cat ../../../filenames.txt | xargs -tI{} sort -k1,1 -k2,2n -o sorted.{} {}``

``bedtools intersect -a sorted.H3K36me3_GM12878.intersect_with_Homo_Li_KPDS.bed -b sorted.H3K36me3_H7_intersect.bed > total_intersection.bed``

``bedtools intersect -a total_intersection.bed -b sorted.H3K36me3_HCT116.intersect_with_G4.bed > total_intersection2.bed``

``bedtools intersect -a total_intersection2.bed -b sorted.H3K36me3_HEK293_with_G4.intersect.bed > total_intersection3.bed``

``bedtools intersect -a total_intersection3.bed -b sorted.H3K36me3_HepG2.intersect_with_Homo_Li_KPDS.bed > total_intersection4.bed``

``bedtools intersect -a total_intersection4.bed -b sorted.H3K36me3_MCF-7.intersect_with_G4_seq_Li_K.bed > total_intersection5.bed``

``cp total_intersection5.bed ../final_intersection.bed``
