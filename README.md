# Material y código del TFM (Laura Celada)
Código generado para el TFM de Laura Celada Bustillos en el Máster de Bioinformática de la Universidad Internacional de Valencia (VIU). El código está dividido en varias carpetas. 

El objetivo del trabajo y del código generado es analizar la composición taxonómica y funcional del microbioma vaginal en mujeres con endometriosis frente a controles sanos mediante datos metagenómicos (WGS), con el fin de identificar especies, genes y rutas metabólicas diferencialmente abundantes.


* Carpeta "bash":
En esta carpeta encontramos los archivos run_fastp.sh, run_fastqc_inicial.sh, run_fastqc_final.sh, run_kneaddata.sh, run_metaphlan.sh, run_humann.sh para realizar los primeros pasos del procesamiento de archivos de lecturas shot-gun.  
En esta carpeta también encontramos un ejemplo de resultados de MultiQC en una carpeta a parte.

* Carpeta "R":
En esta carpeta se encuentra el código generado en el lenguaje de programación R. Incluye diversity_alpha_index_R.rmd, diversity_beta_index.R.rmd (análisis taxonómico de diversidad), differential_pathways.rmd y differential_genefamilies.rmd (análisis funcional de los archivos resultantes de HUMAnN).

* Carpeta "Python":
En esta carpeta se encuentra el script en Python utilizado para extraer métricas de los archivos JSON generados por fastp y evaluar cuantitativamente el impacto del preprocesamiento.

* Archivo merged_table.txt (Tabla S4):
Matriz de abundancia generada mediante merge_metaphlan_tables.py que recoge las abundancias relativas (%) de los taxones identificados en cada muestra. 
