from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import time

#Variables that contains the user credentials to access Twitter API 
access_token = "898521574311055360-BeodHi48RjYwIDwFo8DvUkao3qBtlar"
access_token_secret = "DFFuAvyL97g6xvVWhe6KOI7vsfRHwnJecbSSFR7Xtf0ss"
consumer_key = "ivLvIwqAF8YeSQJPW02AkVEIS"
consumer_secret = "6Pk1mln6BNUMsR9sGheLTvbnUzT4Oliemf6remuniOGQ9BLv9D"
class StdOutListener(StreamListener):

    def on_data(self, data):
        print (data)
        savefile=open("D:\\manish.txt","a")
        savefile.write(data)
        savefile.write("\n")
        savefile.close()
        return True

    def on_error(self, status):
        print (status)


if __name__ == '__main__':

    #This handles Twitter authetification and the connection to Twitter Streaming API
    l = StdOutListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    stream = Stream(auth, l)

    #This line filter Twitter Streams to capture data by the keywords: 'python', 'javascript', 'ruby'
    stream.filter(track=['python', 'javascript', 'ruby'])

