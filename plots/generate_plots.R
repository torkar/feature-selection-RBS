# load and clean the data first (see first snippets in ../analysis.Rmd)
# The run the below to generate plots for most of the variables
library(rethinking)
# State
# par(mar = c(5.1, 4.1, 4.1, 2.1))
simplehist(as.numeric(d$State), xlab="State", bty="n", xaxt = "n", ylab="")
axis(1, labels = c(1,2,3,4,5,6), at = 1:6)

text(x = 1.25, y = 3000, "3032")
text(x = 2, y = 2490, "2290")
text(x = 3, y = 2130, "1930")
text(x = 4, y = 753, "553")
text(x = 5, y = 280, "80")
text(x = 5.75, y = 3000, "3225")

# Prio
simplehist(as.numeric(d$Team.priority), xlab="Priority", bty = "n", xaxt = "n", 
           ylab = "")
axis(1, at = seq(from=0, to=1000, by=100))

# Criticality
# Simply write in text
# > table(d$Critical.feature)
# 
# 0    1 
# 9162 1948 

# Business value
simplehist(as.numeric(d$Business.value), xlab="Business value", bty="n", 
           xaxt = "n", ylim=c(0,1e4), ylab = "")
axis(1, labels = c("No value", "Valuable", "Important", "Critical"), at = 1:4)
text(x = 2, y = 850, "50")
text(x = 3, y = 1154, "354")
text(x = 4, y = 2053, "1253")

# Customer value
simplehist(as.numeric(d$Customer.value), xlab="Customer value", bty="n", 
           xaxt = "n", ylim=c(0,1e4), ylab = "")
axis(1, labels = c("No value", "Valuable", "Important", "Critical"), at = 1:4)
text(x = 2, y = 856, "56")
text(x = 3, y = 916, "116")
text(x = 4, y = 1526, "726")

# stakeholders
simplehist(d$Stakeholders, xlab = "Number of stakeholders", bty = "n", 
           ylim = c(0,11000), ylab = "")
text(x = 0, y = 1334, "534")
text(x = 1, y = 10600, "9800")
text(x = 2, y = 1440, "640")
text(x = 3, y = 891, "91")
text(x = 4, y = 817, "17")
text(x = 5, y = 808, "8")
text(x = 6, y = 803, "3")
text(x = 7, y = 801, "1")
text(x = 8, y = 801, "1")
text(x = 9, y = 806, "6")
text(x = 10, y = 809, "9")

# key customers
simplehist(d$Key.customers, xlab = "Number of key customers", bty= "n", 
           ylab = "")

# dependency 1/0 
# > table(d$Dependency)
# 
# 0    1 
# 9106 2004

# arch involvement
simplehist(as.numeric(d$Architects.involvement), 
           xlab = "Architects' involvement", bty= "n", xaxt = "n", ylab = "")
axis(1, labels = FALSE)

text(x = 1:5, y = par("usr")[3] -1000,
     xpd = NA, 
     labels =c("None", "Simple", "Monitoring", "Active part.", "Joint design"))
text(x = 2, y = 1208, "408")
text(x = 3, y = 1383, "583")
text(x = 4, y = 837, "37")
text(x = 5, y = 961, "161")

