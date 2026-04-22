#!/bin/bash

# Archivo con la lista de SRA accessions
LIST="../SRR_Acc_List.txt"

# Número de hilos para optimizar el tiempo de procesamiento
THREADS=10

# Definir directorios
input_dir="../clean_reads"
output_dir="../analysis/metaphian"

# Bucle for para iterar sobre cada muestra y obtener la composición taxonómica
for sra in $(cat "$LIST"); do 
    R1="${input_dir}/${sra}/${sra}_1_trimmed_kneaddata_paired_1.fastq"
    R2="${input_dir}/${sra}/${sra}_1_trimmed_kneaddata_paired_2.fastq"

    echo "Procesando $sra ..."

    metaphlan $R1,$R2 \
        --input_type fastq \
        --nproc THREADS \
        --mapout ${output_dir}/${sra}_map.txt \
        -o ${output_dir}/${sra}_profile.txt

done 

echo "Se han procesado todas las muestras"