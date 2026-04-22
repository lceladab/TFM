#!/bin/bash

# Archivo con la lista de SRA accessions
LIST="../SRR_Acc_List.txt"

# Número de hilos para optimizar el tiempo de procesamiento
THREADS=6

# Bucle que itera sobre cada SRA accession, define dos variables para las lecturas forward (R1) y reverse (R2)
# iniciales y finalmente, ejecuta FastQC sobre cada una.
for sra in $(cat "$LIST"); do 

    R1="${sra}_1.fastq.gz"
    R2="${sra}_2.fastq.gz"

    echo "Procesando $sra ..."

    fastqc -t $THREADS \
        "$R1" \
        "$R2" \
        -o "./fastqc_raw" \

done 

# Integración de todos los archivos .fastqc en un informe global con MultiQC
multiqc ./fastqc_raw/ -o ./multiqc_raw/