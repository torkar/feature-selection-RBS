library(synthpop)
library(openxlsx)

# load empirical data set
d <- read.xlsx("data/Features.xlsx", sheet = "Features")

# keep only 5% of the rows
size = nrow(d) - (nrow(d) * 0.95)
d <- d[sample(nrow(d), size), ]

# Make factors ordered 
d$State <- factor(d$State, 
                  levels = c("Elicited, Dropped", 
                             "Elicited, Prio, Dropped", 
                             "Elicited, Prio, Planned, Dropped", 
                             "Elicited, Prio, Planned, Implemented, Dropped", 
                             "Elicited, Prio, Planned, Implemented, Tested, Dropped", 
                             "Elicited, Prio, Planned, Implemented, Tested, Released"), 
                  ordered = TRUE)

d$Business.value <- factor(d$Business.value, 
                           levels = c("No value",
                                      "Valuable",
                                      "Important",
                                      "Critical"), 
                           ordered = TRUE)

d$Customer.value <- factor(d$Customer.value, 
                           levels = c("No value",
                                      "Valuable",
                                      "Important",
                                      "Critical"), 
                           ordered = TRUE)

d$Architects.involvement <- factor(d$Architects.involvement,
                                   levels = c("None",
                                              "Simple",
                                              "Monitoring",
                                              "Active Participation",
                                              "Joint Design"), 
                                   ordered = TRUE)


### data synthesis

# data synthesis 
# * sample is regular sampling
# * polr is for ordered categorical (multinomial)
# * cart for the rest of the data types
method.ini <- c("sample","polr","cart","cart","polr","polr","cart","cart",
                "cart","polr")

synthData <- syn(d, method = method.ini)

# Check and see that the empirical data is comparable to synthetic data
compare(synthData, d) 

# extract the synthesized data and store it in d
d <- data.frame(synthData$syn)

## Recode so it's configured as empirical data
# binary
d$Critical.feature <- ifelse(d$Critical.feature == 'Yes', 1, 0)
d$Dependency <- ifelse(d$Dependency == 'Yes', 1, 0)

# next, standardize where appropriate
d$prio_s <- scale(d$Team.priority)
d$sh_s <- scale(d$Stakeholders)
d$kc_s <- scale(d$Key.customers)

# abbreviate names
d$crit <- d$Critical.feature
d$b_val <- d$Business.value
d$c_val <- d$Customer.value
d$dep <- d$Dependency
d$arch <- d$Architects.involvement

# Save to R Data Format
saveRDS(d, file = "data/data.rds")

# load and check it's ok.
e <- readRDS("data/data.rds")

# Check that it worked
stopifnot(identical(d,e) == TRUE)


