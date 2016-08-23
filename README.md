# Unofficial Yahoo Finance JSON API

===================================
This is a very simple Yahoo! Finance API that I wrote that simply calls the
pre-existing Yahoo! Finance historical prices api and converts it to a JSON
object. I built it as a starting point to making a modular series of APIs that
will (hopefully, eventually) be able to communicate with eachother and compare
stock prices to twitter activity in order to look for trends or stock trading
clues.

### How does it work?

Simply punch in the url (http://yahoo-stock-api.herokuapp.com/) and append the
desired stock's ticker at the end.

To get Google's historical stock prices, for example, use:

> http://yahoo-stock-api.herokuapp.com/goog

The API will return open, close, high, low, and adjusted close stock prices for
everyday for which stock data is available.

--------------------------------------------------------------------------------

Check out my portfolio site: http://mikegregory.co
