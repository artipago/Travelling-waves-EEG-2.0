function plotResBlock(res100)

%it's always attention RIGHT (the left have been flipped)

fx = 2:2:45;


e11=1;
e12=5;

e21=7;
e22=11;

fTheta1 = 3;
fTheta2 = 7;

fAlpha1=8;
fAlpha2=12;

fBetaLow1=14;
fBetaLow2=24;

fBetaHigh1=25;
fBetaHigh2=35;

thetaFW = squeeze(nanmean(res100.fwdB(:,fx>=fTheta1 & fx<=fTheta2,:),2));
thetaBW = squeeze(nanmean(res100.bwdB(:,fx>=fTheta1 & fx<=fTheta2,:),2));

alphaFW = squeeze(nanmean(res100.fwdB(:,fx>=fAlpha1 & fx<=fAlpha2,:),2));
alphaBW = squeeze(nanmean(res100.bwdB(:,fx>=fAlpha1 & fx<=fAlpha2,:),2));

betaFWlow = squeeze(nanmean(res100.fwdB(:,fx>=fBetaLow1 & fx<=fBetaLow2,:),2));
betaBWlow = squeeze(nanmean(res100.bwdB(:,fx>=fBetaLow1 & fx<=fBetaLow2,:),2));

betaFWhigh = squeeze(nanmean(res100.fwdB(:,fx>=fBetaHigh1 & fx<=fBetaHigh2,:),2));
betaBWhigh = squeeze(nanmean(res100.bwdB(:,fx>=fBetaHigh1 & fx<=fBetaHigh2,:),2));


%centering
thetaFW = normalizingFunction(thetaFW);
thetaBW = normalizingFunction(thetaBW);
alphaFW = normalizingFunction(alphaFW);
alphaBW = normalizingFunction(alphaBW);
betaFWlow = normalizingFunction(betaFWlow);
betaBWlow = normalizingFunction(betaBWlow);
betaFWhigh = normalizingFunction(betaFWhigh);
betaBWhigh = normalizingFunction(betaBWhigh);


figure
subplot(2,2,1)
hold on
errorbar(nanmean(alphaFW,2),nanstd(alphaFW,0,2)./sqrt(size(alphaFW,2)),'b')
errorbar(nanmean(alphaBW,2),nanstd(alphaBW,0,2)./sqrt(size(alphaBW,2)),'r')
title('Alpha')

subplot(2,2,2)
hold on
errorbar(nanmean(thetaFW,2),nanstd(thetaFW,0,2)./sqrt(size(thetaFW,2)),'b')
errorbar(nanmean(thetaBW,2),nanstd(thetaBW,0,2)./sqrt(size(thetaBW,2)),'r')
title('Theta')

subplot(2,2,3)
hold on
errorbar(nanmean(betaFWlow,2),nanstd(betaFWlow,0,2)./sqrt(size(betaFWlow,2)),'b')
errorbar(nanmean(betaBWlow,2),nanstd(betaBWlow,0,2)./sqrt(size(betaBWlow,2)),'r')
title('Low Beta')

subplot(2,2,4)
hold on
errorbar(nanmean(betaFWhigh,2),nanstd(betaFWhigh,0,2)./sqrt(size(betaFWhigh,2)),'b')
errorbar(nanmean(betaBWhigh,2),nanstd(betaBWhigh,0,2)./sqrt(size(betaBWhigh,2)),'r')
title('High Beta')


contraAlphaFW = nanmean(alphaFW(e11:e12,:),1);
ipsiAlphaFW = nanmean(alphaFW(e21:e22,:),1);
contraAlphaBW = nanmean(alphaBW(e11:e12,:),1);
ipsiAlphaBW = nanmean(alphaBW(e21:e22,:),1);


figure
subplot(1,2,1)
hold on
errorbar(nanmean(alphaFW,2),nanstd(alphaFW,0,2)./sqrt(size(alphaFW,2)),'b')
errorbar(nanmean(alphaBW,2),nanstd(alphaBW,0,2)./sqrt(size(alphaBW,2)),'r')
title('Alpha')

subplot(1,2,2)
hold on
errorbar(nanmean([contraAlphaFW' ipsiAlphaFW'],1),nanstd([contraAlphaFW' ipsiAlphaFW'],0,1)./sqrt(size(ipsiAlphaFW,2)),'b')
errorbar(nanmean([contraAlphaBW' ipsiAlphaBW'],1),nanstd([contraAlphaBW' ipsiAlphaBW'],0,1)./sqrt(size(ipsiAlphaFW,2)),'r')
title('Alpha')


end

function newAlphaFW = normalizingFunction(alphaFW)

    for ii=1:size(alphaFW,1)
        normalizer(ii,:)=(alphaFW(ii,:)+alphaFW(12-ii,:))./2;
        normalizer(12-ii,:)=(alphaFW(ii,:)+alphaFW(12-ii,:))./2;
    end
    normalizer(6,:)=alphaFW(6,:);

    newAlphaFW = alphaFW - normalizer;
%     newAlphaFW = alphaFW ;
end


