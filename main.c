#include <stdio.h>
#include <stdlib.h>
#include <string.h>


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


int main(int argc, char *argv[]){
    const char *VERSION = "1.0.0";
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <comando>\n", argv[0]);
        printf("Comandos disponibles:\n");
        printf("  --crear <archivo> - Crea un archivo vacío.\n");
        printf("  --escribir <archivo> <contenido> - Escribe contenido en un archivo.\n");
        printf("  --leer <archivo> - Lee y muestra el contenido de un archivo.\n");
        printf("  --ayuda - Muestra esta ayuda.\n");
        printf("  --version - Muestra la versión del programa.\n");
        printf("  --eliminar <archivo> - Elimina un archivo.\n");
        return EXIT_FAILURE;
    }
    if (strcmp(argv[1], "--crear") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Uso: %s --crear <archivo>\n", argv[0]);
            return EXIT_FAILURE;
        }
        crear_file(argv[2]);
    } else if (strcmp(argv[1], "--escribir") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Uso: %s --escribir <archivo> <contenido>\n", argv[0]);
            return EXIT_FAILURE;
        }
        escribir(argv[2], argv[3]);
    } else if (strcmp(argv[1], "--leer") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Uso: %s --leer <archivo>\n", argv[0]);
            return EXIT_FAILURE;
        }
        char *contenido = leer(argv[2]);
        if (contenido != NULL) {
            printf("Contenido de %s:\n%s\n", argv[2], contenido);
            free(contenido);
        }
    } else if (strcmp(argv[1], "--eliminar") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Uso: %s --eliminar <archivo>\n", argv[0]);
            return EXIT_FAILURE;
        }
        eliminar(argv[2]);
    } else if (strcmp(argv[1], "--ayuda") == 0) {
        fprintf(stderr, "Uso: %s <comando>\n", argv[0]);
        printf("APPNAME : POOL\n");
        printf("Comandos disponibles:\n");
        printf("  --crear <archivo> - Crea un archivo vacío.\n");
        printf("  --escribir <archivo> <contenido> - Escribe contenido en un archivo.\n");
        printf("  --leer <archivo> - Lee y muestra el contenido de un archivo.\n");
        printf("  --ayuda - Muestra esta ayuda.\n");
        printf("  --version - Muestra la versión del programa.\n");
        printf("  --eliminar <archivo> - Elimina un archivo.\n");
    } else if (strcmp(argv[1], "--version") == 0) {
        printf("Versión %s\n", VERSION);
    } else {
        fprintf(stderr, "Comando no reconocido: %s\n", argv[1]);
        return EXIT_FAILURE;
    }
    return 0;
}