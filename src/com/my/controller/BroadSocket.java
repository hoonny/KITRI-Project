package com.my.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.my.dao.MatchDAO;
import com.my.vo.Chat_room;
import com.my.vo.Customer;
import com.my.vo.Match_room;
 
@ServerEndpoint("/broadcasting")
public class BroadSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private Map<Chat_room, Session> users = new ConcurrentHashMap<>();
    private String email;
    
    
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {

        	clients.add(session);
        	System.out.println(session.getId() + "연결됨");
        	//users.put(session.getId(), session);

    }
    
    @OnClose
    public void onClose(Session session) throws IOException {
        clients.remove(session);
    	System.out.println(session.getId() + "종료됨");
    	users.remove(session.getId());
    }
}