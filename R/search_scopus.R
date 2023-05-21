#' Run a search query to the Scopus API
#'
#' @param api_key API key from developers portal
#' @param string query text
#' @param retMax max records to return

#' @return data as df

#' @export
#' @import httr
#' @import XML
#' @import dplyr

search_scopus <- function(api_key, string, retMax){
  
  theData <- searchByString(string=string, api_key=api_key, retMax=retMax, outfile="scopus.xml") 
  
     df <-  extractXML(theData) ## return the final data as a df
  
  result <- df %>%
    dplyr::mutate(source = "scopus") %>%
    dplyr::rename(author = authors) %>%
    dplyr::rename(author_affiliation = affiliations) %>%
    dplyr::rename(author_country = countries) %>%
    dplyr::mutate(uid = paste0(source, "-", scopusID)) %>%
    dplyr::rename(title = articletitle)

  # correct author formatting 
  result$author <- gsub('\\|', '; ', result$author)
  
  return(result)
  
    }
  
  
  
