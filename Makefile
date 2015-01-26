serve: build
	bundle exec middleman

build:
	bundle exec middleman build

deploy:
	bundle exec middleman deploy

update:
	bundle update
	bower update
	cp bower_components/fontawesome/fonts/* source/fonts

.PHONY: build serve deploy update