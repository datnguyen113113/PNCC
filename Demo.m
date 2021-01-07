
close all
%Figure for Matlab code 
figure
subplot(4, 1, 1)
aadDCT = PNCC_IEEETranForDemo('out_Bigtips_Clean_Matlab_LOG.feat', 'bigtips_16.wav', 1, 1);
aadSpec       = idct(aadDCT, 40);
dMean = mean(aadSpec(:));
dStd  = std(aadSpec(:));

dShift = 35 - dMean;
dScale = 10 / dStd;

image(dScale * idct(aadDCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (clean)')

subplot(4, 1, 2)
aadDCT = PNCC_IEEETranForDemo('out_Bigtips_White_Matlab_LOG.feat', 'bigtips_whiter1_16.wav' , 1, 1);
image(dScale * idct(aadDCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (white 5-dB)')

subplot(4, 1, 3)
aadDCT = PNCC_IEEETranForDemo('out_Bigtips_Factory_Matlab_LOG.feat', 'bigtips_factoryr1_16.wav' , 1, 1);
image(dScale * idct(aadDCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (factory 5-dB)')

subplot(4, 1, 4)
aadDCT = PNCC_IEEETranForDemo('out_Bigtips_Volvo_Matlab_LOG.feat', 'bigtips_volvor1_16.wav', 1, 1);
image(dScale * idct(aadDCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (volvo 5-dB)')

%Figure for C code 
figure
subplot(4, 1, 1)
fid = fopen('out_Bigtips_Clean_PNCC.bin', 'rb');
iNumFrame = (fread(fid, 1, 'int32')) / 13;
aad_DCT = zeros(13, iNumFrame);
for i = 1:iNumFrame
    aad_DCT(:,i) = fread(fid, 13, 'float');
end
fclose(fid);
aad_Spec       = idct(aad_DCT, 40);
dMean = mean(aad_Spec(:));
dStd  = std(aad_Spec(:));

dShift = 35 - dMean;
dScale = 10 / dStd;

image(dScale * idct(aad_DCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (clean)')

subplot(4, 1, 2)
fid = fopen('out_Bigtips_White_PNCC.bin', 'rb');
iNumFrame = (fread(fid, 1, 'int32')) / 13;
for i = 1:iNumFrame
    aad_DCT(:,i) = fread(fid, 13, 'float');
end
fclose(fid);
image(dScale * idct(aad_DCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (street 5-dB)')

subplot(4, 1, 3)
fid = fopen('out_Bigtips_Factory_PNCC.bin', 'rb');
iNumFrame = (fread(fid, 1, 'int32')) / 13;
for i = 1:iNumFrame
    aad_DCT(:,i) = fread(fid, 13, 'float');
end
fclose(fid);
image(dScale * idct(aad_DCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (factory 5-dB)')

subplot(4, 1, 4)
fid = fopen('out_Bigtips_Volvo_PNCC.bin', 'rb');
iNumFrame = (fread(fid, 1, 'int32')) / 13;
for i = 1:iNumFrame
    aad_DCT(:,i) = fread(fid, 13, 'float');
end
fclose(fid);
image(dScale * idct(aad_DCT, 40) + dShift); axis xy;
xlabel('Frame index')
ylabel('Channel frequency index')
title('PNCC (volvo 5-dB)')

if ispc == 1
   !del *.feat 
end

if isunix == 1
    !rm -f *.feat
end


