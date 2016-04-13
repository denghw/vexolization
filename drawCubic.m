function [ cube ] = drawCubic(origin,X,Y,Z,color)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ver = [1 1 0;
    0 1 0;
    0 1 1;
    1 1 1;
    0 0 1;
    1 0 1;
    1 0 0;
    0 0 0];

fac = [1 2 3 4;
    4 3 5 6;
    6 7 8 5;
    1 2 8 7;
    6 7 1 4;
    2 3 5 8];

cube = [ver(:,1)*X+origin(1),ver(:,2)*Y+origin(2),ver(:,3)*Z+origin(3)]
patch('Faces',fac,'Vertices',cube,'FaceColor',color,'FaceAlpha',0.3,'EdgeAlpha',0.3);

end

