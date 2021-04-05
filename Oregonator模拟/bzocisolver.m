function bsz = bzocisolver(t,y)
epsilon = 0.03;
p = 20*2;
q=0.06;
h=0.75;
bsz = [(y(1)+y(2)-y(1)*y(2)-q*y(1)^2)/epsilon;2*h*y(3)-y(2)-y(1)*y(2);
    (y(1)-y(3))/p];
end 
