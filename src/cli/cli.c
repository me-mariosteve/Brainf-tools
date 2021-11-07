# ifndef CLI_C_DEFINED
# define CLI_C_DEFINED


# include "../utils.c"
# include "help.c"
# include "demo.c"
# include "compile.c"
# include "exec.c"


/**
 * @brief This program is made to be used as a command.
 */
int cli(int argc, char **argv) {

    if (argc < 2) {
        // No argument given.
        printf("Use '%s --help' for more informations.\n", argv[0]);
        return 0;

    } else if (
        strequ(argv[1], "--help") ||
        strequ(argv[1], "-h")
    ) {
        // The help.
        return cli_help(argv[2]);
    
    } else if ( strequ(argv[1], "--demo") ) {
        // A demo
        return cli_demo(argc, argv);

    } else if ( strequ(argv[1], "-to-c") ) {
        // Convert a brainf program to C.
        return cli_brainf_to_c(argc, argv);

    } else if (
        strequ(argv[1], "--exec") ||
        strequ(argv[1], "-e")
    ) {
        // Execute a brainf program.
        return cli_exec(argc, argv);

    } else {
        // Invalid option.
        fprintf(stderr, "main: Invalid option: %s\n", argv[1]);
        return 1;
    }

}


# endif /* CLI_C_DEFINED */