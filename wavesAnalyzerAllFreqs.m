function [results100]=wavesAnalyzerAllFreqs(output)

    nSbj=16;

    for ss=1:nSbj
        ss
        data=load(['\sbj' num2str(ss) 'rawWaves.mat']);
        
        if output(ss).data(1).leftRightFlag(1)==1
            leftBlocks=1:2:10;
            rightBlocks=2:2:10;
        elseif output(ss).data(1).leftRightFlag(1)==2
            rightBlocks=1:2:10;
            leftBlocks=2:2:10;
        end
        
        [fwdBLeft100(:,:,:,:,ss), fwdBRight100(:,:,:,:,ss), bwdBLeft100(:,:,:,:,ss), bwdBRight100(:,:,:,:,ss), fwRawLeft100(:,:,:,:,ss), fwRawRight100(:,:,:,:,ss), bwRawLeft100(:,:,:,:,ss), bwRawRight100(:,:,:,:,ss)]=waveTriggerAnalyzer(data.sbjWaveDataAllFreqs.data100,leftBlocks,rightBlocks);
    end
    
    %db
    results100.fwdBLeft=fwdBLeft100;
    results100.fwdBRight=fwdBRight100;
    results100.bwdBLeft=bwdBLeft100;
    results100.bwdBRight=bwdBRight100;

    %raw
    results100.fwRawLeft=fwRawLeft100;
    results100.fwRawRight=fwRawRight100;
    results100.bwRawLeft=bwRawLeft100;
    results100.bwRawRight=bwRawRight100;

  
end



function [fwdBLeft,fwdBRight,bwdBLeft,bwdBRight,fwRawLeft,fwRawRight,bwRawLeft,bwRawRight]=waveTriggerAnalyzer(data100,leftBlocks,rightBlocks)

    for bb=1:size(data100,2)
        if size(data100(bb).fwMax,4)==15
            fwdB=10*log10(data100(bb).fwMax./data100(bb).fwMaxSS);
            bwdB=10*log10(data100(bb).bwMax./data100(bb).bwMaxSS);
            fwdBav(:,:,:,bb)=nanmean(fwdB,4); %averagin trials
            bwdBav(:,:,:,bb)=nanmean(bwdB,4);
            fwRawAv(:,:,:,bb)=nanmean(data100(bb).fwMax,4); %averagin trials
            bwRawAv(:,:,:,bb)=nanmean(data100(bb).bwMax,4);
        else %in case it happens to be empty it's because because we missed a trigger, hence we can't know which trial is which. We go NaN
            fregLen = 45;
            timeLen = 13;
            fwdBav(:,:,:,bb)=NaN*ones(size(data100(1).fwMax,1),fregLen,timeLen); 
            bwdBav(:,:,:,bb)=NaN*ones(size(data100(1).fwMax,1),fregLen,timeLen);
            fwRawAv(:,:,:,bb)=NaN*ones(size(data100(1).fwMax,1),fregLen,timeLen); 
            bwRawAv(:,:,:,bb)=NaN*ones(size(data100(1).fwMax,1),fregLen,timeLen);
        end
       
    end
    
    fwRawLeft=fwRawAv(:,:,:,leftBlocks);
    fwRawRight=fwRawAv(:,:,:,rightBlocks);
    bwRawLeft=bwRawAv(:,:,:,leftBlocks);
    bwRawRight=bwRawAv(:,:,:,rightBlocks);
    
    fwdBLeft=fwdBav(:,:,:,leftBlocks);
    fwdBRight=fwdBav(:,:,:,rightBlocks);
    bwdBLeft=bwdBav(:,:,:,leftBlocks);
    bwdBRight=bwdBav(:,:,:,rightBlocks);
    
end
