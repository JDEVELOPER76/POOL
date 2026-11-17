#include "core/pool_core.h"
int main(int argc, char *argv[]){
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <comando>\n", argv[0]);
        printf("Comandos disponibles:\n");
        printf("  --crear <archivo> - Crea un archivo vacío.\n");
        printf("  --escribir <archivo> <contenido> - Escribe contenido en un archivo.\n");
        printf("  --leer <archivo> - Lee y muestra el contenido de un archivo.\n");
        printf("  --ayuda - Muestra esta ayuda.\n");
        printf("  --version - Muestra la versión del programa.\n");
        printf("  --eliminar <archivo> - Elimina un archivo.\n");
        printf("  --existe <archivo> - Verificar si un archivo existe.\n");
        printf("  --renombrar <archivo_actual> <nuevo_nombre> - Renombra un archivo.\n");
        printf("  --copiar <archivo_origen> <archivo_destino> - Copia un archivo.\n");
        printf("  --unir <archivo1> ... <archivoN> <destino> - Une varios archivos.\n");
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
    }else if (strcmp(argv[1], "--existe") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Uso: %s --existe <archivo>\n", argv[0]);
            return EXIT_FAILURE;
        }
        bool existe = archivo_existe(argv[2]);
        if (existe) {
            printf("El archivo %s existe.\n", argv[2]);
        } else {
            printf("El archivo %s no existe.\n", argv[2]);
        }
    }else if (strcmp(argv[1], "--renombrar") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Uso: %s --renombrar <archivo_actual> <nuevo_nombre>\n", argv[0]);
            return EXIT_FAILURE;
        }
        renombrar_archivo(argv[2], argv[3]);
    } else if (strcmp(argv[1], "--copiar") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Uso: %s --copiar <archivo_origen> <archivo_destino>\n", argv[0]);
            return EXIT_FAILURE;
        }
        copiar(argv[2], argv[3]);
    } else if (strcmp(argv[1], "--unir") == 0) {
        if (argc < 4) {
            fprintf(stderr, "Uso: %s --unir <archivo1> ... <archivoN> <destino>\n", argv[0]);
            return EXIT_FAILURE;
        }
        size_t num_archivos = (size_t)(argc - 3);
        const char *archivos[num_archivos];
        for (size_t i = 0; i < num_archivos; i++) {
            archivos[i] = argv[i + 2];
        }
        unir_archivos(archivos, argv[argc - 1], num_archivos);
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
        printf("  --existe <archivo> - Verificar si un archivo existe.\n");
        printf("  --renombrar <archivo_actual> <nuevo_nombre> - Renombra un archivo.\n");
        printf("  --copiar <archivo_origen> <archivo_destino> - Copia un archivo.\n");
        printf("  --unir <archivo1> ... <archivoN> <destino> - Une varios archivos.\n");
    } else if (strcmp(argv[1], "--version") == 0) {
        printf("Versión %s\n", VERSION);
    } else {
        fprintf(stderr, "Comando no reconocido: %s\n", argv[1]);
        return EXIT_FAILURE;
    }
    return 0;
}