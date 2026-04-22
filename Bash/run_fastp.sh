#!/bin/bash

# Archivo con la lista de SRA accessions
LIST="../raw_reads/SRR_Acc_List_modified.txt"

# Número de hilos para optimizar el tiempo de procesamiento
THREADS=10

# Bucle que itera sobre cada SRA accession, define dos variables para las lecturas forward (R1) y reverse (R2)
# iniciales y finalmente, ejecuta fastp.
for sra in $(cat "$LIST"); do 
    # Ignorar líneas vacías
    [[ -z "$sra" ]] && continue

    R1="../raw_reads/${sra}_1.fastq.gz"
    R2="../raw_reads/${sra}_2.fastq.gz"

    echo "Procesando $sra ..."

    fastp -w $THREADS \
        -i "$R1" \
        -I "$R2" \
        -o "${sra}_1_trimmed.fastq.gz" \
        -O "${sra}_2_trimmed.fastq.gz" \
        -q 20 -l 50 \
        --low_complexity_filter \
        --complexity_threshold 30 \
        --correction \
        --detect_adapter_for_pe \
        --trim_poly_g \
        --html "${sra}_report.html" \
        --json "${sra}_report.json"

done 