function res = read_adjacency(n, filename)
filename = sprintf(filename, n);
res = read(filename);
res = permute(res,[2,3,1]);
end

function res = read(filename)
fid = fopen(filename); 
raw = fread(fid,inf); 
str = char(raw'); 
fclose(fid); 
res = jsondecode(str);
end