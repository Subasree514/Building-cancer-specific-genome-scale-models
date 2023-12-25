
exchanges = strmatch('EX',model.rxns);
subs=string(model.subSystems);
transports = strmatch('Transport,',subs);
sinks = strmatch('sink',model.rxns);
demands = strmatch('DM',model.rxns);
exchangeall=[exchanges;demands;sinks];
othertwoall=[exchangeall;transports];
all=1:length(model.rxns);
weights=all';
metabolic=setdiff(all,othertwoall);
weights(metabolic)=1;
weights(exchangeall)=10;
weights(transports)=5;
