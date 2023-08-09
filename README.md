# Tribuna Liberal Scraper

Tribuna Liberal is a local newspaper from Sumaré - SP, Brazil.

This is a Ruby script to download the latest issue from their [official website](https://www.tribunaliberal.com.br/).

A [GitHub Action](https://github.com/glaucocustodio/tribuna-liberal-scraper/blob/master/.github/workflows/downloader.yml) is set up to run this script daily and commit its outcome, hence, keeping a history of issues on the git repo.

## How to run

```sh
make run
```

The latest issue will be saved on the `issues` folder.

## Inspiration

https://simonwillison.net/2020/Oct/9/git-scraping/
