package com.ksy.web.chat.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.ksy.common.util.Util;
import com.ksy.service.domain.Chat;
import com.ksy.service.domain.Push;
import com.ksy.service.user.UserService;
import com.ksy.web.push.util.UserSocket;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

@ServerEndpoint("/accSocket/{roomId}/{userId}")
public class AccChatSocket {

	private static Map<String, List<Session>> accMap = new ConcurrentHashMap<>();
	private static UserSocket webSocket = new UserSocket();
	private Chat chat = new Chat();
	private String msg;
	
	// �� ������ ����Ǹ� ȣ��Ǵ� �̺�Ʈ
	@OnOpen
	public void handleOpen(@PathParam("roomId") String roomId, @PathParam("userId") String userId, Session session) throws Exception {
				System.out.println("\n����ä�� ::: [" + roomId + "]�� ä�ù濡 ["+userId+"] ����");
				UserService userService = (UserService)Util.getBean("userServiceImpl");
				List<Session> mapList = accMap.get(roomId); // ���� roomId�� session ����Ʈ ȣ��
				if (mapList == null || mapList.size() == 0) { // ���ٸ� ����
					mapList = new ArrayList<>();
				}
				mapList.add(session); // ������ or ȣ��� session ����Ʈ�� add
				accMap.put(roomId, mapList);
				
				List<String> userList = getChatMems(roomId);
				if( !userList.contains(userId)) {
					chat.setSenderId("system");
					chat.setChatContent(userId+"���� �����ϼ̽��ϴ�.");
					chat.setUser(userService.getUser(userId));
					msg = new ObjectMapper().writeValueAsString(chat);
					System.out.println(">> ���� �޽��� : "+msg);
					sendToRoom(roomId, msg);
					//sendToUser(userList, "chat");
				}
				
				
	}

	@OnMessage
	public void handleMessage(@PathParam("roomId") String roomId, @PathParam("userId") String userId,String message, Session session)
			throws Exception {
				// process booking from the given guest here
				UserService userService = (UserService)Util.getBean("userServiceImpl");
				System.out.println("[���� ä��] Client > Client : " + message);
				JSONObject jsonobj = (JSONObject)JSONValue.parse(message);
				ObjectMapper objectMapper = new ObjectMapper();
				chat = objectMapper.readValue(jsonobj.get("chat").toString(), Chat.class);
				SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
				chat.setSendTime(sdf.format(new Date()));
				if(!userId.equals("system")) {
						chat.setUser(userService.getUser(userId));
				}
				msg = new ObjectMapper().writeValueAsString(chat);
				
				sendToRoom(roomId, msg);
				insertMongo(msg);
				
				List<String> userList = getChatMems(roomId);
				//sendToUser(userList, "chat");

	}

	// �� ������ ������ ȣ��Ǵ� �̺�Ʈ
	@OnClose
	public void handleClose(@PathParam("roomId") String roomId, @PathParam("userId") String userId, Session session) throws Exception {
				
			System.out.println("[���� ä��] "+roomId+"�� �� ["+userId+"] ����");
			for (Map.Entry<String, List<Session>> entry : accMap.entrySet()) {
				System.out.println("�����ϴ� getKey :::: " + entry.getKey());
				if (entry.getKey().equals(roomId)) {
					entry.getValue().remove(session);
				}
			}
//			chat.setSenderId("system");
//			chat.setChatContent(userId+"���� �����ϼ̽��ϴ�.");
//			msg = new ObjectMapper().writeValueAsString(chat);
//			System.out.println(">> ���� �޽��� : "+msg);
//			
//			List<String> userList = getChatMems(roomId);
//			sendToUser(userList, "chat");
		
	}

	//�� ������ ������ ���� ȣ��Ǵ� �̺�Ʈ
	@OnError
	public void handleError(Throwable t) {
				t.printStackTrace();
	}
	
	
	private void sendToRoom(String roomId, String message) throws Exception {
		
		for (Map.Entry<String, List<Session>> entry : accMap.entrySet()) {
			System.out.println("[���� ä��] getKey :::: " + entry.getKey()+" || message : "+message);
			if (entry.getKey().equals(roomId)) {
				for (Session se : entry.getValue()) {
					se.getBasicRemote().sendText(message);
					System.out.println(roomId+"�� ���� �޽��� : "+message);
				}
			}
		}
		
	}
	
