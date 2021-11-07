# ifndef UTILS_C_DEFINED
# define UTILS_C_DEFINED


# include <stdio.h>
# include <stdlib.h>
# include <stddef.h>
# include <string.h>


# define MEM_SIZE 10

# define strequ(str1, str2) ( !strcmp(str1, str2) )

# define open_file(name, filename, mode) \
FILE *name = fopen((filename), (mode)); \
if (!(name)) { \
    fprintf(stderr, "Can't open file '%s': %i\n", (filename), errno); \
    return 1; \
}

int strcount(char *str, char c) {
    int total = 0;
    for (int i = 0; str[i]; i++)
        total += str[i] == c;
    return total;
}

long fsize(FILE *file) {
    long current, result;
    current = ftell(file);
    fseek(file, 0, SEEK_END);
    result = ftell(file);
    fseek(file, current, SEEK_SET);
    return result;
}


# endif /* UTILS_C_H */