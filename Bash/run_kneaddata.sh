#!/bin/bash

# Número de hilos para optimizar el tiempo de procesamiento
THREADS=10

# Definir directorios:
input_dir="../trimmed_reads"
output_dir="../clean_reads"
db="../clean_reads/human_genome/"

# Bucle for para iterar sobre cada muestra preprocesada y filtrar el genoma humano
for R1 in ${input_dir}/*_1_trimmed.fastq.gz
do 
	sample=$(basename "$R1" _1_trimmed.fastq.gz) # Extraer nombre de la muestra
	R2=${input_dir}/${sample}_2_trimmed.fastq.gz # Definir nombre de read 2
	
	echo "Procesando muestra: $sample"
	
	kneaddata \
	--input1 "$R1" \
	--input2 "$R2" \
	--reference-db "$db" \
	--output "${output_dir}/$sample" \
	--threads THREADS \
	--bypass-trim \
	--bypass-trf \
	--bowtie2-options "--very-sensitive --end-to-end" \
  	--decontaminate-pairs strict \
	--remove-intermediate-output
done 

echo "Se han procesado todas las muestras" 