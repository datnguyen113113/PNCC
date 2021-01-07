% figure
% fid = fopen('out_Bigtips_Pink_PNCC.bin', 'rb');
% iNumFrame = (fread(fid, 1, 'int32')) / 39;
% aad_DCT = zeros(39, iNumFrame);
% for i = 1:iNumFrame
%     aad_DCT(:,i) = fread(fid, 39, 'float');
% end
% fclose(fid);
aad_DCT = PNCC_IEEETran('out_Recording_Son_Dat_PNCC.feat', 'Recording-Son-Dat.wav');
% aad_Spec       = idct(aad_DCT, 40);
% dMean = mean(aad_Spec(:));
% dStd  = std(aad_Spec(:));
% 
% dShift = 35 - dMean;
% dScale = 10 / dStd;
% 
% aad_IDCT = dScale * idct(aad_DCT, 40) + dShift;
[X, Y] = meshgrid(1:size(aad_DCT, 2), 1:size(aad_DCT, 1));
mesh(X, Y, aad_DCT);
% 
figure
aad_DCT = PNCC_IEEETran('out_Recording_Son_Son_PNCC.feat', 'Recording-Son-Son.wav');

% aad_IDCT = dScale * idct(aad_DCT, 40) + dShift;
[X, Y] = meshgrid(1:size(aad_DCT, 2), 1:size(aad_DCT, 1));
mesh(X, Y, aad_DCT);
% 
% figure
% fid = fopen('out_Bigtips_Factory_PNCC.bin', 'rb');
% iNumFrame = (fread(fid, 1, 'int32')) / 13;
% for i = 1:iNumFrame
%     aad_DCT(:,i) = fread(fid, 13, 'float');
% end
% fclose(fid);
% aad_IDCT = dScale * idct(aad_DCT, 40) + dShift;
% [X, Y] = meshgrid(1:size(aad_IDCT, 2), 1:size(aad_IDCT, 1));
% mesh(X, Y, aad_IDCT);
% 
% figure
% fid = fopen('out_Bigtips_Volvo_PNCC.bin', 'rb');
% iNumFrame = (fread(fid, 1, 'int32')) / 13;
% for i = 1:iNumFrame
%     aad_DCT(:,i) = fread(fid, 13, 'float');
% end
% fclose(fid);
% aad_IDCT = dScale * idct(aad_DCT, 40) + dShift;
% [X, Y] = meshgrid(1:size(aad_IDCT, 2), 1:size(aad_IDCT, 1));
% mesh(X, Y, aad_IDCT);
