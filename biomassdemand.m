model3= %load the model with zero biomass flux
biomassmets=findMetsFromRxns(model3,{'biomass_reaction'});%biomass_maintenance or biomass_reaction
%%calculating flux through DMs
Demand={'DM_h2o[c]'
'DM_h[c]'
'DM_atp[c]'
'DM_adp[c]'
'DM_pi[c]'
'DM_glu_L[c]'
'DM_asp_L[c]'
'DM_gtp[c]'
'DM_ala_L[c]'
'DM_asn_L[c]'
'DM_cys_L[c]'
'DM_gln_L[c]'
'DM_gly[c]'
'DM_ser_L[c]'
'DM_thr_L[c]'
'DM_lys_L[c]'
'DM_arg_L[c]'
'DM_met_L[c]'
'DM_pail_hs[c]'
'DM_ctp[c]'
'DM_pchol_hs[c]'
'DM_pe_hs[c]'
'DM_chsterol[c]'
'DM_pglyc_hs[c]'
'DM_clpn_hs[c]'
'DM_dgtp[n]'
'DM_dctp[n]'
'DM_datp[n]'
'DM_utp[c]'
'DM_dttp[n]'
'DM_g6p[c]'
'DM_his_L[c]'
'DM_tyr_L[c]'
'DM_ile_L[c]'
'DM_leu_L[c]'
'DM_trp_L[c]'
'DM_phe_L[c]'
'DM_pro_L[c]'
'DM_ps_hs[c]'
'DM_sphmyln_hs[c]'
'DM_val_L[c]'};
for i = 1:length(Demand) 
model1=model3;
model1= addDemandReaction(model1,biomassmets);
model1=changeObjective(model1,Demand(i)); 
FBA(i)=optimizeCbModel(model1,'max');
end