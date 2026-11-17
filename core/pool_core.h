#ifndef POOL_CORE_H
#define POOL_CORE_H
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#define VERSION "1.0.1"
void crear_file(char *file);
void escribir(char *file, const char *contenido);
char* leer(char *file);
void eliminar(char *file);
bool archivo_existe(const char *file);
void renombrar_archivo(const char *archivo_actual, const char *nuevo_nombre);
void copiar(const char *archivo_origen, const char *archivo_destino);
void unir_archivos(const char *archivos[], const char *archivo_destino, size_t num_archivos);
#endif