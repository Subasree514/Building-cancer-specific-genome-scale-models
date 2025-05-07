load('model_final.mat');
load('rxnTisMatccle_september.mat');
run '../Core_reactions/ccle_info2023.m';
%%
cell_t={'ACH-000651'%sw620
'ACH-000199'%hs255t
'ACH-000443'%ovkate
'ACH-000494'%oele
'ACH-000374'%hcc1143
'ACH-000642'%hmel
'ACH-000681'%a549
'ACH-000758'};%mkn74
%%
cellids_t=contains(ccleconditions,cell_t);
c_id_t=find(cellids_t==1);
%%
epsilon=getCobraSolverParams('LP', 'feasTol')*100;
c1_t=find(rxnTisMatccle(:,c_id_t(1))==1);
c2_t=find(rxnTisMatccle(:,c_id_t(2))==1);
c3_t=find(rxnTisMatccle(:,c_id_t(3))==1);
c4_t=find(rxnTisMatccle(:,c_id_t(4))==1);
c5_t=find(rxnTisMatccle(:,c_id_t(5))==1);
c6_t=find(rxnTisMatccle(:,c_id_t(6))==1);
c7_t=find(rxnTisMatccle(:,c_id_t(7))==1);
c8_t=find(rxnTisMatccle(:,c_id_t(8))==1);
%% swiftcore
order=1:length(model.rxns);
all=order';
smat=model.S;
revs=find(model.lb<0);
irrevs=setdiff(all,revs);
run penaltyweights.m;
full=order';
full(revs)=1;
full(irrevs)=0;
%consistent = swiftcc(model.S,full,'gurobi');
%swiftcoreconsistent=intersect(consistent,rxncore);
result = blocked(model.S,full,'gurobi');
modelnewS.S=model.S;
modelnewS.c=model.c;
modelnewS.lb=model.lb;
modelnewS.ub=model.ub;
modelnewS.rxns=model.rxns;
modelnewS.rev=full;
component = partition(modelnewS,'gurobi', 'swift');
new=result.x(length(model.mets):(length(model.mets)+length(model.rxns)))
blockednumbers=find(new==-1);
newfull(blockednumbers)=1;
unblockednumbers=setdiff(all,blockednumbers);
newfull(unblockednumbers)=0;
flux = core(modelnewS,newfull,weights,'gurobi');
find(flux==0);
epsilon=getCobraSolverParams('LP', 'feasTol')*100;
%%
corematrix = {c1_t;c2_t;c3_t;c4_t;c5_t;c6_t;c7_t;c8_t};
for i = 1:length(corematrix)
corem1=[731;773;954;2271;2277;7488;5190;corematrix{i,1}];
[modelswiftcore(i), reconInd, LP] = swiftcore(model,corem1,weights,epsilon,false,'gurobi');
end