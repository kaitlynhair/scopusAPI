search_scopus <- function(api_key, string, retMax){
  
  theData <- searchByString(string=string, api_key=api_key, retMax=retMax, outfile="scopus.xml") 
  
      return(extractXML(theData)) ## return the final data as a df
    }
  
  
  