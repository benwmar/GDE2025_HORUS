################################################################################
# INSTRUCTIONS: Make sure you have downloaded your cohorts using 
# DownloadCohorts.R and that those cohorts are stored in the "inst" folder
# of the project. This script is written to use the sample study cohorts
# located in "inst/sampleStudy/Eunomia" so you will need to modify this in the code 
# below. 
# 
# See the Create analysis specifications section
# of the UsingThisTemplate.md for more details.
# 
# More information about Strategus HADES modules can be found at:
# https://ohdsi.github.io/Strategus/reference/index.html#omop-cdm-hades-modules.
# This help page also contains links to the corresponding HADES package that
# further details.
# ##############################################################################
library(dplyr)
library(Strategus)

# Time-at-risks (TARs) for the outcomes of interest in your study
# startAnchor: typically cohort start date
# endAnchor: typically cohort end date
# riskWindowStart: Number of days to add to the startAnchor to get the actual risk window start
# riskWindowEnd: Number of days to add to the endAnchor to get the actual risk window end
timeAtRisks <- tibble(
  label = c("Postop"),
  riskWindowStart  = c(1),
  startAnchor = c("cohort start"),
  riskWindowEnd  = c(0),
  endAnchor = c("cohort end")
)


## Note for Evan: read.csv(here::here("inst/OutcomeCohorts.csv"))
## install.packages("here")


# If you are not restricting your study to a specific time window, 
# please make these strings empty
studyStartDate <- '20171201' #YYYYMMDD
studyEndDate <- '20251031'   #YYYYMMDD
# Some of the settings require study dates with hyphens
studyStartDateWithHyphens <- gsub("(\\d{4})(\\d{2})(\\d{2})", "\\1-\\2-\\3", studyStartDate)
studyEndDateWithHyphens <- gsub("(\\d{4})(\\d{2})(\\d{2})", "\\1-\\2-\\3", studyEndDate)


# Consider these settings for estimation  ----------------------------------------

#useCleanWindowForPriorOutcomeLookback <- FALSE # If FALSE, lookback window is all time prior, i.e., including only first events
#psMatchMaxRatio <- 1 # If bigger than 1, the outcome model will be conditioned on the matched set

# Shared Resources -------------------------------------------------------------
# Get the list of cohorts - NOTE: you should modify this for your
# study to retrieve the cohorts you downloaded as part of
# DownloadCohorts.R
cohortDefinitionSet <- CohortGenerator::getCohortDefinitionSet(
  settingsFileName = "inst/Cohorts.csv",
  jsonFolder = "inst/cohorts",
  sqlFolder = "inst/sql/sql_server"
)

# OPTIONAL: Create a subset to define the new user cohorts
# More information: https://ohdsi.github.io/CohortGenerator/articles/CreatingCohortSubsetDefinitions.html
# subset1 <- CohortGenerator::createCohortSubsetDefinition(
#   name = "New Users",
#   definitionId = 1,
#   subsetOperators = list(
#     CohortGenerator::createLimitSubset(
#       priorTime = 365,
#       limitTo = "firstEver"
#     )
#   )
# )


if (any(duplicated(cohortDefinitionSet$cohortId))) {
  stop("*** Error: duplicate cohort IDs found ***")
}

# Create some data frames to hold the cohorts we'll use in each analysis ---------------
# cleanWindow: period of time during which a patient must be "clean" (free) of the outcome or event of interest before it can be counted as a new occurrence or before certain analyses are performed
# Outcome cohorts: 1792104,1792147,1792156,1792157,1791888,1791887,1791885
oList <- cohortDefinitionSet %>%
  filter(.data$cohortId %in% c(1792104,1792147,1792156,1792157,1791888,1791887,1791885)) %>%
  mutate(outcomeCohortId = cohortId, outcomeCohortName = cohortName) %>%
  select(outcomeCohortId, outcomeCohortName) %>%
  mutate(cleanWindow = 365)

tcIds <- cohortDefinitionSet %>%
  filter(!cohortId %in% oList$outcomeCohortId) %>%
  pull(cohortId)

## Note to Evan's future self: insert code here for "case when" for populating corresponding cleanWindows for each cohortId


# For the CohortMethod analysis we'll use the subsetted cohorts
# cmTcList <- data.frame(
#   targetCohortId = 1001,
#   targetCohortName = "celecoxib new users",
#   comparatorCohortId = 2001,
#   comparatorCohortName = "diclofenac new users"
# )

# For the CohortMethod LSPS we'll need to exclude the drugs of interest in this
# study
# excludedCovariateConcepts <- data.frame(
#   conceptId = c(1118084, 1124300),
#   conceptName = c("celecoxib", "diclofenac")
# )

# For the SCCS analysis we'll use the all exposure cohorts
# sccsTList <- data.frame(
#   targetCohortId = c(1,2),
#   targetCohortName = c("celecoxib", "diclofenac")
# )

# CohortGeneratorModule --------------------------------------------------------
cgModuleSettingsCreator <- CohortGeneratorModule$new()
cohortDefinitionShared <- cgModuleSettingsCreator$createCohortSharedResourceSpecifications(cohortDefinitionSet)
# negativeControlsShared <- cgModuleSettingsCreator$createNegativeControlOutcomeCohortSharedResourceSpecifications(
#   negativeControlOutcomeCohortSet = negativeControlOutcomeCohortSet,
#   occurrenceType = "first",
#   detectOnDescendants = TRUE
# )
cohortGeneratorModuleSpecifications <- cgModuleSettingsCreator$createModuleSpecifications(
  generateStats = TRUE
)

