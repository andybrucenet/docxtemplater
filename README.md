docxtemplater
=============

Adapted from https://docxtemplater.readthedocs.io/en/latest/installation.html#node

Simple container that can be used to run node.js apps.

You can test it out by doing:

1. Clone the project locally:

    ```
    git clone https://github.com/andybrucenet/docxtemplater.git
    ```
1. Make a local directory for the output file:

    ```
    mkdir -p ./.localdata
    ```
1. Try running the sample:

    ```
    docker run --rm -it -v $(PWD):/work andybrucenet/docxtemplater \
      ./assets/tests/test-01-doc-test-01.js ./assets/docx/Doc-Test-01.docx ./.localdata/Doc-Test-01.docx
    ```

1. Open the result file `./.localdata/Doc-Test-01.docx` in either MS Word or LibreOffice. You should see that it has some replaceable parameters filled in.

1. Play around with the node.js script to make other values appear.

That is all.

