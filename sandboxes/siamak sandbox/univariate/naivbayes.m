% predicting numerical values using Naiv Bayes

clear all;

disp('====Naive Bayes===');
disp('Reading featur vector');

featurs = csvread('full featured dataset\forWeka_featuresonly.csv');

num_data = size(featurs,1); %5000;
size_training = floor(.8*num_data);

trainingset = featurs(1:size_training,:);
testset = featurs((size_training+1):num_data,:);


disp('Splitting up data into training/test sets');
[num,txt,raw] = xlsread('C:\MatlabNLP\examples\gsa\data\final104.xls');

% reading the description of each shoe
descriptions = raw(2:size(raw,1),2);
style_ratings = num(1:size(num,1),1);
comfort_ratings = num(1:size(num,1),4);
overal_ratings = num(1:size(num,1),5);

% only take m data points
m=num_data;
descriptions = descriptions(1:m);
style_ratings = style_ratings(1:m);
comfort_ratings = comfort_ratings(1:m);
overal_ratings = overal_ratings(1:m);

responsevals = [style_ratings, comfort_ratings, overal_ratings];

responsevals_training = responsevals(1:size_training,:);
responsevals_test = responsevals((size_training+1):num_data,:);
disp('Naiv Bayes ');
% http://www.mathworks.com/help/toolbox/stats/naivebayesclass.html

tic;
%[B,dev,stats] = mnrfit(trainingset, responsevals_training(:,1));

a = responsevals_training(:,3)';
b = responsevals_test(:,3)';
%remove this part
%a = [a(1:96),a(98:120)];
%trainingset = [trainingset(1:96,:); trainingset(98:120,:)];

O1 = NaiveBayes.fit(trainingset,a,'dist','mn'); % or  'mvmn'
C2 = O1.predict(testset);
cMat2 = confusionmat(b,C2)

disp('Second Kernel');
O1 = NaiveBayes.fit(trainingset,a,'dist','mvmn'); % or  'mvmn'
C2 = O1.predict(testset);
cMat2 = confusionmat(b,C2)
toc;

