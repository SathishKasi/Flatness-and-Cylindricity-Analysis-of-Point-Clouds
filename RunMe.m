clear; clc;

filename = 'MAG11/Plane_6.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);

 k = [1, 2, 3]; 
 PCD=A.data(:,k); 
 xx=A.data(:,1); 
 yy=A.data(:,2);
 zz=A.data(:,3);
 
% 
% xx=A.data(:,1)+A.data(:,5); yy=A.data(:,2)+A.data(:,6);
% zz=A.data(:,3)+A.data(:,7);

[flatness,pointID,faceIDs]=Flatness3D(xx,yy,zz);

xlabel('x','FontSize', 15);
hold on
ylabel('y','FontSize', 15);
zlabel('z','FontSize', 15);
xt = get(gca, 'XTick'); set(gca, 'FontSize', 12)
scatter3(xx,yy,zz,'bo'); 
print('Example','-dpng','-r200');

ch = convhull(xx,yy,zz);
hh=trisurf(ch,xx,yy,zz);
C_Tri=[1 1 1];
set(hh,'FaceColor','flat',...
       'FaceVertexCData',C_Tri,...
       'CDataMapping','scaled');
print('CnnvHullExample','-dpng','-r200');

title(['flatness=' num2str(flatness) '']);
 
plot3(xx(pointID),yy(pointID),zz(pointID),'ro','MarkerSize',10,'MarkerFaceColor',[0 0 0]);
plot3(xx(faceIDs),yy(faceIDs),zz(faceIDs),'k-','LineWidth',10);
 
print('CnnvHullExampleMarked','-dpng','-r200');
