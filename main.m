clc;
clear;
a=-1;
b=1.1;
Fn={@f,@g,@h};
mthd_name={'Trapez','Simpson','Gauss3'};
mthd={@Trapez, @Simpson, @Gauss3};
INTR=[];
ESP=[];
CONV=[];
r={1,2,4,8,16,32,64,128,256,512};
for i=1:length(Fn)
    Real=rint(a,b,Fn{i});
    for j=1:length(r)
        for k=1:length(mthd)
            IntM=mthd{k}(a,b,r{j},Fn{i});
            er=abs(IntM-Real);
            INTR(j,3*(i-1)+k)=IntM;
            ESP(j,3*(i-1)+k)=er;
        end
    end
end
for i=1:size(INTR,2)
    for j=2:size(INTR,1)
        CONV(j,i)=log10(ESP(j-1,i)/ESP(j,i))/log10(2);
    end
end


Col1=r.';
title1={'Method','consine','consine','consine','C1 function','C1 function','C1 function','normal dist','normal dist','normal dist';'Integrand','T rapezoidal','Simpson','Gauss3','Trapezoidal','Simpson','Gauss3','Trapezoidal','Simpson','Gauss3'};
title2={'Integrand','consine','consine','consine','C1 function','C1 function','C1 function','normal dist','normal dist','normal dist';'Method','T rapezoidal','Simpson','Gauss3','Trapezoidal','Simpson','Gauss3','Trapezoidal','Simpson','Gauss3'};
INTR=num2cell(INTR);
CONV=num2cell(CONV);
result1=[Col1 INTR];
result2=[Col1 CONV];
MethodIntegrand=[title1;result1];
IntegrandMethod=[title2;result2];
writecell(MethodIntegrand,'MethodIntegrand.csv');
writecell(IntegrandMethod,'IntegrandMethod.csv');



