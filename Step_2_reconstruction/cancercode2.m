%%
modelb1=modelswiftcore(1)
modelb2=modelswiftcore(2)
modelb3=modelswiftcore(3)
modelb4=modelswiftcore(4)
modelb5=modelswiftcore(5)
modelb6=modelswiftcore(6)
modelb7=modelswiftcore(7)
modelb8=modelswiftcore(8)
%%
modelb1.lb=modelb1.lb.*1e3;
modelb1.ub=modelb1.ub.*1e3;
model1=modelb1;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.034;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelSW620=model1Out;
%%
modelb2.lb=modelb2.lb.*1e3;
modelb2.ub=modelb2.ub.*1e3;
model1=modelb2;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.014;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelHS255T=model1Out;
%%
modelb3.lb=modelb3.lb.*1e3;
modelb3.ub=modelb3.ub.*1e3;
model1=modelb3;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.007;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelOVKATE=model1Out;
%%
modelb4.lb=modelb4.lb.*1e3;
modelb4.ub=modelb4.ub.*1e3;
model1=modelb4;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.014;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelOELE=model1Out;
%%
modelb5.lb=modelb5.lb.*1e3;
modelb5.ub=modelb5.ub.*1e3;
model1=modelb5;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.015;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelHCC1143=model1Out;
%%
modelb6.lb=modelb6.lb.*1e3;
modelb6.ub=modelb6.ub.*1e3;
model1=modelb6;
dmemconstraints
dmemtransports
find(model1.c==1)
model1.ub(ans)=0.014;
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model1,'S')
modelHMEL=model1Out;
%%
modelb7.lb=modelb7.lb.*1e3;
modelb7.ub=modelb7.ub.*1e3;
model3=modelb7;
memhuman
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model3,'S')
modelA549=model1Out;
%%
modelb8.lb=modelb8.lb.*1e3;
modelb8.ub=modelb8.ub.*1e3;
model3=modelb8;
memhuman
[model1Out, removedRxnInd, keptRxnInd] = checkDuplicateRxn(model3,'S')
modelMKN28=model1Out;
