### modified Recon 3D model
'model_final.mat'

### core reactions obtained through local T2 thresholding
'rxnTisMatccle_september.mat' - model_final reactions in each of the 1406 cell line contexts classified into core and non-core based on the Local T2 thresholding (https://github.com/LewisLabUCSD/StanDep)

### classification of reactions and assigning penalty scores
'penaltyweights.m' - code to assign weights to the  model_final reactions for executing swiftcore algorithm

### Matching the CCLE transcriptomics data gene expression values to the genes in the modified Recon 3D model
'ccleinformation.m' - Information about the model_final genes matched with gene expression information in CCLE database and the different contexts (cell lines) of CCLE database 

### Code to reconstruct genome-scale models of cancers using swiftcore algorithm 
'cancercode1.m' and 'cancercode2.m' to extract models using swiftcore and add suitable constraints to them. 

The concentration of metabolites in DMEM-high glucose media plus 10%FBS are converted to constraints for cancer and non-cancerous GSM models, present in 'dmemconstraints.m' and 'dmemtransports.m'

Note: If any of the models built had zero flux through the biomass reaction, then sink reactions are added for the biomass metabolites. Refer to the file, 'biomassdemand.m' for the code.
