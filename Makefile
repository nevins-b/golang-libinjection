SHELL = /bin/bash
all: test

.PHONY: copylibinjection
copylibinjection:
	@if [ ! -d "tmp" ]; then \
		git clone https://github.com/client9/libinjection.git tmp; \
	else \
		cd tmp; \
		git pull; \
	fi
	@if [ ! -d "libinjection" ]; then \
		mkdir libinjection; \
	fi
	cp tmp/src/libinjection*.h ./libinjection
	cp tmp/src/libinjection*.c ./libinjection

buildlibinjection: copylibinjection
	gcc -std=c99 -Wall -Werror -fpic -c libinjection/libinjection_sqli.c -o libinjection/libinjection_sqli.o
	gcc -std=c99 -Wall -Werror -fpic -c libinjection/libinjection_xss.c -o libinjection/libinjection_xss.o
	gcc -std=c99 -Wall -Werror -fpic -c libinjection/libinjection_html5.c -o libinjection/libinjection_html5.o
	gcc -dynamiclib -shared -o libinjection/libinjection.so libinjection/libinjection_sqli.o libinjection/libinjection_xss.o libinjection/libinjection_html5.o

test: buildlibinjection
	go test -v

clean:
	@rm -rf libinjection
	@rm -f main
