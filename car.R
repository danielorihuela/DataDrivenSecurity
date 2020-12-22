library(httr)
library(yaml)

# Make a GET request to get the list of the files to download
request <-
    GET("https://api.github.com/repos/mitre-attack/car/git/trees/master?recursive=1")
stop_for_status(request)

# Create a temporary directory to store temporary car analytics files
temporaryDirectory <- tempdir()

# Transform the data from the request into lists of car analytics urls
# and temporary file names
carRepositoryFileUrlList <-
    unlist(lapply(content(request)$tree, "[", "path"), use.names = F)
carAnalyticsFileUrlList <-
    paste0(
        "https://github.com/mitre-attack/car/raw/master/",
        grep(".*CAR(-\\d+)+.yaml", carRepositoryFileUrlList, value = TRUE)
    )
carAnalyticsFileNameList <- lapply(carAnalyticsFileUrlList,
                                   function(carAnalyticFileUrl) {
                                       strsplit(carAnalyticFileUrl, "/")[[1]][9]
                                   })
temporaryFiles <-
    lapply(carAnalyticsFileNameList, function(carAnalyticFileName) {
        file.path(temporaryDirectory, carAnalyticFileName)
    })

# Download car analytics files
mapply(function(carAnalyticsFileUrl,
                temporaryFile) {
    download.file(url = carAnalyticsFileUrl,
                  destfile = temporaryFile)
},
carAnalyticsFileUrlList,
temporaryFiles)

# Fill dataframe with data
df <- lapply(temporaryFiles, function(temporaryFile) {
    rawCarAnalyticData <- yaml::read_yaml(temporaryFile)
    carAnalyticDataFrame <- data.frame(
        id = rawCarAnalyticData$id,
        title = rawCarAnalyticData$title,
        description = rawCarAnalyticData$description,
        submission_date = rawCarAnalyticData$submission_date,
        information_domain = strsplit(rawCarAnalyticData$information_domain, ",|\\s+-\\s+")[[1]][1]
    )
})
df <- do.call(rbind, df)
df$submission_date <- as.Date(df$submission_date)
df$information_domain <- factor(df$information_domain,
                                levels = c("Analytic", "External", "Host",
                                           "Network", "Other"))
