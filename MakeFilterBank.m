function [aad_H] = MakeFilterBank()
fileID = fopen('GTFB_40_1024_200_8000_16000.bin', 'w');
aad_H = ComputeFilterResponse(40, 1024, 200, 8000, 16000);
aad_H = abs(NormalizeFilterGain(aad_H, 16000));
%plot(linspace(0, 8000, length(aad_H)), 20 * log10(aad_H));
for i = 1:40
    fwrite(fileID, aad_H(:,i), 'double');
end
fclose(fileID);
end