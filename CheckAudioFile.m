function [y, ad_x] = CheckAudioFile(fileName)
[y, Fs] = audioread(fileName);
%info = audioinfo(fileName);
%sound(y, Fs);
fileID = fopen(fileName, 'rb');
fseek(fileID, 1024, 'bof');
ad_x = fread(fileID, 'int16');
fclose(fileID);
end