# CohortDiagnoticsModule Settings ---------------------------------------------
cdModuleSettingsCreator <- CohortDiagnosticsModule$new()
cohortDiagnosticsModuleSpecifications <- cdModuleSettingsCreator$createModuleSpecifications(
  cohortIds = cohortDefinitionSet$cohortId,
  runInclusionStatistics = TRUE,
  runIncludedSourceConcepts = TRUE,
  runOrphanConcepts = TRUE,
  runTimeSeries = FALSE,
  runVisitContext = TRUE,
  runBreakdownIndexEvents = TRUE,
  runIncidenceRate = TRUE,
  runCohortRelationship = TRUE,
  runTemporalCohortCharacterization = TRUE,
  minCharacterizationMean = 0.01
)

# CharacterizationModule Settings ---------------------------------------------
cModuleSettingsCreator <- CharacterizationModule$new()
characterizationModuleSpecifications <- cModuleSettingsCreator$createModuleSpecifications(
  targetIds = tcIds,
  outcomeIds = oList$outcomeCohortId,
  minPriorObservation = 0,
  dechallengeStopInterval = 0, # For surgical cohorts, this parameter would define the time window for grouping related surgical procedures into a single surgical episode or treatment period. Ex: staged procedures, revision surgeries, repeated procedures
  dechallengeEvaluationWindow = 0, # In a surgical context, this parameter sets a time window to evaluate if post-surgical complications (infection, pain, swelling) resolve after the acute surgical period, or to determine if symptoms that prompted surgery have resolved, or to assess whether the surgical intervention achieved its intended outcome
  riskWindowStart = timeAtRisks$riskWindowStart, 
  startAnchor = timeAtRisks$startAnchor, 
  riskWindowEnd = timeAtRisks$riskWindowEnd, 
  endAnchor = timeAtRisks$endAnchor,
  outcomeWashoutDays = rep(0, nrow(oList)),
  minCharacterizationMean = .01
)


# CohortIncidenceModule --------------------------------------------------------
ciModuleSettingsCreator <- CohortIncidenceModule$new()
tcIds <- cohortDefinitionSet %>%
  filter(!cohortId %in% oList$outcomeCohortId) %>%
  pull(cohortId)
targetList <- lapply(
  tcIds,
  function(cohortId) {
    CohortIncidence::createCohortRef(
      id = cohortId, 
      name = cohortDefinitionSet$cohortName[cohortDefinitionSet$cohortId == cohortId]
    )
  }
)
outcomeList <- lapply(
  seq_len(nrow(oList)),
  function(i) {
    CohortIncidence::createOutcomeDef(
      id = i, 
      name = cohortDefinitionSet$cohortName[cohortDefinitionSet$cohortId == oList$outcomeCohortId[i]], 
      cohortId = oList$outcomeCohortId[i], 
      cleanWindow = oList$cleanWindow[i]
    )
  }
)

tars <- list()
for (i in seq_len(nrow(timeAtRisks))) {
  tars[[i]] <- CohortIncidence::createTimeAtRiskDef(
    id = i, 
    startWith = gsub("cohort ", "", timeAtRisks$startAnchor[i]), 
    endWith = gsub("cohort ", "", timeAtRisks$endAnchor[i]), 
    startOffset = timeAtRisks$riskWindowStart[i],
    endOffset = timeAtRisks$riskWindowEnd[i]
  )
}
analysis1 <- CohortIncidence::createIncidenceAnalysis(
  targets = tcIds,
  outcomes = seq_len(nrow(oList)),
  tars = seq_along(tars)
)
# irStudyWindow <- CohortIncidence::createDateRange(
#   startDate = studyStartDateWithHyphens,
#   endDate = studyEndDateWithHyphens
# )
irDesign <- CohortIncidence::createIncidenceDesign(
  targetDefs = targetList,
  outcomeDefs = outcomeList,
  tars = tars,
  analysisList = list(analysis1),
  #studyWindow = irStudyWindow,
  strataSettings = CohortIncidence::createStrataSettings(
    byYear = TRUE,
    byGender = TRUE,
    byAge = TRUE,
    ageBreaks = seq(0, 110, by = 10)
  )
)
cohortIncidenceModuleSpecifications <- ciModuleSettingsCreator$createModuleSpecifications(
  irDesign = irDesign$toList()
)



# Create the analysis specifications ------------------------------------------
analysisSpecifications <- Strategus::createEmptyAnalysisSpecificiations() |>
  Strategus::addSharedResources(cohortDefinitionShared) |> 
  Strategus::addModuleSpecifications(cohortGeneratorModuleSpecifications) |>
  Strategus::addModuleSpecifications(cohortDiagnosticsModuleSpecifications) |>
  Strategus::addModuleSpecifications(characterizationModuleSpecifications) |>
  Strategus::addModuleSpecifications(cohortIncidenceModuleSpecifications)

ParallelLogger::saveSettingsToJson(
  analysisSpecifications, 
  file.path("inst", "horusStudyAnalysisSpecification.json")
)