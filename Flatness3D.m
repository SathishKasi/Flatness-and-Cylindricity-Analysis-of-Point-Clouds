function [ flatness,pointID, faceIDs ] = Flatness3D( xx,yy,zz )
%Flatness3D calculated the flatness of surface given by point cloud data
%   

%calculate convecHull
ch = convhull(xx,yy,zz);
%find array of all vertices 
chVertTmp=[ch(:,1)' ch(:,2)' ch(:,3)'];
chVert= unique(chVertTmp);
clear chVertTmp;
nVertSize=length(chVert);


d =zeros(length(ch),1);
dI=zeros(length(ch),1);

for i=1:length(ch)
     P1id = ch(i,1);
     P2id = ch(i,2);
     P3id = ch(i,3);
     P1=[xx(P1id) yy(P1id) zz(P1id) ];
     P2=[xx(P2id) yy(P2id) zz(P2id) ];
     P3=[xx(P3id) yy(P3id) zz(P3id) ];
     n=cross(P1-P2,P1-P3);


     md=zeros(nVertSize,1);
     for j=1:nVertSize %check all vertices on conv hull
             jToCheck=chVert(j);
             if( (jToCheck~= P1id) &&  (jToCheck~= P2id) && (jToCheck ~= P3id) )
             Qj = [xx(jToCheck) yy(jToCheck) zz(jToCheck)]; 
             dotnQj=dot(n,Qj);
             n1=[n -dotnQj];
             n2=[P1 1];
             signRef=sign(dot(n1,n2));
             
             count = 0;
             for k=1:nVertSize
                 kToCheck=chVert(k);
                 Q = [xx(kToCheck) yy(kToCheck) zz(kToCheck)];
                 n2 = [Q 1];
                 signToTest=sign(dot(n1,n2));
                 if signToTest == 0
                         count = count+1;
                 else
                     if signToTest == signRef
                        count = count+1;
                     end
                 end
             end
             if count == nVertSize
                Q1 = [xx(jToCheck) yy(jToCheck) zz(jToCheck)];
                v=P1-Q1;
                dist=abs(dot(v,n))/norm(n);
                dI(i) = jToCheck;
                d(i)=dist;
             end
             end
     end
end


[flatness,id]=min(d);
pointID=dI(id);
faceID=id;

faceIDs=[ch(faceID,1) ch(faceID,2) ch(faceID,3) ch(faceID,1)];

end
 


