REPORTER ?= dot
UNITTESTS ?= $(shell find test/unit -name "*.coffee" -type f)
DEBUG ?= 

build:
	@/usr/bin/env npm \
		install

test: 
	@./node_modules/mocha/bin/mocha \
	--ui bdd

watch: 
	@./node_modules/mocha/bin/mocha \
	--watch

doc:
	@./node_modules/codo/bin/codo \

run:
	@./node_modules/serve/bin/serve .

.PHONY: run test watch doc
