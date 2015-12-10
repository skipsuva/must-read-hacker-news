Welcome to **'Must Read Hacker News'**, an ultra-simple app I built to practice web-scraping.

The functionality is simple - when run, the program scrapes the first 4 pages of Hacker News (https://news.ycombinator.com/) and launches the newest "must-read tech" article - the one that has the most points *as well as* the most comments.

In your terminal, simply run 'ruby hacker_news.rb' and she'll take care of the rest.

For additional ease of use, you can add the following to your bash profile to launch the program anywhere via an alias.
- open '.bash_profile' with your favorite text editor
- locate the 'Aliases' section and add the following to the bottom of the list:
- alias hacknews="ruby ~/[Enter your filepath here, begining AFTER 'user']/must-read-hacker-news/hacker_news.rb"
- save the file and restart your terminal

Happy browsing!
