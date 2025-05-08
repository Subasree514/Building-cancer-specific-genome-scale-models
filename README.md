Codes for the paper: A reactive species reactions module for integration into genome-scale metabolic models for improved insights: Application to cancer, https://doi.org/10.1016/j.ymben.2023.08.006

### Genes found in the transcriptomics data of cancer cell lines (Ghandi et al. Nature 2019) are assigned recon 3d ids to be used in genome-scale model reconstruction
Codes in Expression_data_recon3d/ccle_gene_recon.ipynb

### modified Recon 3D model
'model_final.mat'

### Step 1: Obtain core reactions in each cancer transcriptomics data through local T2 thresholding
Codes in Core_reactions/core_t2.m
Local T2 thresholding (https://github.com/LewisLabUCSD/StanDep)
## 
'rxnTisMatccle_september.mat' - model_final reactions in each of the 1406 cell line contexts classified into core and non-core

### Step 2: Code to reconstruct genome-scale models of cancers using swiftcore algorithm 
'cancercode1.m' and 'cancercode2.m' to extract models using swiftcore and add suitable constraints to them. 
### classification of reactions and assigning penalty scores
'penaltyweights.m' - code to assign weights to the  model_final reactions for executing swiftcore algorithm
### Matching the CCLE transcriptomics data gene expression values to the genes in the modified Recon 3D model
'ccleinformation.m' - Information about the model_final genes matched with gene expression information in CCLE database and the different contexts (cell lines) of CCLE database

### Step 3: Code to add media constraints
Constraints/dmemtransports.m

Add the transport reactions not already present in the cancer models for taking in DMEM nutrients using 'dmemtransports.m'

The concentration of metabolites in DMEM-high glucose media plus 10%FBS are converted to constraints for cancer and non-cancerous GSM models, present in 'dmemconstraints.m' 

Note: If any of the models built had zero flux through the biomass reaction, then sink reactions are added for the biomass metabolites. Refer to the file, 'biomassdemand.m' for the code.
