package com.ksy.web.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.common.Config;
import com.ksy.common.MailUtils;
import com.ksy.service.domain.LoginUser;
import com.ksy.service.domain.Point;
import com.ksy.service.domain.User;
import com.ksy.service.myPage.MyPageService;
import com.ksy.service.user.UserService;

import java.io.File;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;




@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("myPageServiceImpl")
	private MyPageService myPageService;
	
	@Autowired
	private JavaMailSender mailSender;	
	
	public UserRestController() {
		System.out.println(this.getClass() + "default Constructor");
	}

	@RequestMapping(value = "json/login" , method = RequestMethod.POST )
	public synchronized Map login(@RequestBody User user , HttpSession session )throws Exception {
//		System.out.println("�α��� ����Ʈ ��Ʈ�ѷ�!");
		System.out.println("������ �� ������~");
		System.out.println(user.getUserId());
		System.out.println(user.getPwd());
		
		User dbUser = userService.getUser(user.getUserId());
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		if ( dbUser == null ) { 
			returnMap.put("result", "errorId");
		}else {
			
			
			if(dbUser.getRole().equals("X")) {
				returnMap.put("result", "unReg");
				returnMap.put("userId",dbUser.getUserId());
				
				if(dbUser.getPwd().equals(user.getPwd())) {
					returnMap.put("checkPwd", "errorPwd");
				}
				
				return returnMap;
				
			}
			
			
			if(!dbUser.getPwd().equals(user.getPwd())) {
				returnMap.put("result", "errorPwd");
			}
			else {
				//ŽĹ�� ����Ʈ ���� �����ð��� 30��
				session.setAttribute("user", dbUser);
				returnMap.put("result", "ok");
				returnMap.put("userId", dbUser.getUserId());
				//get �����ϰ� ������ �ٷ� add�ϰ� ������ �������ϰ� add�ϱ�
				LoginUser loginUser = (LoginUser)myPageService.getLoginUser(dbUser.getUserId());
				if(loginUser == null) {
					LoginUser newLoginUser = new LoginUser();
					newLoginUser.setUserId(user.getUserId());
					newLoginUser.setSessionId(session.getId());
					myPageService.addLoginUser(newLoginUser);
				}else {
					if(loginUser.getSessionId().equals(session.getId())) {
						System.out.println("�Ȱ��� ���ǿ��� ���� ���̵�� �α��� ���ִ°� Ȯ�������� �� �����");
					}else if(!loginUser.getSessionId().equals(session.getId())) {
						LoginUser updateLoginUser = new LoginUser();
						updateLoginUser.setUserId(user.getUserId());
						updateLoginUser.setSessionId(session.getId());
						myPageService.updateLoginUser(updateLoginUser);
					}
					
				}
				
			}
		}
		return returnMap;
	}
	
	@RequestMapping(value="json/logout")
	public void logout(HttpSession session) throws Exception {
		session.removeAttribute("user");
		session.invalidate();
	}
	
	@RequestMapping(value="json/updateRole")
	public Map updateRole(HttpSession session)throws Exception{
		User user = (User)session.getAttribute("user");
		
		userService.updateRole(user.getUserId());
		
		User reloadUser = userService.getUser(user.getUserId());
		
		
		
		
		session.setAttribute("user", reloadUser);
		Map<String, String> returnMap = new HashMap<String, String>();
		
		returnMap.put("returnMsg", "ok");
		
		return returnMap;
	}
	
	
	@RequestMapping(value = "json/checkUser")
	public Map checkUser(@RequestBody Map jsonMap)throws Exception {
		System.out.println("checkUser========");
		ObjectMapper objectMapper = new ObjectMapper();
		String mapString = objectMapper.writeValueAsString(jsonMap);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		Map<String, String> profileMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});
		System.out.println("userID"+profileMap.get("userId"));
		System.out.println("userName"+profileMap.get("userName"));
		System.out.println("email"+profileMap.get("email"));
		System.out.println("phone"+profileMap.get("phone"));
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		User dbUser = userService.getUser(profileMap.get("userId"));
		System.out.println("���� ����!"+dbUser);
		
		
		
		if(dbUser != null) {
			if(dbUser.getUserName().equals(profileMap.get("userName"))) {
				System.out.println("����? �̰� ������ �� �̻��ѵ�?");
			
				if(profileMap.get("phone")=="" || profileMap.get("phone")==null) {
				
					if(dbUser.getEmail().equals(profileMap.get("email"))) {
						returnMap.put("result", "ok");
						return returnMap;
					}else{
						returnMap.put("result", "�̸����� ��ġ���� �ʽ��ϴ�.");
						return returnMap;
					}
					
				}else if(profileMap.get("email")==""|| profileMap.get("email")==null) {
					if(dbUser.getPhone().equals(profileMap.get("phone"))){
						returnMap.put("result","ok");
						return returnMap;
					}else {
						returnMap.put("result", "�޴�����ȣ�� ��ġ���� �ʽ��ϴ�.");
						return returnMap;
					}
					
				}else {
					returnMap.put("result","�޴��� �Ǵ� �̸����� �ٽ� Ȯ�� �ϼ���.");
					return returnMap;
				}

			}else {
				returnMap.put("result","�̸��� �߸� �Է��Ͽ����ϴ�.");
				return returnMap;
			}
		}else {
			returnMap.put("result", "��ġ�ϴ� ȸ���� �����ϴ�.");
			return returnMap;
		}
		
	}
	
	
	
	@RequestMapping(value = "json/checkDuplicate")
	public Map Checkduplicate(@RequestBody Map jsonMap) throws Exception {
		ObjectMapper objMap = new ObjectMapper();
		String mapString = objMap.writeValueAsString(jsonMap);
		JSONObject jsonObj = (JSONObject)JSONValue.parse(mapString);
		
		
		Map<String, String> checkMap = objMap.readValue(jsonObj.toString(), new TypeReference<Map<String, String>>(){});
		Map<String, String> returnMap = new HashMap<String, String>();
		
		
		if(checkMap.get("userId") != null) {
				System.out.println("userId�� �ߺ�üũ");
				System.out.println(checkMap.get("userId"));
				String dbUserId = userService.checkUserId(checkMap.get("userId"));
				if(dbUserId == null) {
					returnMap.put("result","ok");
					return returnMap;
				}else {
					returnMap.put("result","error");
					return returnMap;
				}
				
		}
		
		if(checkMap.get("nickname") != null) {
				System.out.println("nickname���� �ߺ�üũ");
				System.out.println(checkMap.get("nickname"));
				String dbNickname = userService.checkNickname(checkMap.get("nickname"));
				if(dbNickname == null) {
					returnMap.put("result","ok");
					return returnMap;
				}else {
					returnMap.put("result","error");
					return returnMap;
				}
			
		}
		return returnMap;
	}
	
	
	@RequestMapping(value = "json/getUserId")
	public List<String> getUserId(@RequestBody Map jsonMap) throws Exception{
		System.out.println("userIdList==========================================================");
		System.out.println(jsonMap);
		ObjectMapper objectMapper = new ObjectMapper();
		String mapString = objectMapper.writeValueAsString(jsonMap);
		System.out.println(mapString);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		System.out.println("jsonObject~!=="+jsonObject);
		Map<String, String> profileMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});

		List<String> idList = new ArrayList<String>();

		User settingUser = new User();
		settingUser.setUserName(profileMap.get("userName"));
		if(profileMap.get("email") == null||profileMap.get("email").equals(" @ ") || profileMap.get("email").equals("@") || profileMap.get("email").equals("") ){//<< �̰� ���� null üũ�� �� �ڿ��� �ߴµ� �տ����� üũ�ϴϱ� ���� ���ļ� �مf���� ���� �����ϼ�
			System.out.println("�ڵ������� ����Ʈ �̱�");
			settingUser.setPhone(profileMap.get("phone"));
			idList = userService.getUserIdList(settingUser);
		}else if(profileMap.get("phone") == null || profileMap.get("phone").equals("--") ||profileMap.get("phone").equals(" - - ") || profileMap.get("phone").equals("") ) {
			System.out.println("�̸��Ϸ� ����Ʈ �̱�");
			settingUser.setEmail(profileMap.get("email"));
			idList = userService.getUserIdList(settingUser);
		}else {
			System.out.println("���....");
		}
		
		if(idList.size()==0) {
			System.out.println("�ƹ��͵� �����ϴ�!!");
			idList.add("error");
		}
		System.out.println("���̵� ����Ʈ~="+idList);
		
		return idList;
	}
	
	
	
	@RequestMapping(value = "json/googleLoginUrlMake")
	public Map googleLogin(HttpSession session) throws UnsupportedEncodingException {
		String clientId = "";
		String redirectUrl = "http://localhost:8080/user/googleLoginLogic&";

		StringBuffer googleLoginUrl = new StringBuffer();
		googleLoginUrl.append("https://accounts.google.com/o/oauth2/v2/auth?");
		googleLoginUrl.append("scope=https://www.googleapis.com/auth/analytics.readonly&");
		googleLoginUrl.append("access_type=offline&");
		googleLoginUrl.append("include_granted_scopes=true&");
		googleLoginUrl.append("state=state_parameter_passthrough_value&");
		googleLoginUrl.append("redirect_uri=");
		googleLoginUrl.append(redirectUrl);
		googleLoginUrl.append("response_type=code&");
		googleLoginUrl.append("client_id=");
		googleLoginUrl.append(clientId);
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", googleLoginUrl.toString());
		System.out.println(map.get("url"));
		
		return map;
	}
	
	
	@RequestMapping( value = "json/naverLoginUrlMake" )
	public Map naverLogin( HttpSession session ) throws Exception {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		session.setAttribute("state", state); 
		
		String clientId = "";
		
		String redirectUrl = URLEncoder.encode("http://192.168.0.70:8080/user/naverLoginLogic", "UTF-8");
		
		String naverLoginUrl = 	"https://nid.naver.com/oauth2.0/authorize?response_type=code" + 
								"&client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&state="+(String)session.getAttribute("state");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", naverLoginUrl);
		
		return map;
	}
	
	
	
	@RequestMapping( value = "json/kakaoLoginUrlMake" )
	public Map loginKakao( HttpSession session ) throws Exception {
		String clientId = "";

		String redirectUrl = "http://192.168.0.70:8080/user/kakaoLoginLogic";
		
		String kakaoLoginUrl = 	"https://kauth.kakao.com/oauth/authorize?" + 
								"client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&response_type=code";
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", kakaoLoginUrl);
		
		return map;

		
	}
	
	
	
	@RequestMapping(value="json/checkPhone")
	public Map checkPhoneValue(@RequestBody Map jsonMap )throws Exception {
		ObjectMapper objectMapper2 = new ObjectMapper();
		System.out.println("����� üũ��!!!!");
		System.out.println(jsonMap);
		String mapString = objectMapper2.writeValueAsString(jsonMap);
		System.out.println(mapString);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		
		Map<String, String> phoneMap = objectMapper2.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});
		String phone = phoneMap.get("phone");
		
		String[] receiverPhone = phone.split("-");
		phone="";
		for(int i = 0 ; i<receiverPhone.length;i++) {
			phone+=receiverPhone[i];
		}
		
		
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(45, random).toString(36);//36�����ϸ�0~9 a~z���� ���
		
		String hostname = "api.bluehouselab.com";
	    String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey)
	        );

	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the execution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);

	        DefaultHttpClient client = new DefaultHttpClient();
	        System.out.println("Ʈ������!");
	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
	            
	            Map<String, Object> smsMap = new HashMap<String, Object>();
	            smsMap.put("sender",Config.sender);
	            smsMap.put("content", Config.content+state);
	           // smsMap.put("receivers","01066614577");
	            List<String> receivers = new ArrayList<String>();
	            receivers.add(phone);
	            smsMap.put("receivers", receivers);
	            
	            ObjectMapper objectMapper = new ObjectMapper();
	            String jsonbefore = objectMapper.writeValueAsString(smsMap);
	            
	            System.out.println("-----------jsonbefore ? : " + jsonbefore);
	            
	            
	            StringEntity se = new StringEntity(jsonbefore, "UTF-8");
	            httpPost.setEntity(se);

	            HttpResponse httpResponse = client.execute(httpPost, context);
	            System.out.println(httpResponse.getStatusLine().getStatusCode());

	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if(inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	                String line = "";
	                while((line = bufferedReader.readLine()) != null)
	                    System.out.println(line);
	                inputStream.close();
	            }
	        } catch (Exception e) {
	        	System.out.println("����...");
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }
		
		
	        System.out.println("����� �� ����Ʈ~");
	        System.out.println("������ȣ��="+state);
	    	Map<String, String> returnMap = new HashMap<String, String>();
			returnMap.put("result", "done");
			
			// ���������� ���� state�� ��ȯ
			returnMap.put("phoneCheck", state);
			
		
		return returnMap;
	}
	
	
	@RequestMapping( value = "json/checkMail" )
	public Map checkMailValue( @RequestBody Map jsonMap ) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("����� üũ����!!!");
		System.out.println(jsonMap);
		String mapString = objectMapper.writeValueAsString(jsonMap);
		System.out.println(mapString);
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		
		Map<String, String> mailMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});
		String email = mailMap.get("email");

		String userId = mailMap.get("userId");
		if(userId != null) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+userId);
		}else {
			System.out.println("�������̵��!!!!!! ���Դϴ�@!@!#@@!@");
		}
		
		System.out.println("===================="+email);
		// ���� ���� �� �Է��� ���� ���� 
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(45, random).toString(36);//36�����ϸ�0~9 a~z���� ���
//		
//		// Autowired�� JavaMailSender�� MailUtils ��ü ���� 
//		MailUtils sendMail = new MailUtils(mailSender);
//		
//		// JavaMailSender.setSubject(title) :: ���� ���� ���� 
//		sendMail.setSubject("[Model2 MVC Shop] ȸ������ �̸��� ����");
//		
//		// JavaMailSender.setText(text) :: ���� ���� ���� 
//		// StringBuffer�� �ۼ� 
//		sendMail.setText(new StringBuffer().append("<h1>[�̸��� ����ȣȣȣ�P!!!]</h1>")
//				.append("<p>�Ʒ� ���ڸ� �Է��Ͻø� �̸��� ������ �Ϸ�˴ϴ�.</p>")
//				.append("<p>�Է� ���� :: </p>&nbsp;")
//				// ���������� ���� state�� ���Ϸ� �߼� 
//				.append("<h2><b>" + state +"</b></h2>")
//				.toString());
//		
//		// JavaMailSender.setFrom(senderEmail, senderName) :: ���� �ۼ��� ���� 
//		//sendMail.setFrom("jiseong4577@gmail.com", "Model2 MVC Shop");
//		
//		// JavaMailSender.setTo(receiverEmail) :: ���� ������ ���� 
//		sendMail.setTo(email);
		
		// JavaMailSender.send :: ������ ������ �������� ���� ����
		System.out.println("��ƾƾƾƾƾƾ�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		//sendMail.send();
		System.out.println("��������!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Map<String, String> returnMap = new HashMap<String, String>();
		String host = "smtp.gmail.com";
		int port=465;
		
		
		Properties prop  = System.getProperties();
		
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port",port);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust",host);
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
					String un = "�̸����Է��ϱ�";
					String pw = "��й�ȣ�Է��ϱ�";
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication(un, pw);
					}			
		});
		
		session.setDebug(true);
		
		MimeMessage mimemessage = new MimeMessage(session);
		mimemessage.setFrom(new InternetAddress("�̸����Է�"));
		mimemessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		mimemessage.setSubject("Euroverse �̸��� ����");
		mimemessage.setText("");
		
		String goUrl = "/user/updatePwd?userId="+userId;//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< �ҿ����� �̰� url�̾�... ���� ���ؼ� �̾���
		
		Multipart	multi = new MimeMultipart("related");
		MimeBodyPart mbp = new MimeBodyPart();
		StringBuffer str = new StringBuffer();
		String tag = " <div style=\"width:1000px;height:800px;border-radius: 10px;background-color:#b2ecee;padding: 1em;text-align: center;\">\r\n" + 
				"                <img src=\"resources/images/icon/euroverse_text3.png\" style='width:500px;height:auto;'>\r\n" + 
				"            <div style=\"font-size:30px;margin:20px;text-align: center;background-color:white;border-radius: 10px;padding: 1em;\">\r\n" + 
				"                <h4>Euroverse, ���� ������ ����</h4>\r\n" + 
				"                <span style=\"font-size:12pt;\">����� ��ٸ��� �鸸 ���� �÷��ʿ� �Բ��ϼ���. <br>\r\n" + 
				"                <br>\r\n" + 
				"                <hr>\r\n" + 
				"                <br>������ȣ�� ������ �����ϴ�.</span><br><br>\r\n" + 
				"                <span style=\"font-size:12pt;\">"+state+"</span>\r\n" + 
				"                <br><br>\r\n" + 
				"            </div>";
