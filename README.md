#SchematronValidate.bat / SchematronValidate.sh

## About
Simple Windows batch file and Unix Bash script for Schematron validation using [Rick Jelliffe's reference implementation](http://www.schematron.com/implementation.html) (XSLT1 version). Actual *xslt* processing is done with *xsltproc*, which you must install yourself. It is (optionally) included in [Cygwin](http://www.cygwin.com/).

## Command line use (batch file):

`usage: schematronValidate.bat fileIn schema fileOut

## Command line use (shell script):

`usage: schematronValidate.sh fileIn schema fileOut
`