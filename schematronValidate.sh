#!/bin/bash

# Validate XML against Schematron schema, using Rick Jelliffe's 
# reference implementation: http://www.schematron.com/implementation.html (XSLT1 version)
#
# Xslt processing using xsltproc
#
# Johan van der Knijff, 30 July 2013

# USAGE: schematronValidate.sch fileIn schema fileOut

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check command line args
if [ "$#" -ne 3 ] ; then
  echo "Usage: schematronValidate.sch fileIn schema fileOut" >&2
  exit 1
fi

if ! [ -f "$1" ] ; then
  echo "fileIn must be a file" >&2
  exit 1
fi

if ! [ -f "$2" ] ; then
  echo "schema must be a file" >&2
  exit 1
fi

# Read command line args
fileIn=$1
schema=$2
fileOut=$3

xslPath=$instDir/xsl

xsltproc --path $xslPath $xslPath/iso_dsdl_include.xsl $schema > xxx1.sch
xsltproc --path $xslPath $xslPath/iso_abstract_expand.xsl xxx1.sch > xxx2.sch
xsltproc --path $xslPath $xslPath/iso_svrl_for_xslt1.xsl xxx2.sch > xxx.xsl
xsltproc --path $xslPath xxx.xsl $fileIn > $fileOut

# Delete temporary files
rm xxx1.sch
rm xxx2.sch
rm xxx.xsl
