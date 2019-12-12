function [H_l, H_c] = get_hamiltonian(N)
H_l = full(gallery('tridiag',N,1,0,1));
H_c = ones(N) - eye(N);
end