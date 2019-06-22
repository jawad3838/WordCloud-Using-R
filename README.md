# WordCloud-Using-R
A short R script on that allows you to create a Word Cloud using the occurence of particular keywords in tweets.

## Pre-requisites
You need the following packages installed in RStudio or any IDE of your choice.

* twitterR
* RCurl
* tm
* wordcloud

All packages are installed using the install.packages() command as shown below:
```shell
install.packages('twitterR')
```
If you are using RStudio, you can also install packages using the tools dropdown menu and then selecting Install Packages.

Next thing you need is a consumer key, consumer secret, access token and access secret that can be easily obtained from your twitter account. Following the instructions in the link given below, you can get all these keys.

https://themepacific.com/how-to-generate-api-key-consumer-token-access-key-for-twitter-oauth/994/

## Results Using the keyword "Big data"
The following results were obtained when the term 'big data' was used to populate the Word Cloud (The limit to the number of tweets that were crawled was set to 500).

![](https://github.com/jawad3838/WordCloud-Using-R/blob/master/Results/All_500_tweets.jpeg)

Using only 50 tweets:
![](https://github.com/jawad3838/WordCloud-Using-R/blob/master/Results/Scaled_50_tweets_colored.jpeg)

