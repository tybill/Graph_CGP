function res = get_cgp(X, type)
n = size(X,1);
switch type
    case 1
        res = 1-trace(X'*X)./n;
end

end