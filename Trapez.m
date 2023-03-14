function T=Trapez(a,b,n,fn)
h=(b-a)/n;
T=0;
for i=1:(n-1)
    x=a+h*i;
    T=T+fn(x);
end
T=h*(fn(a)+fn(b))/2+h*T;
