# ifndef CLI_COMPILE_C_DEFINED
# define CLI_COMPILE_C_DEFINED


# include "../utils.c"
# include "../lang/compiler.c"


int cli_brainf_to_c(int argc, char **argv) {

    if (argc == 4) {
        // The line has this format:
        // <program caller> -to-c <input file> <output file>

        FILE *input = fopen(argv[2], "r");
        FILE *output = fopen(argv[3], "w");
        int result = brainf2c(input, output);
        fclose(output);
        return result;

    } else {
        // Invalid number of arguments for this option.
        fprintf(stderr,
            "-to-c: You must provide 4 arguments as the following syntax:\n"
            "%s "
            "-to-c "
            "<input file> "
            "<output file>\n",
            argv[0]
        );
        return 1;
    }

    // vvv This part is not finished.
    /*
    switch (argc) {
        case 3: if ( argv[2] == "-f") {
            FILE *input = fopen(argv[3], "r");
        }
        FILE *output = fopen(argv[4], "w");
        brainf2c(argv[4], output);
    } else {
        fprintf(stderr, "You must provide 3-5 arguments.");
        exit(1);
    }
    */
}

# endif /* CLI_COMPILE_C_DEFINED */