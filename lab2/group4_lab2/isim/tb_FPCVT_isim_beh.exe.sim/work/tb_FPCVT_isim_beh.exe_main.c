/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003931495207_1752742299_init();
    work_m_00000000001261373952_1325658491_init();
    work_m_00000000001549439371_3021782354_init();
    work_m_00000000001320307140_3865691683_init();
    work_m_00000000002955574279_0644182429_init();
    work_m_00000000000379851631_4102790620_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000379851631_4102790620");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
