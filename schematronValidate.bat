:: Validate XML against Schematron schema, using Rick Jelliffe's 
:: reference implementation: http://www.schematron.com/implementation.html (XSLT1 version)
::
:: Xslt processing using xsltproc, which is available via Cygwin
::
:: Johan van der Knijff, 11 July 2013

@echo off

:: Adapt to actual location of xsltproc.exe
set xsltprocCommand="C:\cygwin\bin\xsltproc"

:: Read command line args
set fileIn=%1
set schema=%2
set fileOut=%3

set xslPath=%~dp0\xsl

:: Exit if any args are missing
if "%fileIn%"=="" goto usage
if "%schema%"=="" goto usage
if "%fileOut%"=="" goto usage

%xsltprocCommand% --path %xslPath% %xslPath%\iso_dsdl_include.xsl %schema% > xxx1.sch
%xsltprocCommand% --path %xslPath% %xslPath%\iso_abstract_expand.xsl xxx1.sch > xxx2.sch
%xsltprocCommand% --path %xslPath% %xslPath%\iso_svrl_for_xslt1.xsl xxx2.sch > xxx.xsl
%xsltprocCommand% --path %xslPath% xxx.xsl %fileIn% > %fileOut%

:: Delete temporary files
del xxx1.sch
del xxx2.sch
del xxx.xsl

goto:EOF

:usage
echo --
echo USAGE: schematronValidate fileIn schema fileOut
