package com.amiko.ymd.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler {

	// �꽭�뀡�쓣 紐⑤몢 ���옣�븳�떎.
	// 諛⑸쾿 1 : 1:1 梨꾪똿
	// <�쎒�꽌鍮꾩뒪 �궗�슜 ID, websocket session ID>
	private Map<String, String> ids = new HashMap<String, String>();
	// <websocket session ID, websocket �떎�젣 session>
	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	/**
	 * �겢�씪�씠�뼵�듃 �뿰寃� �씠�썑�뿉 �떎�뻾�릺�뒗 硫붿냼�뱶
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String userId = (String) map.get("id");
		System.out.println("로그인아이디1 : " + userId);
		int lang = (int) map.get("lang");
		System.out.println("언어1 : " + lang);

		// 留듭쓣 �벝�븣 諛⑸쾿
		ids.put(userId, session.getId());
		sessions.put(session.getId(), session);

		// 0踰덉㎏ 以묎큵�샇�뿉 session.getId()�쓣 �꽔�쑝�씪�뒗�쑜
		logger.info("{} �뿰寃곕맖", session.getId());

	}

	/**
	 * �겢�씪�씠�뼵�듃媛� �쎒�냼耳� �꽌踰꾨줈 硫붿떆吏�瑜� �쟾�넚�뻽�쓣 �븣 �떎�뻾�릺�뒗 硫붿냼�뱶
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 0踰덉㎏�뿉 session.getId() 1踰덉㎏�뿉 message.getPayload() �꽔�쓬
		logger.info("{}濡� 遺��꽣 {} 諛쏆쓬", session.getId(), message.getPayload());
		// logger.info("{}濡쒕��꽣 {}諛쏆쓬", new
		// String[]{session.getId(),message.getPayload()});
		String sendMsg = message.getPayload();
		String[] msg = sendMsg.split("/%&%/");
		System.out.println(Arrays.toString(msg));
		
		String targetLoginId = msg[1];
		String targetSessionId = ids.get(targetLoginId);
		System.out.println("targetSessionId " + targetSessionId);
		WebSocketSession targetSession = sessions.get(targetSessionId);
		
		System.out.println(msg[0].equals("chatPopupOn"));
		
		if(msg[0].equals("chatPopupOn")) {
			System.out.println("@@@1");
			targetSession.sendMessage(new TextMessage("onChat/%&%/"+msg[2]));
			System.out.println("@@@2");
		}else if(msg[0].equals("close")) {
			targetSession.sendMessage(new TextMessage("상대방이 나갔습니다"));
		}else {
			
			targetSession.sendMessage(new TextMessage(message.getPayload()));
			
			targetLoginId = msg[2];
			targetSessionId = ids.get(targetLoginId);
			targetSession = sessions.get(targetSessionId);
			targetSession.sendMessage(new TextMessage(message.getPayload()));
		}

		// �뿰寃곕맂 紐⑤뱺 �겢�씪�씠�뼵�듃�뿉寃� 硫붿떆吏� �쟾�넚 : 由ъ뒪�듃 諛⑸쾿
//		for (WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage("echo:" + message.getPayload()));
//		}

		// 留� 諛⑸쾿.
		/*
		 * Iterator<String> sessionIds = sessions.ketSet().iterator(); String sessionId
		 * = ""; while (sessionIds.hasNext()) { sessionId = sessionIds.next();
		 * sessions.get(sessionId).sendMessage(new TextMessage("echo:" +
		 * message.getPayload()));
		 * 
		 * }
		 */

		// �뿰寃곕릺�뼱 �엳�뒗 紐⑤뱺 �겢�씪�씠�뼵�듃�뱾�뿉寃� 硫붿떆吏�瑜� �쟾�넚�븳�떎.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
	}

	/**
	 * �겢�씪�씠�뼵�듃 �뿰寃곗쓣 �걡�뿀�쓣 �븣 �떎�뻾�릺�뒗 硫붿냼�뱶
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String userId = (String) map.get("id");
		System.out.println("로그인 아이디2 : " + userId);
		int lang = (int) map.get("lang");
		System.out.println("언어2 : " + lang);

		// Map 삭제
		WebSocketSession session_id = sessions.get(userId);
		ids.remove(userId);
		sessions.remove(session_id);

		
		
		logger.info("{} 연결끊김", session.getId());
	}

}
