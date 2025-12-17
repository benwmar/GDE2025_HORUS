################################################################################
# INSTRUCTIONS: This script assumes you have cohorts you would like to use in an
# ATLAS instance. Please note you will need to update the baseUrl to match
# the settings for your enviroment. You will also want to change the 
# CohortGenerator::saveCohortDefinitionSet() function call arguments to identify
# a folder to store your cohorts. This code will store the cohorts in 
# "inst/sampleStudy" as part of the template for reference. You should store
# your settings in the root of the "inst" folder and consider removing the 
# "inst/sampleStudy" resources when you are ready to release your study.
# 
# See the Download cohorts section
# of the UsingThisTemplate.md for more details.
# ##############################################################################
############################################################################

#renv::install("dplyr")
#renv::install("OHDSI/ROhdsiWebApi")

library(dplyr)
baseUrl <- "https://atlas-demo.ohdsi.org/WebAPI"
# Use this if your WebAPI instance has security enables
# ROhdsiWebApi::authorizeWebApi(
#   baseUrl = baseUrl,
#   authMethod = "windows"
# )
cohortDefinitionSet <- ROhdsiWebApi::exportCohortDefinitionSet(
  baseUrl = baseUrl,
  cohortIds = c(1792160,1792076,1792077,1792078,1792902,1792079,1792904,1792080,1792907,1792081,1792908,1792082,1792083,1792151,1792155,1792153,1792154,1792502,1792497,1792498,1792499,1792500,1792309,1792161,1792066,1792067,1792068,1792069,1792071,1792072,1792073,1792074,1792152,1792892,1792301,1792302,1792304,1792305,1792162,1792163,1792682,1792104,1792147,1792156,1792157,1791888,1791887,1791885
  ),
  generateStats = TRUE
)

# Rename cohorts
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1778211,]$cohortName <- "celecoxib"
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1790989,]$cohortName <- "diclofenac"
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1780946,]$cohortName <- "GI Bleed"

# Re-number cohorts
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1778211,]$cohortId <- 1
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1790989,]$cohortId <- 2
# cohortDefinitionSet[cohortDefinitionSet$cohortId == 1780946,]$cohortId <- 3

# Save the cohort definition set
# NOTE: Update settingsFileName, jsonFolder and sqlFolder
# for your study.
CohortGenerator::saveCohortDefinitionSet(
  cohortDefinitionSet = cohortDefinitionSet,
  settingsFileName = "inst/Cohorts.csv",
  jsonFolder = "inst/cohorts",
  sqlFolder = "inst/sql/sql_server",
)
