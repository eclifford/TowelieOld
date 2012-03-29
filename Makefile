REPORTER ?= dot
UNITTESTS ?= $(shell find test/unit -name "*.coffee" -type f)
TESTS = $(shell find test/spec -name "*.coffee" -type f)
DEBUG ?= 

build:
	@/usr/bin/env npm \
		install

test: 
	mocha $(TESTS) --ui bdd

watch: 
	mocha $(TESTS) --ui bdd --watch

doc:
	@./node_modules/codo/bin/codo \

run:
	@./node_modules/serve/bin/serve .

.PHONY: run test watch doc
