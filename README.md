# Example Bitcoin Transaction parsing

[![Coverage Status](https://coveralls.io/repos/github/destrys/bitcoin_transaction_parsing/badge.svg)](https://coveralls.io/github/destrys/bitcoin_transaction_parsing)
[![Build Status](https://travis-ci.org/destrys/bitcoin_transaction_parsing.svg?branch=master)](https://travis-ci.org/destrys/bitcoin_transaction_parsing)

**Warning**: Currently this has only been tested on my Mac, if you run into problems on
your machine, open an issue, or fix it and put in a PR.

## Quickstart

  Get everything installed:

#+BEGIN_SRC shell-script
  $ git clone git@github.com:destrys/bitcoin_transaction_parsing
  $ cd bitcoin_transaction_parsing
  $ make 
  $ source environment.sh
  $ jupyter notebook
#+END_SRC

If your browser doesn't open automatically, navigate to [http://localhost:8888/tree/notebooks#]

## TODO

* Either write a tx deserializer function, or get python-bitcoinlib's version working
* Output Parsing Notebook
* Input Parsing Notebook
* Standard Transactions Notebook (find examples of each)
* NonStandard Transaction Notebook (find some good examples)
* Tests/Docs