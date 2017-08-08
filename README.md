docxtemplater
=============

Adapted from https://docxtemplater.readthedocs.io/en/latest/installation.html#node

Simple container that can be used to run `docxtemplater` CLI (or standard node.js apps).

You can test it out by doing the following (_If you are on Windows - you will need to modify accordingly ;)_:

1. Clone the project locally:

    ```
    git clone https://github.com/andybrucenet/docxtemplater.git
    ```
1. Make a local directory for the output file:

    ```
    mkdir -p ./.localdata
    ```
1. There are two samples. The first runs the program using the `docxtemplater` CLI:

    ```
    docker run --rm -it -v $(PWD):/work \
      andybrucenet/docxtemplater \
        ./assets/tests/test-01-doc-test-01.json
    ```
1. The second sample uses the `docxtemplater` Node.JS library (NOTE: we override the Docker entry point to use `node.js`):

    ```
    docker run --rm -it -v $(PWD):/work --entrypoint node \
      andybrucenet/docxtemplater \
        ./assets/tests/test-01-doc-test-01.js \
        ./assets/docx/Doc-Test-01.docx \
        ./.localdata/Doc-Test-01.docx
    ```
1. Open the result files `./.localdata/Doc-Test-01.docx` or `./.localdata/Doc-Test-02.docx` in either MS Word or LibreOffice. You should see that it has some replaceable parameters filled in. Note the file size differences - it is an interesting side-effect of docxtemplater CLI vs. library call.

1. Play around with the node.js script to make other values appear.

1. You can run standard `docxtemplater` CLI by creating a `config.json` as described in http://docxtemplater.readthedocs.io/en/latest/cli.html

That is all.

