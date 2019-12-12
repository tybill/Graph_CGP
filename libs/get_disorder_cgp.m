function res = get_disorder_cgp(operator, types, w)
n = size(operator,1);
offset = diag(2.*w.*rand(1,n)-w);
operator = operator + offset;
operator = construct_operator(operator);

func = @(t)get_cgp(operator, t);
res = arrayfun(func, types);
end