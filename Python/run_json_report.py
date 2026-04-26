# Importación de librerías
import json # para leer los reports .json de fastp
import pandas as pd # para manejar los datos en formato tabla y exportarlos a Excel

# Definir lista de accesiones descargadas del SRA, donde cada línea corresponde a una muestra
LIST="../../SRR_Acc_List.txt"

# Crear lista vacía
srr_list = []
# Leer el archivo de accesiones y guardar los nombres en srr_list (evitar fallos con archivo inicial)
with open(LIST) as f:
    for line in f:
        srr_list.append(line.strip()) # elimina saltos de línea (\n)

# Generar lista donde se guardarán los datos extraídos de los reportes JSON
data_list = []

# 1. Iterar sobre cada muestra de la lista de accesiones para extraer las métricas de fastp
for srr in srr_list:
    # Construir el nombre del archivo JSON
    json_file = f"{srr}_report.json" # asumiendo que cada muestra tiene un reporte de fastp con este formato

    # Abrir y cargar el archivo JSON, dentro de la variable report. Con with se asegura el cierre del archivo después de su uso
    with open(json_file, "r") as file:
        report = json.load(file)

    # Definir variables - distintas secciones del archivo JSON donde se encuentran las métricas de interés
    summary_pre = report["summary"]["before_filtering"] # métricas antes del QC
    summary_post = report["summary"]["after_filtering"] # métricas después del QC
    filtered = report["filtering_result"] # reads eliminados tras filtrado
    duplication = report["duplication"] # tasa de duplicación
        
    # Extraer métricas y guardar en un diccionario. Para cada muestra, se extraen las siguientes variables:
    data_sample = {
        "Muestra": srr, # ID del SRA
        "Reads_totales": summary_pre["total_reads"], # reads iniciales
        "Reads_tras_QC": summary_post["total_reads"], # reads tras filtrado
        "Retención (%)": (summary_post["total_reads"] / summary_pre["total_reads"]) * 100, # porcentaje de reads que pasan el QC
        "Reads_baja_complejidad": filtered.get("low_complexity_reads", 0), # Si no hay ningún read de baja complejidad, se asigna 0
        "Baja_complejidad (%)": (filtered.get("low_complexity_reads", 0) / summary_pre["total_reads"]) * 100,
        "Contenido_GC (%)": summary_pre["gc_content"] * 100, 
        "Duplicación (%)": duplication ["rate"] * 100,
    }
    
    # Añadir el diccionario de la muestra a la lista general
    data_list.append(data_sample)

# 2. Convertir la lista en un dataframe de pandas
dataframe_json = pd.DataFrame(data_list)

# 3. Exportar a Excel
dataframe_json.to_excel("QC_report.xlsx", index=False) # index=False para evitar añadir columna de índice

# Mensaje final que muestra cuántas muestras se procesaron
print(f"Procesadas {len(dataframe_json)} muestras. Archivo 'QC_report.xlsx' creado.")