//		str.append("<div style='width:1000px;height:800px;border:1px solid'>");
//			str.append("<div style='font-size:30px;margin:20px;text-align:center'>");
//			str.append("<img alt='��������' src='cid:image' width='500px' height='auto'><br>");
//			str.append("<b>���������� ����</b><br>" + 
//					"����� ��ٸ��� �鸸 ���� �÷��ʿ� �Բ��ϼ���.<br>");
//			str.append("<small>������ȣ</small> : <b>"+state+"</b>");
//			str.append("</div>");
//		str.append("</div>");
		str.append(tag);
		
		
		
		
		mbp.setContent(str.toString(), "text/html; charset=utf-8");
		multi.addBodyPart(mbp);
		
		mbp = new MimeBodyPart();
		FileDataSource fds = new FileDataSource("C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\icon\\euroverse_text3.png");
		
		mbp.setDataHandler(new DataHandler(fds));
		mbp.setHeader("Content-ID", "<image>");
		
		multi.addBodyPart(mbp);
		mimemessage.setContent(multi);		
		
		System.out.println("mimemessage::::::::::::::::::::::::::::::::::::::::"+mimemessage);
		Transport.send(mimemessage);	
		
		
		
		returnMap.put("result", "done");
		
		// ���������� ���� state�� ��ȯ
		returnMap.put("mailCheck", state);
		
		return returnMap;
	}
	
	@RequestMapping(value="json/getUser")
	public String getUser(@RequestParam(value="userId") String userId ) throws Exception {
		User user = userService.getUser(userId);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(user);
		System.out.println("json/getUser ::"+jsonString);
		return jsonString;
	}
	
	
	
	
	
	
	
	
	
}
