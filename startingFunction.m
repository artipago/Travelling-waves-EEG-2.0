function startingFunction()

% computing waves from the raw data
eletrodesLines=choosingTHeElectrodes();
behavior=load('outputBehavioral.mat');
wavesCreatorAllFreqs(eletrodesLines,behavior.output);
[results100]=wavesAnalyzerAllFreqs(behavior.output);


%plotting the results
load('dataWavesAttention.mat') 

[res100]=computeWaves(results100);

sizeWindow=1000;
plotResBlock(res100,sizeWindow);

