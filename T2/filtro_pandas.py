import pandas as pd
import numpy as np
import os


##########################
#### BUSCAMOS EVALUAR ####
##########################

#| | ESPACIOS AL INICIO Y FINAL STRING
#| | ESTANDARIZAR FORMATO FECHAS
#| | QUE NÚMEROS NO SE HAYAN CONVERTIDO EN TEXTO

#|x| QUITAR COLUMNAS! REPETIDAS PRODUCTO DEL 
#     FILTRO MAYUS DE EXCEL -- No es necesario, excel puede

# Cambiar los VACIOS POR NULL



### TASK # 1
## ESPACIOS AL INICIO Y FINAL STRING

def pandas_strip(string):
    '''adapted version of strip() so the following 
    fxns can use it'''
    string = string.strip()
    return string


def fix_blankspaces_stringcolumn(excel, column_name, folder):
    '''takes a str and takes off its blanks
    spaces and the beggining/end'''
    
    path_excel = os.path.join(folder, excel)

    df = pd.read_csv(path_excel, sep=';', header=0, index=None)
    df[column_name] = df[column_name].apply(pandas_strip)

    aux = excel.split('.')
    new_csv_name = aux[0] + "_blanksfixed." + aux[1]

    path = os.path.join("DatosConPandas", new_csv_name)
    df.to_csv(path, index=False)



if __name__ == '__main__':
    #use this block to allow or prevent parts of code from being 
    # run when the modules are imported
    pass

    # fix_blankspaces_stringcolumn('organismos.csv', 
    #         'fecha_nacimiento', 'DatosConExcel')


    






