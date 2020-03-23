package com.ksy.web.tripInfo;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.service.domain.TripInfo;
import com.ksy.service.tripInfo.TripInfoService;



//==> ȸ������ RestController
@RestController
@RequestMapping("/api/*")
public class TripInfoRestController {
	
	///Field
	@Autowired
	@Qualifier("tripInfoServiceImpl")
	private TripInfoService tripInfoService;
		
	public TripInfoRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/tripAlam", method=RequestMethod.GET )
	public Map<String,Object> getNationInfo(  ) throws Exception{
		
		System.out.println("/json/tripAlam : GET");
		
		HttpClient httpClient = new DefaultHttpClient();
		
		System.out.println("tripalam");
		
		String addr = "http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=";
		String serviceKey="FZiC%2BGu2IHC5gmO3z1BLlSTFhEUKOdGmXwctgo8iuycxvGX8dSswTxpjzBcwxwAhuNDyrQCj%2BEdi4VSsu1XxIA%3D%3D";
		String parameter = "";
//		parameter = parameter +"&"+"numOfRows=10";
//		parameter = parameter +"&"+"pageNo=1";
		parameter = parameter +"&"+"isoCode1=FRA";
//		parameter = parameter+"&"+"isoCode2=UKR"; 
		String url = addr+serviceKey+parameter; 
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		System.out.println("=================================================================");
		System.out.println("httpResponse  ===>"+httpResponse);
		
		HttpEntity httpEntity = httpResponse.getEntity();
		
		System.out.println("httpEntity ====>"+httpEntity);
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonObject);
		Map<String, Object> map = (Map<String,Object>)jsonObject;
		System.out.println("map===>"+map);
		
		return map;
	}
	
	@RequestMapping( value="json/infinityClick/{conName}", method=RequestMethod.GET )
	public TripInfo infinityClick(@PathVariable String conName) throws Exception{
		
		System.out.println("infinityClick rest Controller Start");
		System.out.println("conName ==>"+conName);
		//conName�� �̿��ؼ� url���� list�� ��������
		List<TripInfo> list = tripInfoService.getUrl(conName);
		System.out.println("list����� ==>"+list);
		
		//list�� size��ŭ ���������� �߻���Ű������ ���� �ʵ�
		int indexNo = list.size();
		
		//�����޼��� ����
		Random random = new Random();
		
		// tripInfo ������ ����
		TripInfo tripInfo = new TripInfo();

		//id �� ���� ��� ������ �̿��ؼ� list���� ��� �̾ƿ���
		int id = random.nextInt(indexNo);
		tripInfo = list.get(id);
//		TripInfo tripInfo = tripInfoService.getUrl(id);
		
		System.out.println("tripInfo ����� ==>"+tripInfo);
		
		return tripInfo;
		
	}
	
//	@RequestMapping( value="json/exchange/{conCode}", method=RequestMethod.GET )
//	public Map<String,Object> exchange(@PathVariable String conCode ) throws Exception{
//		
//		System.out.println("json/exchage :: GET");
//		
//		HttpClient httpClient = new DefaultHttpClient();
//		
//		System.out.println("conName ����� ==>"+conCode);
//		
//		String addr = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?ServiceKey=";
//		String serviceKey="FZiC%2BGu2IHC5gmO3z1BLlSTFhEUKOdGmXwctgo8iuycxvGX8dSswTxpjzBcwxwAhuNDyrQCj%2BEdi4VSsu1XxIA%3D%3D";
//		String parameter = "";
//		parameter = parameter +"&"+"isoCode1="+conCode;
//		String url = addr+serviceKey+parameter; 
//		HttpGet httpGet = new HttpGet(url);
//		httpGet.setHeader("Accept", "application/json");
//		httpGet.setHeader("Content-Type", "application/json");
//		HttpResponse httpResponse = httpClient.execute(httpGet);
//		
//		System.out.println("=================================================================");
//		System.out.println("httpResponse  ===>"+httpResponse);
//		
//		HttpEntity httpEntity = httpResponse.getEntity();
//		
//		System.out.println("httpEntity ====>"+httpEntity);
//		InputStream is = httpEntity.getContent();
//		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
//		
//		JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
//		System.out.println(jsonObject);
//		Map<String, Object> map = (Map<String,Object>)jsonObject;
//		System.out.println("map===>"+map);
//		
//		return map;
//		
//	}
	
}