#SchematronValidate.bat

## About
This is a Windows simple batch file for Schematron validation using [Rick Jelliffe's reference implementation](http://www.schematron.com/implementation.html) (XSLT1 version). Actual *xslt* processing is done with *xsltproc*, which you must install yourself. It is (optionally) included in [Cygwin](http://www.cygwin.com/).

## Command line use

`usage: schematronValidate.bat fileIn schema fileOut
`