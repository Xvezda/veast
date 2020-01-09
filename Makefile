.PHONY: test tests

VIMRC_PATH = $(shell vim -u NONE -n -es --noplugin \
			 -c 'verbose echo get(split(&rtp, ","), 0)' -c 'qall' 2>&1)


all: install

install:
	mkdir -p $(VIMRC_PATH)/autoload
	cp autoload/veast.vim $(VIMRC_PATH)/autoload/

clean:
	rm -f $(VIMRC_PATH)/autoload/veast.vim

test:
	cd tests && ./run_tests.sh
