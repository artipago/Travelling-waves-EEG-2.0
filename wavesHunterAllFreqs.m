function [fwMax,bwMax]=wavesHunterAllFreqs(data,samplingRate)

    numberElectrodes=size(data,1);
    yElec=1:numberElectrodes;
    durationSignal=size(data,2)/samplingRate; %it's in second.
    dF = 1/durationSignal;                   
    fx = -samplingRate/2:dF:samplingRate/2-dF;         
    fy=(size(data,1)/2)*linspace(-1,1,size(data,1));
    sbj2DFFT=abs(fftshift(fft2(data)));
    
    fwMax=max(sbj2DFFT(fy<0, fx>=1 & fx<=45));
    bwMax=max(sbj2DFFT(fy>0, fx>=1 & fx<=45));
    

end

    