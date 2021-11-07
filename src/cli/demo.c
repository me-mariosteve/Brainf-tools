# ifndef DEMO_C_DEFINED
# define DEMO_C_DEFINED


# include "../utils.c"
# include "../lang/exec.c"


int cli_demo(int argc, char **argv) {

    char *descr = "The following brainf program in 'demo.bf' will\n"
    "display the numbers from 0 to 9 separated by a space:";
    char *prog =
        "++++++++++"
        ">++++++++++++++++++++++++++++++++++++++++++++++++"
        // ^ ASCII CODE for '0' is 48.
        ">++++++++++++++++++++++++++++++++"
        // ^ ASCII code for ' ' is 32.
        "<<[>.+>.<<-]"
    ;

    printf("%s\n%s\n\n", descr, prog);
    
    open_file(output, "demo.bf", "w")
    fprintf(output, "%s", prog);
    fclose(output);

    open_file(input, "demo.bf", "r")
    printf("Executing...\n");
    return execf(input);
    
}


# endif /* DEMO_C_DEFINED */