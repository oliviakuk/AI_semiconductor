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
Nrepeat = 2;

VslLTP1 = [0 0 trise Vread trise+twidth Vread trise+twidth+tfall 0 trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0];
VinLTP1 = [0 0 trise Vread trise+twidth Vread trise+twidth+tfall 0 trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0];

Mttotal = ttotal*ones(1,length(VslLTP1));
for i = 1:length(Mttotal)/2
    Mttotal(1,2*i) = 0;
end

VslLTPnext = [];
VslLTPprev = VslLTP1;

for i = 1:Nrepeat-1    
    VslLTPadd = VslLTP1+i.*Mttotal;
    VslLTPnext = [VslLTPprev,VslLTPadd];
    VslLTPprev = VslLTPnext;
end

VslLTPall = VslLTPprev;
OutVslLTP = join(mat2str(VslLTPall));

VinLTPnext = [];
VinLTPprev = VinLTP1;

for i = 1:Nrepeat-1    
    VinLTPadd = VinLTP1+i.*Mttotal;
    VinLTPnext = [VinLTPprev,VinLTPadd];
    VinLTPprev = VinLTPnext;
end

VinLTPall = VinLTPprev;
OutVinLTP = join(mat2str(VinLTPall));

%

VslLTD1 = [0 0 trise Vread trise+twidth Vread trise+twidth+tfall 0 trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0];
VinLTD1 = [0 0 trise Vread trise+twidth Vread trise+twidth+tfall 0 trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth Vset trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall 0 trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff+trise+twidth+tfall+toff 0];


Mttotal = ttotal*ones(1,length(VslLTD1));
for i = 1:length(Mttotal)/2
    Mttotal(1,2*i) = 0;
end

VslLTDnext = [];
VslLTDprev = VslLTD1+Nrepeat.*Mttotal;

for i = 1:Nrepeat-1    
    VslLTDadd = VslLTD1+(Nrepeat+i).*Mttotal;
    VslLTDnext = [VslLTDprev,VslLTDadd];
    VslLTDprev = VslLTDnext;
end

VslLTDall = VslLTDprev;
OutVslLTD = join(mat2str(VslLTDall));

VinLTDnext = [];
VinLTDprev = VinLTD1+Nrepeat.*Mttotal;

for i = 1:Nrepeat-1    
    VinLTDadd = VinLTD1+(Nrepeat+i).*Mttotal;
    VinLTDnext = [VinLTDprev,VinLTDadd];
    VinLTDprev = VinLTDnext;
end

VinLTDall = VinLTDprev;
OutVinLTD = join(mat2str(VinLTDall));


Vslall = [VslLTPall, VslLTDall];
Vinall = [VinLTPall, VinLTDall];

for i = 1:length(Vslall)/2
    Vslallt(i,1)=Vslall(2*i-1);
    Vslallt(i,2)=Vslall(2*i);
    Vinallt(i,1)=Vinall(2*i-1);
    Vinallt(i,2)=Vinall(2*i);
end

OutVslLTPLTD = join(mat2str(Vslall));
OutVinLTPLTD = join(mat2str(Vinall)); 

writematrix(Vslallt,'Vsl.dat','Delimiter','tab');
writematrix(Vinallt,'Vin.dat','Delimiter','tab');

% fid = fopen('Vslallt.dat','w');
% fwrite(fid, Vslallt, 'double');
% fclose(fid);
% 
% fid = fopen('Vinallt.dat','w');
% fwrite(fid, Vinallt,'double');
% fclose(fid);