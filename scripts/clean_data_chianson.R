library(dplyr)
library(stringr)

CleanseData <- function(police.data.path){

    # Read in king county police call data
    police.data <- read.csv(police.data.path, stringsAsFactors = FALSE)

    # Cleaning data by removing empty strings, "N/A", rows with numbers in the cities column instead of city names
    # and updating misspelled cities such as "Seattel" with the correct spelling, "Seattle"
    police.data <- police.data[which(grepl("^[0-9]+$", police.data$city) == FALSE), ]
    police.data$city <- str_to_title(police.data$city)
    correct.city.names <- list("Seatle" = "Seattle",
                               "Seatttle" = "Seattle",
                               "Seattq" = "Seattle",
                               "Seatlle" = "Seattle",
                               "Sattle" = "Seattle",
                               "Seattel" = "Seattle",
                               "Seatte" = "Seattle",
                               "Aburn" = "Auburn",
                               "Aubirn" = "Auburn",
                               "New Castle" = "Newcastle",
                               "Covingtont" = "Covington",
                               "Maple Valle" = "Maple Valley",
                               "Kenmre" = "Kenmore",
                               "Kenmroe" = "Kenmore",
                               "Kenomre" = "Kenmore",
                               "Auburn Ave S" = "Auburn",
                               "Bujrien" = "Burien",
                               "Burieb" = "Burien",
                               "Seatec" = "SeaTac",
                               "Seatac" = "SeaTac",
                               "Carnation, Wa 98014" = "Carnation",
                               "Woodinvile" = "Woodinville",
                               "Tuckwila" = "Tukwila",
                               "C17051435" = "",
                               "Shorelinee" = "Shoreline",
                               "Shorline" = "Shoreline",
                               "Barring" = "Baring",
                               "Safeway" = "",
                               "White Cneter" = "White Center",
                               "Snoqualmie Pass, Wa 98068" = "Snoqualmie",
                               "Snoqualmie Pass" = "Snoqualmie",
                               "Snoqulamie" = "Snoqualmie",
                               "Desmoines" = "Des Moines",
                               "Fred Meyer" = "",
                               "Mount Lake Terrance" = "Mountlake Terrace",
                               "Mount Lake Terrace" = "Mountlake Terrace",
                               "Lynnwod" = "Lynnwood",
                               "Vashon" = "Vashon Island"
    )

    # Function to fix misspelled names
    CleanNames <- function(vec){
        check.name <- match(vec, names(correct.city.names))
        if (!is.na(check.name)) {
            vec <- correct.city.names[check.name]
        }
        return(vec)
    }

    # Fix misspelled names without including list element titles in the vector
    police.data$city <- unlist(sapply(police.data$city, CleanNames), use.names = FALSE)

    # Remove rows with empty strings or strings with "N/A"
    police.data <- police.data[which(police.data$city != "" & police.data$city != "N/A"), ]

    return(police.data)
}