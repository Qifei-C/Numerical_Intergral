function G3=Gauss3(a,b,n,fn)
t=abs((b-a)/n);
a0=a;
G3=0;
for i=1:n
    b0=a0+t;
    G3=G3+((b0-a0)/2)*((5/9)*fn((-sqrt(15)/5)*((b0-a0)/2)+(b0+a0)/2)+(8/9)*fn((b0+a0)/2)+(5/9)*fn((sqrt(15)/5)*((b0-a0)/2)+(b0+a0)/2));
    a0=b0;
end
