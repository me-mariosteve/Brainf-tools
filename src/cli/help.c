# ifndef HELP_C_DEFINED
# define HELP_C_DEFINED


# include "../utils.c"


int cli_help(char *topic) {

    if (topic == NULL) {
        // The basic help when there is no topic specified.
        printf(
            "Help about this program:\nTODO\n"
            "List of the options available:\n"
            "--help | -h [topic]\n"
            "-to-c <input file> <output file>\n"
            "--exec | -e <input file> |<program in a string>\n"
        );
        return 0;

    } else if (
        strequ(topic, "--help") ||
        strequ(topic, "-h")
    ) {
        // The help about the option '--help' or '-h'.
        printf("Help for the option \"--help\":\nTODO\n");
        return 0;

    } else if (
        strequ(topic, "-to-c")
    ) {
        // The help about the option '-to-c'.
         printf("Help for the option \"-to-c\":\nTODO\n");
        return 0;
    
    } else if (
        strequ(topic, "-exec") ||
        strequ(topic, "-e")
    ) {
        printf(
            "Help for the option \"--exec\":\nTODO\n"
        );

    } else {
        // The specified topic does not exit.
        fprintf(stderr, "--help: Not a topic: %s\n", topic);
        return 1;
    }
    
    return 0;
}


# endif /* HELP_C_DEFINED */