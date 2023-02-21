function [res]=prepareWaves(results100)

    fwdB_L100 = squeeze(nanmean(nanmedian(results100.fwdBLeft,3),4));
    fwdB_R100 = squeeze(nanmean(nanmedian(results100.fwdBRight,3),4));
    bwdB_L100 = squeeze(nanmean(nanmedian(results100.bwdBLeft,3),4));
    bwdB_R100 = squeeze(nanmean(nanmedian(results100.bwdBRight,3),4));
    
    % putting together left and right / contra first
    fwdB = (fwdB_R100(1:11,:,:) + fwdB_L100(11:-1:1,:,:))./2;
    bwdB = (bwdB_R100(1:11,:,:) + bwdB_L100(11:-1:1,:,:))./2;


    res.fwdB=fwdB;
    res.bwdB=bwdB;
    
end



