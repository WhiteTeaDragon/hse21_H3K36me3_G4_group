# hse21_H3K36me3_G4_group

Ссылка на презентацию: https://docs.google.com/presentation/d/1KfEcatNRX7WQDEpcnT8A6y3Tcj3nlGIiHynu5gXnj9o/edit?usp=sharing

## Репозитории отдельных участников:

H7: https://github.com/WhiteTeaDragon/hse21_H3K36me3_G4_human

HCT116: https://github.com/yaolgaloktionova/hse21_H3K36me3_G4_human

MCF-7: https://github.com/PolinaKananykina/hse21_H3K36me3_G4_human

GM12878: https://github.com/amamedov/hse21_H3K36me3_G4_human

HepG2: https://github.com/Sophie178/hse21_H3K36me3_G4_human

## Ссылка на сессию в геномном браузере: https://genome.ucsc.edu/s/nicka1106/hse21_H3K36me3_G4_group

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
