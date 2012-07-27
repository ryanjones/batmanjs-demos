# 002-rails-batchat-ruby #

---

Allows you to chat with another user. You can also see if someone is online. Names are randomly generated numbers.  

## batman.js version ##
0.10.0

## rails version ##
3.2.6

## Getting started ##
navigate to 002-rails-batchat-ruby
rake db:setup  
rails s  

## Notes ##
open a browser tab at localhost:3000  
open another browser tab at localhost:3000  
talk between browser tabs  
if you close a tab, the user will disappear after roughly 60 seconds  
some js pushes the scroll window down... you can never scroll up!


## Known Bugs ##
if you smash in message after message the client side will eventually fail.