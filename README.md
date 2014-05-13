Load_vs_loadless_Unix
=====================

Scripts to compare (under different rates of binding and degradation rates) systems with loads vs loadless in Unix with BSD flavor (Mac).

The files included are: 

  - canberra.R
  - normalize_kon_koff.R
  - Change_binding_inner.sh
  - kon_koff_changes.sh
  - retro_short_Molecules_tau_local.sh
  
  Each one provides different functionalities for the pipe line to proceed.
  
  -canberra.R
  
  Calculates canberra's distance in R between two different simulations (in this case the one with the loads vs the one without).
  
  - normalize_kon_koff.R
  
  Calculates canberra's distance in R between two different simulations (in this case the one with the loads vs the one without).
  Then, it normalizes the canberra's distance value by dividing it by the mean value of canberra's distance between the simulation
  without loads and 1000 individuals of its radomized version.
  
  - Change_binding_inner.sh
  
  Changes multiple times the rate of binding and unbinding of a TF with its cognate sites (kon2 and koff2) and saves the result in
  a .txt file. It does this to compare the cases with and without loads across different binding values.
  
  - kon_koff_changes.sh
  
  Changes the TAU (protein half life). 
  
  - retro_short_Molecules_tau_local.sh
  
  Calls Change_binding_inner.sh for different values of kon and koff (self binding and unbinding rates)
