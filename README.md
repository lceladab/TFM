# Material y código del TFM (Laura Celada)
Código generado para el TFM de Laura Celada Bustillos en el Máster de Bioinformática de la Universidad Internacional de Valencia (VIU). El código está dividido en varias carpetas. 

El objetivo del trabajo y del código generado es analizar la composición taxonómica y funcional del microbioma vaginal en mujeres con endometriosis frente a controles sanos mediante datos metagenómicos (WGS), con el fin de identificar especies, genes y rutas metabólicas diferencialmente abundantes.

## Carpeta "bash"
En esta carpeta se encuentran los archivos run_fastp.sh, run_fastqc_inicial.sh, run_fastqc_final.sh, run_kneaddata.sh, run_metaphlan.sh, run_humann.sh para realizar los primeros pasos del procesamiento de archivos de lecturas shot-gun.  

## Carpeta "R"
En esta carpeta se encuentra el código generado en el lenguaje de programación R. Incluye diversity_alpha_index_R.rmd, diversity_beta_index.R.rmd (análisis taxonómico de diversidad), differential_pathways.rmd y differential_genefamilies.rmd (análisis funcional de los archivos resultantes de HUMAnN).

## Carpeta "Python"
En esta carpeta se encuentra el script en Python utilizado para extraer métricas de los archivos JSON generados por fastp y evaluar cuantitativamente el impacto del preprocesamiento.

## Carpeta "Results"
En esta carpeta se encuentran archivos de resultados que no se pudieron incluir en anexos o formato Word.
- Tabla S1: Profundidad de secuenciación y métricas de calidad de las muestras preprocesadas con fastp. Se recoge, para cada muestra, el número de lecturas iniciales y las resultantes tras el filtrado, el porcentaje de retención, el número y porcentaje de lecturas de baja complejidad, contenido GC y el nivel de duplicación. También se muestra la clasificación por grupo clínico.
- Tabla S2: Resultados del filtrado de ADN del hospedador mediante KneadData. Se recoge, para cada muestra, el número total de lecturas, así como el número y porcentaje de lecturas clasificadas como humanas y microbianas tras el alineamiento contra el genoma de referencia. Además, se indica la media del porcentaje de lecturas humanas y su desviación estándar, lo que permite evaluar la proporción y variabilidad de ADN del huésped presente en las muestras, y la eficiencia del proceso de descontaminación.
- Tabla S3: matriz de abundancia generada mediante merge_metaphlan_tables.py que recoge las abundancias relativas (%) de los taxones identificados en cada muestra.
- Figura S2: Análisis de componentes principales (PCA) basado en la matriz de abundancias relativas transformada de familias génicas agrupadas en EC, que representa la distribución de las muestras según las dos (A) o tres (B) cohortes clínicas en función de las variables clínicas o fisiológicas consideradas. Cada punto representa una muestra individual y está coloreado según la variable clínica o fisiológica, detallada en la leyenda. Las elipses representan los mismos grupos clínicos que la Fig. 6 del TFM. No se observan patrones de agrupación evidentes asociados a ninguna de las variables. 
- Informes HTML de MultiQC: resumen de los controles de calidad obtenidos a partir de los informes de FastQC. Se muestran las métricas principales, incluyendo estadísticas generales (nivel de duplicación, contenido GC, y número de secuencias), número de secuencias únicas y duplicadas por muestra, distribución de la calidad por secuencia, contenido de GC por secuencia, contenido de bases ambiguas, niveles de duplicación, contenido de adaptadores y un heatmap representando el estado global de calidad de las muestras. Ambos informes permiten evaluar la calidad inicial y final de las lecturas. Se pueden visualizar al descargarlos y abrirlos con un navegador. 

## Otros archivos
- Metadata.txt: metadatos asociados a las muestras incluidas en el estudio. La tabla recoge información técnica de secuenciación (identificadores SRA, BioProject, BioSample, plataforma, instrumento utilizado, número de lecturas y tamaño del archivo), así como variables biológicas y clínicas de los participantes (edad, índice de masa corporal o BMI, corte clínica, uso de antibióticos, presencia de endometrioma o endometriosis peritoneal, parámetros del ciclo menstrual y niveles hormonales. Esta información se utilizó para el análisis comparativo entre grupos. 
