# ifndef EXEC_C_DEFINED
# define EXEC_C_DEFINED


# include "../utils.c"
# include "../lang/exec.c"


int cli_exec(int argc, char **argv) {
    
    if (argc == 4) {
        // <program caller> --exec -f | -s <input file> | <code>

        if ( strequ(argv[2], "-f") ) {
            // Read the program from a file.
            open_file(input, argv[3], "r");
            return execf(input);

        } else if ( strequ(argv[2], "-s") ) {
            // Read the program from a string.
            return exec(argv[3]);

        } else {
            // Invalid option.
            fprintf(stderr, "Invalid option for --exec: %s\n", argv[2]);
            return 1;
        }

    } else {
        // Bad number of arguments.
        fprintf(stderr, "The option --exec needs 4 arguments, not %d.\n", argc);
    }

    return 0;
}


# endif /* EXEC_C_DEFINED */