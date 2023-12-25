The concentration of metabolites in DMEM-high glucose media plus 10%FBS are converted to constraints for cancer and non-cancerous GSM models

modified Recon 3D model - model_final.mat

rxnTisMatccle_september.mat - model_final reactions in each of the 1406 cell line contexts classified into core and non-core based on the Local T2 thresholding (https://github.com/LewisLabUCSD/StanDep)

penaltyweights.m - code to assign weights to the  model_final reactions for executing swiftcore algorithm

ccleinformation.m - Information about the model_final genes matched with gene expression information in CCLE database and the different contexts (cell lines) of CCLE database 

cancercode1 and cancercode2 to extract models using swiftcore and adding suitable constraints to them. If any of the models built had zero flux through the biomass reaction, then sink reactions are added for the biomass metabolites. Refer to file for the code.
