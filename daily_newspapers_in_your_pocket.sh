#!/usr/bin/env bash

for url in \
  https://www.nytimes.com/section/todayspaper \
  https://www.washingtonpost.com/todays_paper/updates \
  https://economist.com https://www.wsj.com/news/types/bookshelf \
  https://www.nytimes.com/section/books \
  https://www.economist.com/books-and-arts/ \
  https://newyorker.com https://theatlantic.com \
  https://www.prospectmagazine.co.uk/category/arts-and-books \
  https://www.washingtonpost/entertainment/books \
  https://news.ycombinator.com/best; do
  curl -L \
    -H "Content-Type: application/json; charset=UTF-8" \
    -H "X-Accept: application/json" \
    -d "{\"url\": \"$url\", \"consumer_key\": \"$POCKET_CONSUMER_KEY\",\"access_token\": \"$POCKET_ACCESS_TOKEN\"}" \
    -X POST "https://getpocket.com/v3/add"
done

# WSJ requires special care
for section in \
  frontpage us world opinion business review offduty lifearts new-york; do
  url=https://www.wsj.com/print-edition/$(date +'%Y%m%d')/$section
  curl -L \
    -H "Content-Type: application/json; charset=UTF-8" \
    -H "X-Accept: application/json" \
    -d "{\"url\": \"$url\", \"consumer_key\": \"$POCKET_CONSUMER_KEY\",\"access_token\": \"$POCKET_ACCESS_TOKEN\"}" \
    -X POST "https://getpocket.com/v3/add"
done
