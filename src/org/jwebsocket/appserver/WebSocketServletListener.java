/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.jwebsocket.appserver;

import org.jwebsocket.api.WebSocketPaket;

/**
 * This interface is used to be implemented within a servlet.
 * @author aschulze
 */
public interface WebSocketServletListener {

	/**
	 * This methods is called, when a WebSocket client has been connected.
	 */
	public void processWebSocketOpen();

	/**
	 * This methods is called, when a message from a WebSocket client has been received
	 */
	public void processWebSocketMessage(WebSocketPaket aPacket);

	/**
	 * This methods is called, when a WebSocket client has been disconnected.
	 */
	public void processWebSocketClose();

}
