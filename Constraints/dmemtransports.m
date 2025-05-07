
model1=modelSW620 %%load any cancer model
dmem_tr={'M02050[e] <=> M02050[c]'
         'cortsn[e] <=> cortsn[c]'
		 %%'M02050[e] <=> M02050[c]'
		 %'bilirub[e] <=> bilirub[c]'
		 'pydxn[e] <=> pydxn[c]'
		 'avite1[e] <=> avite1[c]'
		 'tststerone[e] <=> tststerone[c]'
		 'ncam[e] <=> ncam[c]'
         'Lcystin[e] <=> Lcystin[c]'
         'retinol[e] <=> retinol[c]'};
rxnNamesnew={'U1';'U2';'U3';'U4';'U5';'U6';'U7';'U8';'U9';'U10';'U11';'U12';'U13';'U14';'U15';'U16';'U17';'U18';'U19';'U20';'U21';'U22';'U23';'U24';'U25';'U26';'U27';'U28';'U29';'U30';'U31';'U32';'U33';'U34';'U35';'U36';'U37';'U38';'U39';'U40';'U41';'U42';'U43';'U44';'U45';'U46';'U47';'U48';'U49';'U50'};
dmemsubsytem={'dmem_transports'};
for i = 1:8
model1 = addReaction(model1,rxnNamesnew{i,1},'reactionFormula',dmem_tr{i,1},'subSystem',dmemsubsytem{1,1});
end
optimizeCbModel(model1)
run dmemconstraints.m
