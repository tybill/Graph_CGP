addpath('./libs/');

dims = [10,20,40,80,160,320];
samples = flip(dims);
weights = [0.0,0.001,0.005,0.0075,0.1,0.5,1,10,100];

Rl = [];
Rc = [];

for i = 1:length(dims)
    [l,c] = run(dims(i), samples(i), weights);
    Rl = [Rl;l];
    Rc = [Rc;c];
end

figure
subplot(2,1,1);
plot_graph_cgp(dims, Rl, weights, "Linear Graph", 1);

subplot(2,1,2);
plot_graph_cgp(dims, Rc, weights, "Complete Graph", 0);

function [l, c] = run(N, NSample, weights)
[H_l, H_c] = get_hamiltonian(N);

l = runHamiltonian(H_l, NSample, weights);
c = runHamiltonian(H_c, NSample, weights);
end

function [res] = runHamiltonian(H, NSample, weights)
func = @(t)get_disorder_cgp(H, 1, t);

res = zeros(1,length(weights));
parfor i = 1:length(weights)
    W = weights(i).*ones(1,NSample);
    RET = arrayfun(func, W);
    res(i) = 1 - mean(RET);    
end
end