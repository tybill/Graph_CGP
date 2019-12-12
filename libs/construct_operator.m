function res = construct_operator(operator)
[V,E] = eig(operator);
E = round(diag(E),3);
M = containers.Map(E(1), V(:,1)*V(:,1)');

for i = 2:length(E)
    if M.isKey(E(i))
        M(E(i)) = M(E(i)) + V(:,i)*V(:,i)';
    else
        M(E(i)) = V(:,i)*V(:,i)';
    end
end

Es = M.values();
res = zeros(length(Es{1}));
for i = 1:length(Es)
    res = res + Es{i}.*Es{i};
end
end