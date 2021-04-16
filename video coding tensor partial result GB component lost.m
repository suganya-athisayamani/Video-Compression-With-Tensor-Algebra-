cd('Path);
obj = mmreader('clip25.avi');
videos = read(obj);
s=size(videos);
videos=double(videos);
%for i=1:size(4)
video1=videos(:,:,:,1:2);
size_core = mlrankest(video1);
fact_mat=cpd(video1,1);
options.MaxIter = 1;
options.TolFun = 1e-6;
[U,S,output] = lmlra_hooi(video1,fact_mat,options);
fact1=fact_mat{1,1};
fact2=fact_mat{1,2};
fact3=fact_mat{1,3};
fact4=fact_mat{1,4};
U1=U{1,1};
U2=U{1,2};
U3=U{1,3};
U4=U{1,4};
for i=1:s(1)
for j=1:s(2)
for k=1:s(3)
for l=1:2
b=fact1(i)*fact2(j)*fact3(k)*fact4(l);
B(i,j,k,l)=S*U1(i)*U2(j)*U3(k)*U4(l);
end
end
end
end

for i=1:s(1)
for j=1:s(2)
for k=1:s(3)
for l=1:2
b=fact1(i)*fact2(j)*fact3(k)*fact4(l);
B(i,j,k,l)=S*U1(i)*U2(j)*U3(k)*U4(l);
end
end
end
end
B1=B(:,:,:,1);
figure,imshow(uint8(B1));
v1=video1(:,:,:,1)
B1-v1
B2=B1+ans
figure,imshow(uint8(B2));
figure,imshow(uint8(v1));
B1=B(:,:,:,1);
figure,imshow(uint8(B1));
v1=video1(:,:,:,1)
B12=B1-v1;
B2=B1+B12;
figure,imshow(uint8(B2));
figure,imshow(uint8(v1));
imtool(uint8(B2));
imtool(uint8(v1));
B12(:,:,1)=B1(:,:,1)-v1(:,:,1);
B2(:,:,1)=B1(:,:,1)+B12(:,:,1);
B12(:,:,2)=B1(:,:,2)-v1(:,:,2);
B2(:,:,2)=B1(:,:,2)+B12(:,:,2);
B12(:,:,3)=B1(:,:,3)-v1(:,:,3);
B2(:,:,3)=B1(:,:,3)+B12(:,:,3);