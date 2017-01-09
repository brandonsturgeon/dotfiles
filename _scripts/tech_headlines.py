from bs4 import BeautifulSoup
from blessings import Terminal
import argparse
import requests

terminal = Terminal()

class Headlines():
    def __init__(self, lines):
        self.limit_lines = lines
        self.url = 'http://www.reuters.com/news/archive/technologyNews?view=page'
        self.page = requests.get(self.url).text
        self.soup = BeautifulSoup(self.page, 'lxml')

        self.get_headlines()

    def get_headlines(self):
        articles = self.soup.find_all('article', { 'class' : 'story' })
        articles = articles[:self.limit_lines]

        for index, article in enumerate(articles):
            headline = article.find('h3', { 'class' : 'story-title'}).text.strip()
            desc = article.find('p').text

            if index is not 0:
                print ''

            print(terminal.bold_underline_white(headline))
            print(terminal.move_right() + terminal.color(3)(desc))

def get_line_argument():
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', '--limit')
    args = parser.parse_args()

    limit = args.limit

    try:
        limit = int(limit)
    except ValueError, TypeError:
        print 'ignoring arguments they\'re garbage'
        return None

    return limit

if __name__ == '__main__':
    Headlines(get_line_argument())
    raw_input('')
