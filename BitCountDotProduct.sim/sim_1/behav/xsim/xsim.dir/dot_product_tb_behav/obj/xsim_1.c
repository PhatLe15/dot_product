/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_229(char*, char *);
extern void execute_415(char*, char *);
extern void execute_416(char*, char *);
extern void execute_4(char*, char *);
extern void execute_234(char*, char *);
extern void execute_6(char*, char *);
extern void execute_235(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_9(char*, char *);
extern void execute_236(char*, char *);
extern void execute_12(char*, char *);
extern void execute_237(char*, char *);
extern void execute_14(char*, char *);
extern void execute_241(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_18(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_23(char*, char *);
extern void execute_25(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_249(char*, char *);
extern void execute_28(char*, char *);
extern void execute_253(char*, char *);
extern void execute_254(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_35(char*, char *);
extern void execute_252(char*, char *);
extern void execute_224(char*, char *);
extern void execute_226(char*, char *);
extern void execute_410(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_421(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[50] = {(funcp)execute_229, (funcp)execute_415, (funcp)execute_416, (funcp)execute_4, (funcp)execute_234, (funcp)execute_6, (funcp)execute_235, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_239, (funcp)execute_240, (funcp)execute_9, (funcp)execute_236, (funcp)execute_12, (funcp)execute_237, (funcp)execute_14, (funcp)execute_241, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_242, (funcp)execute_243, (funcp)execute_18, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_23, (funcp)execute_25, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)execute_28, (funcp)execute_253, (funcp)execute_254, (funcp)execute_250, (funcp)execute_251, (funcp)execute_35, (funcp)execute_252, (funcp)execute_224, (funcp)execute_226, (funcp)execute_410, (funcp)execute_231, (funcp)execute_232, (funcp)execute_233, (funcp)execute_417, (funcp)execute_418, (funcp)execute_419, (funcp)execute_420, (funcp)execute_421, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 50;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/dot_product_tb_behav/xsim.reloc",  (void **)funcTab, 50);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/dot_product_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/dot_product_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/dot_product_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/dot_product_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/dot_product_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
