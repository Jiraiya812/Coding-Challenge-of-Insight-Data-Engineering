%% median_unique.m
% File Description
% Auther: Yi Shan 
% Location: University of Waterloo, Ontario, Canada
% Email : y9shan@uwaterloo.ca
% Date of Last Edit: 2015/07/20

% File 
%%
clc;clear all;
tic;
InputDirectory='tweet_input/';
IutputFilename='tweets1000.txt';

fprintf(['The input tweet file name is:' IutputFilename '\n']);
fprintf(' median_unique is running...\n');

OntputDirectory='tweet_output/';
OutputFilename_1='ft1.txt';
OutputFilename_2='ft2.txt';


Flag_Plot=1;  %flag to enable the plot function
%% initialize statistic
Statistic=zeros(1,140);  % Distribution 

%%
fid_input=fopen([InputDirectory IutputFilename],'r');
fid_output=fopen([OntputDirectory OutputFilename_2],'wt');

Num_Tweets=0;   % Number of tweets been read
while 1
NextLine = fgetl(fid_input); %read a tweet
   if (~ischar(NextLine))
      break;   % exit at the last line
   else
      Num_Tweets = Num_Tweets + 1;
      NextLine=textscan(NextLine,'%s');
      UniqueWords=unique(NextLine{1,1});  % unique the words
      Num_UniqueWords=length(UniqueWords); % Number of unique words in a tweet
      if(Num_UniqueWords~=0)
      Statistic(Num_UniqueWords)=Statistic(Num_UniqueWords)+1;
   end

      
%%  update median
Median=0;
Num_Acumulate=0;
i=1;
Median_1=0;

    while 1   %logic for updating the statistic and median
        Num_Acumulate=Num_Acumulate+Statistic(i);
        if Num_Acumulate/Num_Tweets>0.5
         if Median_1==0
           Median=i; 
         else
           Median=(i+Median_1)/2;
         end
            break
        end
        if Num_Acumulate/Num_Tweets==0.5&&Statistic(i)~=0
        Median_1=i;
        end
     i=i+1;
    end
fprintf(fid_output,'%g \n',Median);  % write the median to the file
end  
end

%% plot the distribution of tweet length
if Flag_Plot==1
bar(Statistic/Num_Tweets)
title('Distribution of number of unnique words');
xlabel('Number of unique words');
ylabel('Empirical probability')
hold on;
plot([Median Median],[0 max(Statistic)/Num_Tweets],'--*r')
fclose(fid_output);
fclose(fid_input);
end

%%
fprintf(' median_unique done, check folder /tweet_output/ft2.txt \n');
toc;
