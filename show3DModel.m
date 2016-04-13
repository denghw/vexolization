function show3DModel(faces,vertices,normalSize)
%
% this function draws a 3D CG model with the normal of their faces
% the normal is computed by left-hand-rule
% http://stackoverflow.com/questions/1516296/find-the-normal-angle-of-the-face-of-a-triangle-in-3d-given-the-co-ordinated-of
% i.e. vertices are ordered clockwise with respect to its outward normal
% 
% input:
% faces is Nx3 matrix for vertex index
% vertices is Kx3 matrix
%
% demo:
% load model;
% show3DModel(faces,vertices);

if normalSize ~= 0
    vertices = vertices - repmat(mean(vertices,1),size(vertices,1),1);
    maxV = max(abs(vertices(:)));
    scale_ratio = maxV * 1.0 / normalSize;
    vertices = vertices / scale_ratio;
end
X = reshape(vertices(faces(:),1),size(faces))';
Y = reshape(vertices(faces(:),2),size(faces))';
Z = reshape(vertices(faces(:),3),size(faces))';

fill3(X,Y,Z,[1,1,1]);

% drawCubic([-100,-100,-100],200,200,200,'none');

% grid on;
% hold on;
 axis equal;
  axis off;