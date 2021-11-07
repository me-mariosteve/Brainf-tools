# ifndef LANG_COMPILER_C_DEFINED
# define LANG_COMPILER_C_DEFINED


# include "../utils.c"


# define select_instr(input, result) \
case input: \
    fprintf(output, "%s\n", result); \
break;

int brainf2c(FILE *input, FILE *output) {

    fseek(input, 0, SEEK_SET);

    // The first part of the function 'main', where all
    // the variables are initialized.
    fprintf(output,
        "# include <stdio.h>\n"
        "# define MEM_SIZE 1024\n\n"
        "int main(void) {\n"
        "    char mem[MEM_SIZE];\n"
        "    for (int i = 0; i < MEM_SIZE; i++) mem[i] = 0;\n"
        "    int ptr = 0;\n"
        "\n\n"
    );
    int counter = 0;
    char instr;
    //char state = 0;  // 0: normal.
    do {
        
        instr = getc(input);

        // Get the equivalent of the brainf instruction in C.
        switch (instr) {
            select_instr('-', "mem[ptr]--;")
            select_instr('+', "mem[ptr]++;")
            select_instr('<', "ptr--;")
            select_instr('>', "ptr++;")
            select_instr('[', "do {")
            select_instr(']', "} while (mem[ptr]);")
            select_instr('.', "putchar(mem[ptr]);")
            select_instr(',', "mem[ptr] = (char)getchar();")
            default:  break;
        }

        counter++;
    } while (instr != EOF);

    fprintf(output, "\n}\n");
    return 0;
}


# endif /* LANG_COMPILER_C_DEFINED */