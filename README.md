# Coding-Challenge-of-Insight-Data-Engineering
This is for the Coding Challenge of Insight Data Engineering

Auther: Yi Shan 

Location: University of Waterloo, Ontario, Canada

Email : y9shan@uwaterloo.ca

Date of Last Edit: 2015/07/20






#How to use the program ?


This whole program is implemented by Yi Shan using MATLAB 2012b.

If you have MATLAB on your computer,your can run the source files in matlab warkspace or run the run.sh directly.

The default input filename I set is 'tweets.txt'  you can replace it with other input files with the same name. 
Also you can edit the source codes to change the default input filename.


#What's the basic idea of  the algorithms ?

For the first feature"calculate the total number of times each word has been tweeted"

I thought of implementing a Trie Tree to relieve the searching complexity. However, for the whole ASCII set ,it may significantly increase the storage cost.  
Since the searching and comparing methods in Matlab is already very efficient, I choose to directly use the library functions of Matlab.


For the second feature"calculate the median number of unique words per tweet, and update this median as tweets come in"

To reduce the sorting complexity, I used a probability model to solve this problem. 
Since the maximum length of each tweet is known. I set it as 140. Then I created an array that hold the statistics of tweets's length.
As the new tweets coming in, the only updating is to increase the corresponding statistic in the array and get the distribution of the tweets' length .
After that, it is easy to find the new median by calculate 0.5 point of probability distribution function.

Therefore the complexity of updating the median will not increase when the tweets keep coming in. 
This is my own design that I am a little bit proud of.


#What's the performance of the program ?

Here I provide the runtime on my computer:

For the first feature"calculate the total number of times each word has been tweeted"

		Data Amount			Runtime
		3  tweets			0.043373s
		1000 tweets			0.79668 s
		10000 tweets		42.812512s


this is not perfect, because the complexity become much higher when dealing with large data set.

For the second feature"calculate the median number of unique words per tweet, and update this median as tweets come in"

		Data Amount			Runtime
		3  tweets			0.113278s
		1000 tweets			0.279070s
		10000 tweets		1.718570s

you can see that the runtime for feature 2 is increasing linearly with the data amount.
#Thank You!
└(^o^)┘  └(^o^)┘   └(^o^)┘   └(^o^)┘  └(^o^)┘   └(^o^)┘   └(^o^)┘   └(^o^)┘   └(^o^)┘  └(^o^)┘   └(^o^)┘

If you have any other questions, please feel free to email me.
