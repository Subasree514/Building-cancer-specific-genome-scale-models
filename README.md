Codes for the paper: A reactive species reactions module for integration into genome-scale metabolic models for improved insights: Application to cancer, https://doi.org/10.1016/j.ymben.2023.08.006. The detailed methodology is depicted in the figure below. 
![image-url](https://github.com/Subasree514/Building-cancer-specific-genome-scale-models/blob/main/GEMs.png)

### Step 1: Obtain core reactions in each cancer transcriptomics data through local T2 thresholding
Codes available in https://github.com/Subasree514/Building-cancer-specific-genome-scale-models/tree/main/Core_reactions
- core_t2.m contains codes to get core reactions for each cancer cell line by mapping the transcriptomic data onto the modified Recon 3D model
- Local T2 thresholding (https://github.com/LewisLabUCSD/StanDep)
## 
'rxnTisMatccle_september.mat' - modified Recon 3D reactions (model_final.mat) in each of the 1406 cell line contexts classified into core and non-core

### Step 2: Code to reconstruct genome-scale models of cancers using swiftcore algorithm 
Codes available in https://github.com/Subasree514/Building-cancer-specific-genome-scale-models/tree/main/Step_1_reconstruction
'cancercode1.m' and 'cancercode2.m' to extract models using swiftcore and add suitable constraints to them. 
#### classification of reactions and assigning penalty scores
'penaltyweights.m' - code to assign weights to the  model_final reactions for executing swiftcore algorithm

### Step 3: Code to add media constraints
Codes available in https://github.com/Subasree514/Building-cancer-specific-genome-scale-models/tree/main/Constraints <br>


-The concentration of metabolites in DMEM-high glucose media plus 10%FBS are converted to constraints for cancer and non-cancerous GSM models, present in 'dmemconstraints.m' <br>
-Add the transport reactions not already present in the reconstructed cancer models for taking in DMEM nutrients using 'dmemtransports.m'

Note: If any of the models built had zero flux through the biomass reaction, then sink reactions are added for the biomass metabolites. Refer to the file, 'biomassdemand.m' for the code.

## Additional codes
### Genes found in the transcriptomics data of cancer cell lines (Ghandi et al. Nature 2019) are assigned Recon 3D ids to be used in genome-scale model reconstruction processes using Recon 3D model as template
Codes available in Expression_data_recon3d/ccle_genes_recon.ipynb <br>

The genes from CCLE mapped to the modified Recon 3D genes and the cell line information are given in https://github.com/Subasree514/Building-cancer-specific-genome-scale-models/blob/main/Core_reactions/ccle_info2023.m

### modified Recon 3D model
'model_final.mat'

