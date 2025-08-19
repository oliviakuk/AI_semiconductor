clc
clear all

Vselect = 1.28;
Vset = 1.3;
Vreset = -1.3;
Vread = 0.1;
trise = 1;
tfall = 1;
%trise = 10E-6;
%tfall = 10E-6;
%twidth = 0.004998;
twidth = 2;
toff = trise + tfall + twidth;
ttotal = (trise + twidth + tfall + toff) * 2;
NrepeatLTP = 1;
NrepeatLTD = 6;
Nrepeat = 3;
% LTP sequence
VslLTP1 = [0 0 trise Vselect trise + twidth Vselect trise + twidth + tfall 0 trise + twidth + tfall + toff 0 trise + twidth + tfall + toff + trise Vselect trise + twidth + tfall + toff + trise + twidth Vselect trise + twidth + tfall + toff + trise + twidth + tfall 0 trise + twidth + tfall + toff + trise + twidth + tfall + toff 0];
VinLTP1 = [0 0 0 0 0 0 0 0 0 0 trise Vread trise + twidth Vread trise + twidth + tfall 0 trise + twidth + tfall + toff 0];
MttotalLTP = ttotal * ones(1, length(VslLTP1));
for i = 1:length(MttotalLTP)/2
    MttotalLTP(1, 2*i) = 0;
end

VslLTPnext = [];
VslLTPprev = VslLTP1;

for i = 1:NrepeatLTP-1    
    VslLTPadd = VslLTP1 + i.*MttotalLTP;
    VslLTPnext = [VslLTPprev, VslLTPadd];
    VslLTPprev = VslLTPnext;
end

VslLTPall = VslLTPprev;
OutVslLTP = join(mat2str(VslLTPall));

VinLTPnext = [];
VinLTPprev = VinLTP1;

for i = 1:NrepeatLTP-1    
    VinLTPadd = VinLTP1 + i.*MttotalLTP;
    VinLTPnext = [VinLTPprev, VinLTPadd];
    VinLTPprev = VinLTPnext;
end

VinLTPall = VinLTPprev;
OutVinLTP = join(mat2str(VinLTPall));

% LTD sequence
VslLTD1 = [0 0 trise Vselect trise + twidth Vselect trise + twidth + tfall 0 trise + twidth + tfall + toff 0 trise + twidth + tfall + toff + trise Vselect trise + twidth + tfall + toff + trise + twidth Vselect trise + twidth + tfall + toff + trise + twidth + tfall 0 trise + twidth + tfall + toff + trise + twidth + tfall + toff 0];
VinLTD1 = [0 0 trise Vset trise + twidth Vset trise + twidth + tfall 0 trise + twidth + tfall + toff 0 trise + twidth + tfall + toff + trise Vset trise + twidth + tfall + toff + trise + twidth Vset trise + twidth + tfall + toff + trise + twidth + tfall 0 trise + twidth + tfall + toff + trise + twidth + tfall + toff 0];

% LTD
MttotalLTD = ttotal * ones(1, length(VslLTD1));
for i = 1:length(MttotalLTD)/2
    MttotalLTD(1, 2*i) = 0;
end

VslLTDnext = [];
VslLTDprev = VslLTD1;

for i = 1:NrepeatLTD-1    
    VslLTDadd = VslLTD1 + i.*MttotalLTD;
    VslLTDnext = [VslLTDprev, VslLTDadd];
    VslLTDprev = VslLTDnext;
end

VslLTDall = VslLTDprev;
OutVslLTD = join(mat2str(VslLTDall));

VinLTDnext = [];
VinLTDprev = VinLTD1;

for i = 1:NrepeatLTD-1    
    VinLTDadd = VinLTD1 + i.*MttotalLTD;
    VinLTDnext = [VinLTDprev, VinLTDadd];
    VinLTDprev = VinLTDnext;
end

VinLTDall = VinLTDprev;
OutVinLTD = join(mat2str(VinLTDall));

% Combine LTP and LTD sequences
Vslall = [VslLTPall, VslLTDall];
Vinall = [VinLTPall, VinLTDall];

% total
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Mttotaltotal = ttotal * ones(1, length(Vinall));
for i = 1:length(Mttotaltotal)/2
    Mttotaltotal(1, 2*i) = 0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vintotalnext = [];
Vintotalprev = Vinall;

for i = 1:Nrepeat-1    
    Vintotaladd = Vinall + i*Mttotaltotal;
    Vintotalnext = [Vintotalprev, Vintotaladd];
    Vintotalprev = Vintotalnext;
end

Vintotalall = Vintotalprev;
OutVintotal = join(mat2str(Vintotalall));

Vinallall = Vintotalall;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write to files

for i = 1:length(Vinallall)/2
    Vinallt(i,1) = Vinallall(2*i-1);
    Vinallt(i,2) = Vinallall(2*i);
end

OutVslLTPLTD = join(mat2str(Vslall));
OutVinLTPLTD = join(mat2str(Vinall)); 

%writematrix(Vslallt,'Vsl.dat','Delimiter','tab');
writematrix(Vinallt,'Vin.dat','Delimiter','tab');
