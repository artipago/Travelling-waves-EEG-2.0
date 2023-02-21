function startingFunction()

% computing waves from the raw data
eletrodesLines=choosingTHeElectrodes();
behavior=load('outputBehavioral.mat');
wavesCreatorAllFreqs(eletrodesLines,behavior.output);
[results100]=wavesAnalyzerAllFreqs(behavior.output);


%plotting the results
load('dataWavesAttention.mat') 

[res100]=prepareWaves(results100);

plotResBlock(res100);