	private void sendToUser(List<String> users, String type) throws Exception {
		Push push = new Push();
		push.setPushType(type);
		webSocket.sendChat(users, push);
	}
	
	private void insertMongo(String json) throws Exception {
				
				// ������� ���� ������ �������� ������ �����
				MongoClient mongoConn = new MongoClient("192.168.0.82", 27017);
				MongoDatabase mongoDB = mongoConn.getDatabase("Euroverse");
				System.out.println("insertMongo :: String json = "+json);
				Chat chat = jsonToChat(json);
				System.out.println("insertMongo :: Chat chat = "+chat);
				// �÷��� ������ �������� ������ ���θ���� 
				MongoCollection<Document> coll = mongoDB.getCollection("Chat");
				List<String> readers = new ArrayList<String>();
				readers.add(chat.getSenderId());
				Document chatToDB = new Document("chatContent", chat.getChatContent())
						.append("chatDate", new Date())
						.append("senderId", chat.getSenderId())
						.append("readers", readers)
						.append("sendTime", chat.getSendTime())
						.append("chatRoomId", chat.getChatRoomId()
						);
				System.out.println("\n\t\t MongoDB ���� �� Chat ::: "+chat);
				coll.insertOne(chatToDB);  // �̳��� 73������ 77������ ����Ŭ���ִ� ������ �״��  ����db�� ����.
				//coll.updateOne(filter, update, options);  // �̳��� 84������ 90�������� �ִ³��ε� �ߺ��Ȱ� ������Ʈ�ϰ� ������ insert �ϸ鼭 ����db�� ���� .. �̰�¯��
				System.out.println("��������");
				
				mongoConn.close();
	}
	
	private List<String> getChatMems(String roomId) throws Exception {
		
		MongoClient mongoConn = new MongoClient("192.168.0.82", 27017);
		MongoDatabase mongoDB = mongoConn.getDatabase("Euroverse");

		MongoCollection<Document> coll = mongoDB.getCollection("ChatRoom");
		BasicDBObject query = new BasicDBObject("_id", new ObjectId(roomId));
		FindIterable<Document> fit = coll.find(query);
		Document doc = fit.first();
		List<String> userIdList = (List<String>)doc.get("chatMems");
		
		for(String userId : userIdList ) {
			System.out.println(roomId +"�� �����ϰ� �ִ� ȸ�� : "+userId);
		}
		mongoConn.close();
		return userIdList;
	}
	
	private Chat jsonToChat(String json) throws Exception {
		//JSONObject jsonobj = (JSONObject)JSONValue.parse(json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Chat chat = objectMapper.readValue(json, Chat.class);
		System.out.println(":: json > Chat : "+chat);
		
		return chat;
	}
	
	private String chatToJson(Chat chat) throws Exception {
		return new ObjectMapper().writeValueAsString(chat);
	}
	
	
	public void sendChat(Chat chat) throws Exception {
		System.out.println("chat/json/sendChat :: @RequestBody Chat : "+chat);
		
//		// ������� ���� ������ �������� ������ �����
//		MongoClient mongoConn = new MongoClient("localhost", 27017);
//		MongoDatabase mongoDB = mongoConn.getDatabase("Euroverse");
//		
//		// �÷��� ������ �������� ������ ���θ���� 
//		MongoCollection<Document> coll = mongoDB.getCollection("chat");
//		Bson filter = Filters.eq("_id",chat.getChatId());
//		Bson update = new Document("$set", new
//				Document("_id", chat.getChatId()) 
//				.append("chatContent", chat.getChatContent())
//				.append("chatDate", chat.getChatDate())
//				.append("senderId", chat.getSenderId())
//				.append("chatRoomId", chat.getChatRoomId()));
//		
//		UpdateOptions options = new UpdateOptions().upsert(true); // ������ update, ������ insert
//		System.out.println("��2");
//		
//		//coll.insertOne(doc);  // �̳��� 73������ 77������ ����Ŭ���ִ� ������ �״��  ����db�� ����.
//		coll.updateOne(filter, update, options);  // �̳��� 84������ 90�������� �ִ³��ε� �ߺ��Ȱ� ������Ʈ�ϰ� ������ insert �ϸ鼭 ����db�� ���� .. �̰�¯��
//		System.out.println("��������");
//		
//		mongoConn.close();
		msg = new ObjectMapper().writeValueAsString(chat);
		sendToRoom(chat.getChatRoomId(), msg);
		insertMongo(msg);
	}
	
}