function S=Simpson(a,b,n,fn)
h=(b-a)/(2*n);
S0=fn(a)+fn(b);
S1=0;
S2=0;
for i=1:(2*n-1)
    x=a+i*h;
    if mod(i,2)==0
        S2=S2+fn(x);
    else 
        S1=S1+fn(x);
    end
end
S=h*(S0+4*S1+2*S2)/3;

