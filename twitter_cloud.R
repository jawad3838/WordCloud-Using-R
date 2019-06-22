# You can remove these lines once the packages are installed.
install.packages("twitteR")
install.packages("RCurl")
install.packages("tm")
install.packages("wordcloud")

# Include the necessary libraries
require(twitteR)
require(RCurl)
require(tm)
require(wordcloud)

# Download this file if you're running the code on windows.
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

# I'll provide you with a link that will allow you to get the following keys from your own twitter account.
consumer_key <- 'Insert your key here'
consumer_secret <- 'Insert your key here'
access_token <- 'Insert your key here'
access_secret <- 'Insert your key here'

# Connect to the twitter app.
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Search all tweets on twitter (500) that contain the word "big data", limit to 500 for clarity.
bd_tweets = searchTwitter("big data", n=500, lang="en") 
# Save the tweets temporarily
bd_text = sapply(bd_tweets, function(x) x$getText())

# This line of code removes all emoticons from the tweets as R cannot read them properly.
bd_text <- data.frame(text = iconv(bd_text, "latin1", "ASCII", "byte"), 
                           stringsAsFactors = FALSE)

# Create a corpus ------ Merge all tweets into a single chunk of text
bd_corpus = Corpus(VectorSource(bd_text))

# Inspect the corpus ----- Just to display what tweets were captured while searching through twitter for Bigdata
inspect(bd_corpus[1]) 

# Clean the corpus by removing punctuation, numbers, and white spaces
bd_clean <- tm_map(bd_corpus, removePunctuation)
bd_clean <- tm_map(bd_clean, removeNumbers)
bd_clean <- tm_map(bd_clean, stripWhitespace)

# Create Word Cloud from clean data ---- Bigger and bold words indicate high occurence rate of that word in tweets and vice versa.
wordcloud(bd_clean)

# Modify your Word Cloud ---- limits the number of words in the word cloud to 50 and scales the smaller words so they are visible.
wordcloud(bd_clean, random.order = F, max.words = 50, scale = c(3, 0.5))

# Add some colors to the word Cloud so the words are clearly visible
wordcloud(bd_clean, random.order = F, max.words = 50, scale = c(3, 0.5), color = rainbow(50))