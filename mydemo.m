offobj = offLoader('../airplane_0627.off');
 
FV = struct();
FV.vertices = offobj.vmat;
FV.faces = offobj.fmat;

%%visualization unnormalized 3D object

% show3DModel(FV.faces,FV.vertices,0);
% pause(1);

%%visualization normalized 3D object

show3DModel(FV.faces,FV.vertices,100); 
%imwrite(gcf,'untitle.jpg');
%saveas(gcf,'untitle.eps')
%%Voxelization
figure;
axis off;
Volume=polygon2voxel(FV,100,'auto',false);
plot3D(Volume);

% figure;
% axis off;
% Volume=polygon2voxel(FV,50,'auto');
% plot3D(Volume);
% 
%   figure,
%   subplot(1,3,1), imshow(squeeze(Volume(25,:,:)));
%   subplot(1,3,2), imshow(squeeze(Volume(:,25,:)));
%   subplot(1,3,3), imshow(squeeze(Volume(:,:,25)));


% figure;
% axis off;
% Volume=polygon2voxel(FV,30,'auto');
% plot3D(Volume);








 