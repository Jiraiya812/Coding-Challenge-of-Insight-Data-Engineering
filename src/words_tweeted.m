%%  words_tweeted.m
% File Description
% Auther: Yi Shan 
% Location: University of Waterloo, Ontario, Canada
% Email : y9shan@uwaterloo.ca
% Date of Last Edit: 2015/07/20

% File 
%%
tic;
clc;clear all;
%%  Path Setting Logic
Flag_UsingCurrentPath=0;
if Flag_UsingCurrentPath
    BasePath=cd;
else
BasePath=cd;
position=strfind(BasePath,'src');
if length(position)==0
BasePath=[cd '/'];
else
position=position(length(position));
BasePath=BasePath(1:position-1);
end
end
%%
InputDirectory=[ BasePath 'tweet_input/'];
IutputFilename='tweets.txt';

fprintf(['The input tweet file name is:' IutputFilename '\n']);
fprintf(' words_tweeted is running...\n');

OntputDirectory=[ BasePath 'tweet_output/'];
OutputFilename_1='ft1.txt';
OutputFilename_2='ft2.txt';


%% read the tweets
fid_input = fopen([InputDirectory IutputFilename],'r');
words = textscan(fid_input, '%s');


%% generate the unique wordlist and sort it 
unique_words = unique(words{1,1});
status = fclose(fid_input);
words=words{1,1};

%% count the frequency
for i=1:length(unique_words)
[x,y] = find(strcmp(words,unique_words{i}));
frequency(i,1)=length(x);
end

%% Write the file
fid_output=fopen([OntputDirectory OutputFilename_1],'wt');
 for i=1:length(unique_words)
 fprintf(fid_output,'%-60s  %g \n', unique_words{i} ,frequency(i,1)); 
 end
 fclose(fid_output);
fprintf(' words_tweeted done, check folder /tweet_output/ft1.txt \n');
toc;
