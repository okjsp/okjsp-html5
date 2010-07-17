

function makeImgExp( aId ) {
	var lImg = document.getElementById( aId );
	if( lImg ) {
		var lP = document.createElement( "p" );
		lP.innerHTML = "Screenshot";
		lP.className = "screenshotPlus";
		lP.onclick = function() {
			if( lImg.className != "screenshotOff" ) {
				lImg.className = "screenshotOff" ;
				lP.className = "screenshotPlus";
			} else {
				lImg.className = "screenshotOn";
				lP.className = "screenshotMinus";
			}
		};
		lImg.parentNode.insertBefore( lP, lImg );
	}
}

function makeVidExp( aId, aVidId ) {
	var lImg = document.getElementById( aId );
	if( lImg ) {
		var lP = document.createElement( "p" );
		lP.innerHTML = "Video" + (aVidId?" "+aVidId:"");
		lP.className = "screenshotPlus";
		lP.onclick = function() {
			if( lImg.className != "screenshotOff" ) {
				lImg.className = "screenshotOff" ;
				lP.className = "screenshotPlus";
			} else {
				lImg.className = "screenshotOn";
				lP.className = "screenshotMinus";
			}
		};
		lImg.parentNode.insertBefore( lP, lImg );
	}
}


function checkRedir( aRedir ) {
	var lFrameElem = this.frameElement;
	if( !lFrameElem ) {
		location.replace( aRedir );
	}
}

function jump2Hash( aContext, aHash ) {
	aContext.location.hash = "page="+aHash;
}
