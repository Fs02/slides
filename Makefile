all: clean build
start:
	npx fusuma start -d ${SLIDE}
clean:
	rm -r ${SLIDE}/dist || true
	rm -r docs/${SLIDE} || true
build:
	npx fusuma build -d ${SLIDE}
	mkdir -p docs/${SLIDE}
	cp ${SLIDE}/dist/* docs/${SLIDE}
