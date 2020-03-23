package com.ksy.web.tripInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksy.service.domain.TripInfo;
import com.ksy.service.tripInfo.TripInfoService;



//==> ȸ������ RestController
@Controller
@RequestMapping("/api/*")
public class TripInfoController {
	
	///Field
	@Autowired
	@Qualifier("tripInfoServiceImpl")
	private TripInfoService service;
	
	
	private WebDriver driver;
	private WebElement webElement;
	
	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:\\chromedriver.exe";
	
	private String base_url;
		
	public TripInfoController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="infinityClick", method=RequestMethod.GET)
	public String infinityClick(@ModelAttribute("tripInfo") TripInfo tripInfo, Model model) throws Exception{
		
		System.out.println("infinityClick Controller Start");
		
//		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
//		
//		//�˻��� ������ �ʵ�� ����
//		driver = new ChromeDriver();
//		String dreamCity = "����";
//		
//		for (int no = 6; no < 10; no++) {
//		
//		// pixabay Ȩ���������� ũ�Ѹ� �˻������� ���̳����ϰ�
//		base_url = "https://pixabay.com/ko/images/search/" + dreamCity + "/?cat=buildings&pagi="+String.valueOf(no);
//		
//		//WebDriver�� web url �����ͼ� ���� 
//		driver.get(base_url);
//		//WebDriver�� xpath�� �����ͼ� click ��Ű��
//		driver.findElement(By.xpath("//*[@id=\"content\"]/div/div[1]/div/label/input")).click();
//		
//		//selenium�� �����Ǵ� By Class�� �̿��Ͽ� CssSeletor�� Css���� 
//		By picture = By.cssSelector("div.flex_grid.credits.search_results > div > a > img");
//		
//		//seletor�� ������ tag�� webElement���·� list�� ����.
//		List<WebElement> pictures = driver.findElements(picture);
//				
//		//�����
//		System.out.println("pictures ==>" + pictures);
//		System.out.println("pictures ����� ==>" + pictures.size());
//		
//		//ũ�Ѹ��ؿ� ���� ���� map����.
//		Map<Integer, String> urlMap = new HashMap<Integer,String>();
//		Map<Integer, String> infoMap = new HashMap<Integer, String>();
//		webElement = driver.findElement(picture);
//		
//			//�̹���,���� ũ�Ѹ�
//			for (int i = 0; i < pictures.size(); i++) {
//						
//				//WebElement�� �ִ� getAttribute �޼��带 ����ϱ����� cssSelector�� select�ؿ� �±׸� ����
//				WebElement pic = pictures.get(i);
//				
//				//�̹����� ������ִ� src�±׿�, alt�±׿� ���� String ������ �ֱ�
//				String url = pic.getAttribute("src");
//				String info = pic.getAttribute("alt");
//						
//				//�� �̹����� �ּҿ� �Ӽ��� �����
////				System.out.println("url ����� ==>"+url);
////				System.out.println("info ����� ==>"+info);
//						
//				//ũ�Ѹ��ؼ� �������� data���� Ȯ���� (.gif)������ �츮������ �ʿ���� �Ϸ���Ʈ ������ �� ������ ���� �ʿ� ������� if�� 
//				if (url.contains("blank.gif")) {
//					
//					url =  null;
//					info = null;//blank�� �� url�� info�� ����
//				
//				}else if(url != null && info != null) {
//							
//					urlMap.put(i,url);
//					infoMap.put(i,info);
//					System.out.println("urlMap ==>"+urlMap);
//					System.out.println("infoMap ==>"+infoMap);
//					
//				}//else if
//			}//end of for 
//			
//			for (int i = 0; i < urlMap.size(); i++) {
//				
//				tripInfo.setUrl(urlMap.get(i));
//				tripInfo.setInfo(infoMap.get(i));
//				
//				System.out.println("tripInfo ����� ==>"+tripInfo);
//				
////				busness Losic Connect...
//				service.addUrl(tripInfo);
//				
//			}//end of inner_for
//			
//		}//end of outer_for
		
//			System.out.println("infinityClick ����");
//			Random random = new Random();
//			
//			int id = random.nextInt(73);//���� ���� �߻� 67������ ������ 67������
//			System.out.println("id ����� ==>"+id);
//			
//			tripInfo = service.getUrl(id);//�������� �ο��� id���� �̿��ؼ� �������� ȣ���ϱ�
//			
//			System.out.println("TripInfo ����� ==>"+tripInfo);
//			
//			model.addAttribute("tripInfo",tripInfo);
//			System.out.println("model �����==>"+model);
			
		
		return "forward:/view/tripInfo/infinityClick.jsp";
		
	}
	
	@RequestMapping(value="exchange", method=RequestMethod.GET)
	public String exchange() throws Exception{
		
		return "forward:/view/tripInfo/exchange.jsp";
	
	}
	

}