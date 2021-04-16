clc
clear all;
clear all;
close all;
 [filename, user_cancelled] = imgetfile;
     if user_cancelled
             disp('User pressed cancel');
     else
             disp(['User selected ', filename]);
     end
        disp('Reading the image');
obj = mmreader(filename);
video11 = read(obj);
s=size(video11);
video111=double(video11);
%for i=1:size(4)
video1=video111(:,:,:,1:50);
size_core = mlrankest(video1);
[U S]=lmlra(video1,size_core);
res=lmlrares(video1,U,S);
s1=size(res);
s2=size(res);
for l=1:s2(4) for i=1:s2(1)
for j=1:s2(2)
for k=1:s2(3)
if(abs(res(i,j,k,l))<=25)
res_spa_input(i,j,k,l)=0;
else
res_spa_input(i,j,k,l)=res(i,j,k,l);
end
end
end
end
end
ressparse=cell(s1(3),s1(4));
for l=1:s2(4)
for k=1:s2(3)
x=res_spa_input(:,:,k,l);
x1=sparse(x);ressparse{k,l}=x1;
end
end
for l=1:size((ressparse),2)
for k=1:size((ressparse),1)
x2=full(ressparse{k,l});
reconstructed_res(:,:,k,l)=x2;
end
end
T=lmlragen(U,S);
T_error_correcetd=T-reconstructed_res;
figure,imshow(uint8(T_error_correcetd(:,:,:,1)));