PORT ?= 3000

start: bundle
	bundle exec jekyll serve --safe --drafts --watch --port ${PORT}

build: bundle
	bundle exec jekyll build --safe

bundle:
	ruby -v
	bundle install --path vendor/bundle

rsync: build
	rsync --delete -rav _/site/* web:/var/www/cheatsheets
