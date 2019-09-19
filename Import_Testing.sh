#!/bin/bash

BINPATH=$1
WORKFLOWNAME=$2
CNTRLFILE=$3
REPOSITORY=$4 
INFA_DOMAIN=$5 
INFA_USERNAME=$6
INFA_PWD=$7


cd $BINPATH
pmrep connect -r $REPOSITORY -d $INFA_DOMAIN -n $INFA_USERNAME -x $INFA_PWD
echo $WORKFLOWNAME
pmrep objectimport -i $BINPATH/$WORKFLOWNAME -c $BINPATH/$CNTRLFILE -l $BINPATH/import.log
echo "Job Import Successful"







