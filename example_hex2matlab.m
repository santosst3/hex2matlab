fname = 'example.txt';

length_v = 2500;
n_data = 11;
data_matrix = zeros(length_v,n_data);

ratio_corr = [1 1 .1 1 .1 1 1 1 1 .1 1]*1000;

decData = hex2matlab(fname,'int16');
for k = 1 : n_data
    data_matrix(:,k) = decData(((k-1)*length_v+1):k*length_v)/ratio_corr(k);
end
n_final = fname;
n_final(end-2:end) = 'dat';
writematrix(round(data_matrix, 6),n_final)

clear decData