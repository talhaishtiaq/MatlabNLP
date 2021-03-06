% Curator
% Takes the original data file and curates a data file that has more ones,
% and twos

clc;
close all;
clear all;

tic;



% reading the data file
% xls is easier to read than csv
[num,txt,raw] = xlsread('C:\MatlabNLP\examples\gsa\data\final104.xls');


% reading the description of each shoe
descriptions = raw(2:size(raw,1),2); % note that raw has a header line
style_ratings = num(1:size(num,1),1);
comfort_ratings = num(1:size(num,1),4);
overal_ratings = num(1:size(num,1),5);

f = @(x) length(char(x{1}));
len_array = arrayfun(f,descriptions);
hist(len_array, 300)


length(find(style_ratings==1));
length(find(style_ratings==2));
length(find(style_ratings==3));
length(find(style_ratings==4));
length(find(style_ratings==5));


length(find(comfort_ratings==1));
length(find(comfort_ratings==2));
length(find(comfort_ratings==3));
length(find(comfort_ratings==4));
length(find(comfort_ratings==5));



length(find(overal_ratings==1));
length(find(overal_ratings==2));
length(find(overal_ratings==3));
length(find(overal_ratings==4));
length(find(overal_ratings==5));

a = (style_ratings==1 | style_ratings==2 | comfort_ratings==1 |comfort_ratings==2|overal_ratings==1|overal_ratings==2)
hist(comfort_ratings(find(a)))
sum(a)


b = [comfort_ratings==5, len_array];
% sort b based on lenght of review
[Y,I]=sort(b(:,2));
B=b(I,:)
% How many points with 3 stars do you want
need_no_3_stars = 800
mysum = 0
for i= size(B,1):-1:1
    if B(i,1)==1
        
        if mysum > need_no_3_stars
            B(i,1)=0;
        else
            mysum = mysum+1;
        end
        
        
    end
    
end
b = a|B(:,1);
subplot(1,3,1)
hist(style_ratings(find(b)))
title('Style');

subplot(1,3,2)
hist(comfort_ratings(find(b)))
title('Comfort');

subplot(1,3,3)
hist(overal_ratings(find(b)))
title('Overal');


