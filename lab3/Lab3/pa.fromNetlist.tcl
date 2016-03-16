
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Lab3 -dir "C:/Users/152/Desktop/aaCoolM152A/Lab3/ISE Files/Lab3/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/152/Desktop/aaCoolM152A/Lab3/ISE Files/Lab3/stopwatch.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/152/Desktop/aaCoolM152A/Lab3/ISE Files/Lab3} }
set_property target_constrs_file "stopwatch.ucf" [current_fileset -constrset]
add_files [list {stopwatch.ucf}] -fileset [get_property constrset [current_run]]
link_design
