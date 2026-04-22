#!/bin/bash

# Archivo con la lista de SRA accessions
LIST="./SRR_Acc_List.txt"

# Número de hilos para optimizar el tiempo de ejecución
THREADS=8

# Bucle for para iterar sobre cada muestra y obtener su perfil funcional
for sra in $(cat "$LIST"); do 
    
    # Definir directorios 
    INPUT_DIR="clean_reads/${sra}"
    OUTPUT_DIR="analysis/humann"
    
    # Concatenar lecturas forward y reverse en un mismo archivo fastq (HUMAnN no admite lecturas pareadas como entrada)
    cat $INPUT_DIR/${sra}_1_trimmed_kneaddata_paired_1.fastq $INPUT_DIR/${sra}_1_trimmed_kneaddata_paired_2.fastq > $INPUT_DIR/${sra}_merged.fastq

    echo "Procesando $sra ..."
    
    # Ejecutar humann
    humann --threads $THREADS \
        --input-format fastq \
        --input "$INPUT_DIR/${sra}_merged.fastq" \
        --output "$OUTPUT_DIR/${sra}_humann_output" \
        --verbose

done


