%load('manuscriptdata.mat');
load('ccledata2023.mat');
load('model_final.mat')
model=model_final;
run manuscriptinfo2023.m
%%
%tabledata1=cclelast2022;
%tabledata2=singlecelllast2022;
tabledata1=ccledata2023;
%%
tablegenes1=cclegenes;
tableconditions1=ccleconditions;
%tablegenes2=singlecellgenes;
%tableconditions2=singlecellconditions;
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
%lowerThs = prctile(singlecellall2022,30,'all');
%upperThs=prctile(singlecellall2022,90,'all');
modelData.value=tabledata(includeids,:);
modelData.gene=tablegenes(includeids,:);
modelData.Tissue=tableconditions;
[rxnTisMat_new] = getLocalT2_case(modelData,model,lowerThs,upperThs);
%rxnTisMatsinglecell=rxnTisMat_new;
rxnTisMatccle=rxnTisMat_new;