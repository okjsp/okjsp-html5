<!DOCTYPE html>
<html manifest="cache.manifest"> 
  <head> 
    <meta charset="utf-8" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" /> 
    <title>HTML5 Presentation</title> 
    <script>
    function offline(){
    	var appCache = window.applicationCache;
    	switch (appCache.status) {
    		case appCache.UNCACHED: // UNCACHED == 0
    			return 'UNCACHED';
    			break;
    		case appCache.IDLE: // IDLE == 1
    			return 'IDLE';
    			break;
    		case appCache.CHECKING: // CHECKING == 2
    			return 'CHECKING';
    			break;
    		case appCache.DOWNLOADING: // DOWNLOADING == 3
    			return 'DOWNLOADING';
    			break;
    		case appCache.UPDATEREADY: // UPDATEREADY == 5
    			return 'UPDATEREADY';
    			break;
    		case appCache.OBSOLETE: // OBSOLETE == 5
    			return 'OBSOLETE';
    			break;
    		default:
    			return 'UKNOWN CACHE STATUS';
    			break;
    		}	
    }
    alert(offline());
    </script>
   </head> 
  <body> 
오프라인 캐시~
  </body>
</html>  
    