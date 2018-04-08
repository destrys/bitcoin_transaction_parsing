#
# == Paths & Directories
#

VENV_DIR                   := .virtualenv
PYTHON_VERSION             := 3.6
PYTHON_REQUIREMENTS        := requirements.txt
PYTHON_FROZEN_REQUIREMENTS := requirements.frozen.txt
PYTHON_PACKAGE_DIR         := destrysbitcoin/
PYTHON_DOCS_DIR            := docs/
#
# == Configuration ==
#

UNAME := $(shell uname)

#
# == Commands ==
#

MKDIR      := mkdir -p
LN         := ln
FIND       := find
PIP        := $(VENV_DIR)/bin/pip
PYTESTS    := pytest
VIRTUALENV := $(shell command -v virtualenv 2>/dev/null)
PYTHON3    := $(shell command -v python3 2> /dev/null)
PYV        := $(shell python3 -c "import sys;t='{v[0]}.{v[1]}'.format(v=list(sys.version_info[:2]));sys.stdout.write(t)")
PYV_GT_3_6 := $(shell echo $(PYV)\>=$(PYTHON_VERSION) | bc )
#
# == Top-Level Commands ==
#

default: dependencies

test: test-python

flake:
	flake8 $(PYTHON_PACKAGE_DIR)

docs:
	cd $(PYTHON_DOCS_DIR) && \
	SPHINX_APIDOC_OPTIONS=members && \
	sphinx-apidoc -f -o source/ ../$(PYTHON_PACKAGE_DIR) && \
	make coverage && \
	unset SPHINX_APIDOC_OPTIONS && \
	sphinx-apidoc -f -o source/ ../$(PYTHON_PACKAGE_DIR) && \
        make html

.PHONY: docs

dependencies: system-dependencies app-dependencies

purge: purge-tmp purge-code

freeze:
	$(PIP) freeze > $(PYTHON_FROZEN_REQUIREMENTS)
#
# == Dependencies ==
#

app-dependencies: python-dependencies

$(VENV_DIR):
	virtualenv -p python3 --prompt='(destrysbitcoin) ' $(VENV_DIR)


python-dependencies: $(VENV_DIR)
ifndef VIRTUALENV
	$(error "virtualenv is not installed. Install with `pip install [--user] virtualenv`.")
endif
ifndef PYTHON3
	$(error "python3 is not available please install python3")
endif
ifeq ($(PYV_GT_3_6),0)
	$(error "requires python3.6+ please upgrade your python")
endif
ifdef UNFREEZE
	$(PIP) install -r $(PYTHON_REQUIREMENTS)
	jupyter nbextension enable --py widgetsnbextension --sys-prefix
else
	$(PIP) install -r $(PYTHON_FROZEN_REQUIREMENTS)
	jupyter nbextension enable --py widgetsnbextension --sys-prefix
endif


system-dependencies:
ifeq ($(UNAME),Darwin)
	echo "no system dependencies yet"
else
	echo "no system dependencies yet"
endif

#
# == Purging ==
#

clean: purge-tmp purge-code

purge-tmp:
	$(RM) -r tmp/*

purge-code:
	$(RM) -r $(VENV_DIR)

#
# == Testing ==
#

test-python:
	$(PYTESTS) --cov=destrysbitcoin --cov-config=config/coverage.cfg
	coveralls

#rm coverage.svg
#coverage-badge -o coverage.svg
