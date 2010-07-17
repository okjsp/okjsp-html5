/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.jwebsocket.appserver;

import org.jwebsocket.token.Token;

/**
 * This interface is used to be implemented within a servlet. It allows servlets
 * to process events from WebSocket clients
 * @author aschulze
 */
public interface WebSocketServletTokenListener {

	/**
	 * This methods is called, when a WebSocket token client has been
	 * connected.
	 */
	public void processWebSocketOpen();

	/**
	 * This methods is called, when a token from a WebSocket token 
	 * client has been received.
	 */
	public void processWebSocketToken(Token aToken);

	/**
	 * This methods is called, when a WebSocket token client has been
	 * disconnected.
	 */
	public void processWebSocketClose();


}
