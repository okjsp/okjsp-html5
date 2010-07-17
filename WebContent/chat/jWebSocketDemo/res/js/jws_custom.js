//	---------------------------------------------------------------------------
//	Custom specific WebSocket protocol implementation based jWebSocket Base Client
//	Copyright (c) 2010 Alexander Schulze, Innotrade GmbH, Herzogenrath
//	---------------------------------------------------------------------------
//	This program is free software; you can redistribute it and/or modify it
//	under the terms of the GNU Lesser General Public License as published by the
//	Free Software Foundation; either version 3 of the License, or (at your
//	option) any later version.
//	This program is distributed in the hope that it will be useful, but WITHOUT
//	ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//	FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for
//	more details.
//	You should have received a copy of the GNU Lesser General Public License along
//	with this program; if not, see <http://www.gnu.org/licenses/lgpl.html>.
//	---------------------------------------------------------------------------


//	---------------------------------------------------------------------------
//  jWebSocket custom client
//	This demo shows how to easily create a low level custom client
//	w/o the jWebSocket token processes.
//	---------------------------------------------------------------------------

jws.oop.declareClass( "jws", "jWebSocketCustomClient", jws.jWebSocketBaseClient, {

	processOpenEvent: function( aEvent ) {
		// can to be overwritten in descendant classes
		// to easily handle open event in this class
		if( console ) {
			console.log( "connected" );
		}
	},

	processMessageEvent: function( aEvent ) {
		// can to be overwritten in descendant classes
		// to easily handle message event in this class
		if( console ) {
			console.log( "message: " + aEvent.data );
		}
	},

	processCloseEvent: function( aEvent ) {
		// can to be overwritten in descendant classes
		// to easily handle open event in this class
		if( console ) {
			console.log( "disconnected" );
		}
	},

	connect: function( aURL, aOptions ) {
		var lRes = true;
		try {
			// call inherited connect, catching potential exception
			arguments.callee.inherited.call( this, aOptions );
		} catch( ex ) {
			// handle exception here
			lRes = false;
		}
		return lRes;
	},

	sendStream: function( aStream ) {
		var lRes = true;
		try {
			// call inherited sendStream, catching potential exception
			arguments.callee.inherited.call( this, aStream );
		} catch( ex ) {
			// handle exception here
			lRes = false;
		}
		return lRes;
	},

	disconnect: function( aOptions ) {
		var lRes = true;
		try {
			// call inherited disconnect, catching potential exception
			arguments.callee.inherited.call( this, aOptions );
		} catch( ex ) {
			// handle exception here
			lRes = false;
		}
		return lRes;
	}

});

