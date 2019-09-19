#!/bin/bash
#-----------------------------------------------------------------------------------------#
# Script Name              : Deployment.sh                                                #
#                                                                                         #
# Updated By               : Mukesh Kumar                                                 #
#                                                                                         #
# Created On               : Sept 12 2019                                                 #
#                                                                                         #
# Purpose                  : This is for DevOps POC                                       #
# Version                  : 1.0  Initial Version                                         #
#-----------------------------------------------------------------------------------------#
if [[ $# -lt 7 ]] ; then
   echo "Please provide the correct parameters."
   exit 1
fi


BINPATH=$1
WORKFLOWNAME=$2
CNTRLFILE=$3
REPOSITORY=$4 
INFA_DOMAIN=$5 
INFA_USERNAME=$6
INFA_PWD=$7


# Section to import workflows in ENVIRONMENT-------------------------**********
********************  It should be in Different script as we need to import the job on diffferent server than where Deployment.sh script is present**********
cp $WORKFLOWNAME $BINPATH 
cd $BINPATH
pmrep connect -r $REPOSITORY -d $INFA_DOMAIN -n $INFA_USERNAME -x $INFA_PWD
echo $WORKFLOWNAME
pmrep objectimport -i $BINPATH/$WORKFLOWNAME -c $BINPATH/$CNTRLFILE -l $BINPATH/import.log
echo "Job Import Successful"
else
echo "Job Import is not completed"
fi







