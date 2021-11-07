# ifndef LANG_EXEC_C_DEFINED
# define LANG_EXEC_C_DEFINED


# include "../utils.c"


int exec(char *prog) {
    char mem[MEM_SIZE];
    for (int i = 0; i < MEM_SIZE-1; i++) mem[i] = 0;
    int ptr = 0;
    
    long pc = 0;
    long last_lbl = -1;

    do {
        switch (prog[pc]) {
            case '+': mem[ptr] = (mem[ptr]+1)%256; break;
            case '-': mem[ptr] = (mem[ptr]-1)%256; break;

            case '>': ptr = (ptr+1)%MEM_SIZE; break;
            case '<': ptr = (ptr-1)%MEM_SIZE; break;

            case '[': last_lbl = pc;
            break;
            case ']':
                if (last_lbl == -1) {
                    fprintf(stderr, "ERROR:%li: no '[' found", pc);
                    return 1;
                } else if (mem[ptr]) pc = last_lbl;
            break;

            case '.': putchar(mem[ptr]); break;
            case ',': mem[ptr] = (char )getchar(); break;

            default: continue;
        }

    } while (prog[pc] != EOF);

    return 0;
}


int execf(FILE *input) {
    char mem[MEM_SIZE];
    for (int i = 0; i < MEM_SIZE-1; i++) mem[i] = 0;
    int ptr = 0;
    
    fseek(input, 0, SEEK_SET);
    long last_lbl = -1;
    char c;

    long total_iterations_count = 0;

    do {

        c = getc(input);
        switch (c) {

            case '+': mem[ptr] = (mem[ptr]+1)%256; break;
            case '-': mem[ptr] = (mem[ptr]-1)%256; break;

            case '>': ptr = (ptr+1)%MEM_SIZE; break;
            case '<': ptr = (ptr-1)%MEM_SIZE; break;

            case '[': last_lbl = ftell(input);
            break;
            case ']':
                if (last_lbl == -1) {
                    fprintf(stderr, "ERROR:%li: no '[' found", ftell(input));
                    return 1;
                } else if (mem[ptr]) fseek(input, last_lbl, SEEK_SET);
            break;

            case '.': putchar(mem[ptr]); break;
            case ',': mem[ptr] = (char )getchar(); break;

            default: continue;
        }

        total_iterations_count++;
    } while (c != EOF);

    return 0;
}


# endif /* LANG_EXEC_C_DEFINED */