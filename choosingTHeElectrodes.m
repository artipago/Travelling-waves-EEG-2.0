function eletrodesLines=choosingTHeElectrodes()


channelsLabel ={'Fp1','AF7','AF3','F1','TP9','F5h','F7','FT7','FC5h','PO9','FC1','C1','C3','C5','T7','TP7','CP5','CP3','CP1','P1','I1','P5h','P7','P9','PO7','PO3','O1','Iz','Oz','POz','Pz','CPz','Fpz','Fp2','AF8','AF4','AFz','Fz','F2','TP10','F6h','F8','FT8','FC6h','PO10','FC2','FCz','Cz','C2','C4','C6','T8','TP8','CP6','CP4','CP2','P2','I2','P6h','P8','P10','PO8','PO4','O2','EXG1','EXG2','EXG3','EXG4','EXG5','EXG6','EXG7','EXG8'};

eletrodesLines(1,:)=[24 23 17 14 9 6 3];
eletrodesLines(2,:)=[10 25 22 18 13 11 4];
eletrodesLines(3,:)=[10 25 22 18 12 11 4];
eletrodesLines(4,:)=[27 26 20 19 12 11 4];
eletrodesLines(5,:)=[27 26 20 19 12 47 38];
eletrodesLines(6,:)=[29 30 31 32 48 47 38];
eletrodesLines(7,:)=[64 63 57 56 49 47 38];
eletrodesLines(8,:)=[64 63 57 56 49 46 39];
eletrodesLines(9,:)=[45 62 59 55 49 46 39];
eletrodesLines(10,:)=[45 62 59 55 50 46 39];
eletrodesLines(11,:)=[61 60 54 51 44 41 36];

eletrodesLines(12,:)=[14 13 12 48 49 50 51];
eletrodesLines(13,:)=[10 25 22 19 48 46 39];
eletrodesLines(14,:)=[45 62 59 56 48 11 4];

channelsLabel(eletrodesLines)


end