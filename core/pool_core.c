#include "pool_core.h"

void crear_file(char *file) {
    FILE *abrir = fopen(file, "w");
    if (abrir == NULL) {
        fprintf(stderr, "Error al crear el archivo %s\n", file);
        exit(EXIT_FAILURE);
    }
    fclose(abrir);
    printf("Archivo %s creado exitosamente.\n", file);
}
void escribir(char *file, const char *contenido){
    FILE *abrir = fopen(file, "a");
    if (abrir == NULL){
        fprintf(stderr, "Error al escribir en el archivo %s\n",file);
        exit(EXIT_FAILURE);
    }
    fprintf(abrir, "%s\n", contenido);
    fclose(abrir);
}
char* leer(char *file) {
    FILE *abrir = fopen(file, "r");

    if (abrir == NULL) {
        fprintf(stderr, "Error al leer el archivo %s\n", file);
        return NULL;
    }

    char *contenido = malloc(1);

    if (contenido == NULL) {
        fclose(abrir);
        fprintf(stderr, "Error al asignar memoria para leer el archivo %s\n", file);
        return NULL;
    }

    int caracter;
    size_t longitud = 0;

    while ((caracter = fgetc(abrir)) != EOF) {
        char *temp = realloc(contenido, longitud + 2);

        if (temp == NULL) {
            free(contenido);
            fclose(abrir);
            fprintf(stderr, "Error al reasignar memoria para leer el archivo %s\n", file);
            return NULL;
        }

        contenido = temp;
        contenido[longitud++] = (char)caracter;
    }

    if (ferror(abrir)) {
        free(contenido);
        fclose(abrir);
        fprintf(stderr, "Error durante la lectura del archivo %s\n", file);
        return NULL;
    }

    fclose(abrir);

    contenido[longitud] = '\0';

    return contenido;
}

void eliminar(char *file) {
    if (remove(file) == 0) {
        printf("Archivo %s eliminado exitosamente.\n", file);
    } else {
        fprintf(stderr, "Error al eliminar el archivo %s\n", file);
    }
}

bool archivo_existe(const char *file) {
    FILE *abrir = fopen(file, "r");
    if (abrir) {
        fclose(abrir);
        return true;
    }
    else{
        return false;
    }
}

void renombrar_archivo(const char *archivo_actual, const char *nuevo_nombre) {
    if (rename(archivo_actual, nuevo_nombre) == 0){
        printf("Archivo renombrado de %s a %s exitosamente.\n", archivo_actual, nuevo_nombre);
    } else {
        fprintf(stderr, "Error al renombrar el archivo %s a %s\n", archivo_actual, nuevo_nombre);
    }
}

void copiar(const char *archivo_origen, const char *archivo_destino){
    FILE *origen = fopen(archivo_origen, "r");
    if (origen == NULL) {
        fprintf(stderr, "Error al abrir el archivo de origen %s\n", archivo_origen);
        return;
    }

    FILE *destino = fopen(archivo_destino, "w");
    if (destino == NULL) {
        fprintf(stderr, "Error al crear el archivo de destino %s\n", archivo_destino);
        fclose(origen);
        return;
    }

    char buffer[1024];
    size_t bytes_leidos;

    while ((bytes_leidos = fread(buffer, 1, sizeof(buffer), origen)) > 0) {
        fwrite(buffer, 1, bytes_leidos, destino);
    }

    fclose(origen);
    fclose(destino);

    printf("Archivo copiado de %s a %s exitosamente.\n", archivo_origen, archivo_destino);
}

void unir_archivos(const char *archivos[], const char *archivo_destino, size_t num_archivos) {
    FILE *destino = fopen(archivo_destino, "w");
    if (destino == NULL) {
        fprintf(stderr, "Error al crear el archivo de destino %s\n", archivo_destino);
        return;
    }

    for (size_t i = 0; i < num_archivos; i++) {
        FILE *origen = fopen(archivos[i], "r");
        if (origen == NULL) {
            fprintf(stderr, "Error al abrir el archivo de origen %s\n", archivos[i]);
            continue;
        }

        char buffer[1024];
        size_t bytes_leidos;

        while ((bytes_leidos = fread(buffer, 1, sizeof(buffer), origen)) > 0) {
            fwrite(buffer, 1, bytes_leidos, destino);
        }

        fclose(origen);
    }

    fclose(destino);

    printf("Archivos unidos en %s exitosamente.\n", archivo_destino);
}