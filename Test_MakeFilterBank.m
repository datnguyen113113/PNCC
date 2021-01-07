function [] = Test_MakeFilterBank()
fileID = fopen('GTFB_40_1024_200_8000_16000.bin', 'r');
A = zeros(512, 40);
for i = 1:40
    for j = 1:512
        A(j,i) = fread(fileID, 1, 'double');
    end 
end
plot(linspace(0, 8000, length(A)), 20 * log10(A));
fclose(fileID);
end