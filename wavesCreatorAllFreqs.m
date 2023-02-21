function wavesCreatorAllFreqs(eletrodesLines,output)

nSbj=16;

for ss=1:nSbj
    
    data=load(['\Sbj' int2str(ss) 'theFinalData.mat']);
   
    for bb=1:size(data.theFinalData,2)
        [ss bb]
        if size(data.theFinalData(bb).data100,3)==size(output(ss).data(bb).typeTrials,2)
            [data100(bb).fwMax,data100(bb).bwMax,data100(bb).fwMaxSS,data100(bb).bwMaxSS]=waveTriggerComputer(data.theFinalData(bb).data100(:,:,output(ss).data(bb).typeTrials==4),eletrodesLines);
        end
    end
    
    sbjWaveDataAllFreqs.data100=data100;
    
    save(['\sbj' num2str(ss) 'rawWaves.mat'],'-v7.3','sbjWaveDataAllFreqs')

end


end



function [fwMax,bwMax,fwMaxSS,bwMaxSS]=waveTriggerComputer(theData,eletrodesLines)

    samplingRate=256;

    windowSize=samplingRate; 
    shufflingRepetitions=10;
    xx=1:windowSize/2:size(theData,2)-windowSize/2;
    
    for tt=1:size(theData,3)
        for ii=1:length(xx)
            for mm=1:size(eletrodesLines,1)
                [fwMax(mm,:,ii,tt),bwMax(mm,:,ii,tt)]=wavesHunterAllFreqs(theData(eletrodesLines(mm,:),xx(ii):xx(ii)+windowSize-1,tt),samplingRate);

                for kk=1:shufflingRepetitions
                    [fwMaxM(:,kk),bwMaxM(:,kk)]=wavesHunterAllFreqs(theData(eletrodesLines(mm,randperm(size(eletrodesLines,2))),xx(ii):xx(ii)+windowSize-1,tt),samplingRate);
                end
                
                fwMaxSS(mm,:,ii,tt)=mean(fwMaxM,2);
                bwMaxSS(mm,:,ii,tt)=mean(bwMaxM,2);
            end
        end
    end
    
end


