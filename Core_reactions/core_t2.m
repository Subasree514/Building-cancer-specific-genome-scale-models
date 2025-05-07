% load the latest TPM data of all the cancers from CCLE database DepMap Public 22Q2
load('ccledata2023.mat');
load('model_final.mat') % modified Recon 3D model
model=model_final;
run ccle_info2023.m
%%
tabledata1=ccledata2023;
%%
tablegenes1=cclegenes;
tableconditions1=ccleconditions;
%%
tablegenes=tablegenes1;
tabledata=tabledata1;
tableconditions=tableconditions1;
%%
remove=setdiff(tablegenes,model.genes);
only=matches(tablegenes,remove);
removeids=find(only==1);
includeids=setdiff(1:length(tablegenes),removeids')';
lowerThs = prctile(tabledata(includeids,:),25,'all');
upperThs=prctile(tabledata(includeids,:),75,'all');
modelData.value=tabledata(includeids,:);
modelData.gene=tablegenes(includeids,:);
modelData.Tissue=tableconditions;
[rxnTisMat_new] = getLocalT2_case(modelData,model,lowerThs,upperThs);
rxnTisMatccle_september=rxnTisMat_new;
%save('rxnTisMatccle_september.mat','rxnTisMatccle_september')