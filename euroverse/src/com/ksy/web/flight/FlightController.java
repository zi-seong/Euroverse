package com.ksy.web.flight;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksy.service.domain.Flight;
import com.ksy.service.flight.FlightService;
import com.ksy.service.order.OrderService;
import com.ksy.service.user.UserService;

@Controller
@RequestMapping("/flight/*")
public class FlightController {

	@Autowired
	@Qualifier("orderServiceImpl")
	private OrderService orderService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("flightServiceImpl")
	private FlightService flightService;

	public FlightController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{comm4onProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value = "getFlight", method = RequestMethod.GET)
	public String getFlight(@RequestParam("flightId")String flightId , Model model) throws Exception {
		System.out.println("/getFlight : GET");
		
		Flight flgith = flightService.getFlight(flightId);
		
		model.addAttribute("flgith",flgith);

		return "forward:/flight/getFlight.jsp";
	}
	
	@RequestMapping(value = "addFlight" , method = RequestMethod.GET)
	public void addFlight(@ModelAttribute("flight")Flight flight , Model model) throws Exception {
		System.out.println("/addFlight : GET");
		
		System.out.println("flight : "+flight);
		flight = flightService.addFlight(flight);
		
		model.addAttribute("flight",flight);
	}
	

	// Filed
	private WebDriver driver;
	private WebElement webElement;

	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:/selenium-java-3.141.59/chromedriver_win32/chromedriver.exe";

	// ũ�Ѹ� �� URL
	private String base_url;

	////////////////////////////////////////////////////////////
	@RequestMapping(value = "searchFlight", method = RequestMethod.POST)
	public String searchFlight(@ModelAttribute("flight")Flight flight , Model model) throws Exception {
		System.out.println("/selenium : POST");
		//User�� �Է��� �� get
		String depCity = flight.getDepCity();
		String arrCity = flight.getArrCity();
		String depDate = flight.getDepDate().replace("-", "");
		
		int adultNum = flight.getAdultNum();
		int childNum = flight.getChildNum();
		int infantNum = flight.getInfantNum();
		String tripCourse = flight.getTripCourse();
		String seatGrade = flight.getSeatGrade();
		System.out.println("seat1"+seatGrade);
		String grade = "";
		if (seatGrade.equals("O")) {
			 grade = "�Ϲݼ�";
		}else if(seatGrade.equals("R")) {
			 grade = "�����̾� �Ϲݼ�";
		}else if(seatGrade.equals("C")) {
			 grade = "����Ͻ���";
		}else if(seatGrade.equals("F")) {
			 grade = "�ϵ";
		}
		System.out.println("seat2"+seatGrade);
		System.out.println("grade"+grade);
		
		
		//depDate �Ľ�
		String year = depDate.substring(0, 4);
		String month = depDate.substring(4, 5);// ��
		if (depDate.charAt(4) == '0') {
			month = depDate.substring(5, 6);
		} else {
			return month;
		}
		String date = depDate.substring(6); // ��
		
		String arrDate = flight.getArrDate().replace("-", "");
		//arrDate �Ľ�
		String year2 = arrDate.substring(0, 4);
		String month2 = arrDate.substring(4, 5);// ��
		if (arrDate.charAt(4) == '0') {
			month2 = arrDate.substring(5, 6);
		} else {
			return month2;
		}
		String date2 = arrDate.substring(6); // ��
		System.out.println("year : " + year+"	year2 : "+year2);
		System.out.println("month : " + month+"	month2 : "+month2);
		System.out.println("date :" + date+"	date2 : "+date2);
		System.out.println("flight : "+flight);
		System.out.println("dep : " + depCity);
		System.out.println("arr : " + arrCity);
		
		

		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver(options);
		
//		options = webdriver.ChromeOptions() ,
//				options.add_argument('headless') ,
//				options.add_argument('disable-gpu') ,
//				driver = webdriver.Chrome('/Applications/chromedriver', options=options);
		
		base_url = "http://fly.interpark.com/?mbn=tour&mln=tour_air";

		String keyword = "";
		try {
			// get page (= ���������� url�� �ּ�â�� ���� �� request �� �Ͱ� ����)
			driver.get(base_url);

			System.out.println("selenium ����");
			synchronized (driver) {
				driver.wait(200);
			}
				if (tripCourse.equals("R")) {
					driver.findElement(By.xpath("//*[@id=\"dBodyContent\"]/div[1]/div/div[1]/ul/li[1]/a")).click();
				}else if(tripCourse.equals("O")) {
					driver.findElement(By.xpath("//*[@id=\"dBodyContent\"]/div[1]/div/div[1]/ul/li[2]/a")).click();
				}
			synchronized (driver) {
				driver.wait(200);
			}
			// depCity �˻�â ����
			webElement = driver.findElement(By.xpath("//*[@id=\"dep_name\"]"));
			webElement.click();
			webElement.clear();
			synchronized (driver) {
				driver.wait(500);
			}
			webElement.sendKeys(depCity);
			synchronized (driver) {
				driver.wait(1000);
			}
			driver.findElement(By.xpath("//*[@id=\"depCitySearch\"]/div[2]/div/ul/li/a")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// arrCity �˻�â ����
			webElement = driver.findElement(By.xpath("//*[@id=\"arr_name\"]"));
			webElement.click();
			webElement.clear();
			synchronized (driver) {
				driver.wait(500);
			}
			webElement.sendKeys(arrCity);
			synchronized (driver) {
				driver.wait(1000);
			}
			driver.findElement(By.xpath("//*[@id=\"arrCitySearch\"]/div[2]/div/ul/li/a")).click();

			synchronized (driver) {
				driver.wait(500);
			}
			// �޷� ������ ����
			driver.findElement(By.xpath("//*[@id=\"depDateArrDate\"]")).click();
			synchronized (driver) {
				driver.wait(500);
			}
		
	if (flight.getTripCourse().equals("R")) { //�պ��϶�,,,

			// ��,�� ������ Ŭ�� :  dep
			driver.findElement(By.xpath("//*[@id=\"section0\"]/div[2]/strong/a")).click();
			synchronized (driver) {
				driver.wait(500);
			} 
			// �⵵ Ŭ�� : dep
			driver.findElement(By.xpath("//*[@id=\"0_" + year + "\"]")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// �� Ŭ�� : dep
			driver.findElement(By.cssSelector("#year_container0 > ul.moth > li:nth-child(" + month + ")")).click();
			synchronized (driver) {
				driver.wait(500);

			}
			// depDate ����
			driver.findElement(By.xpath("//*[@id=\"dd" + date + "_0\"]/a")).click();
			synchronized (driver) {
				driver.wait(1000);
			}
			// ��,�� ������ Ŭ�� : arr  
			driver.findElement(By.xpath("//*[@id=\"section1\"]/div[2]/strong/a")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			//�⵵ Ŭ�� : arr
			driver.findElement(By.xpath("//*[@id=\"1_" + year2 + "\"]")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// �� Ŭ�� : arr
			driver.findElement(By.cssSelector("#year_container1 > ul.moth > li:nth-child(" + month2 + ")")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// arrDate ����
			driver.findElement(By.xpath("//*[@id=\"dd" + date2 + "_1\"]/a")).click();
			synchronized (driver) {
				driver.wait(800);
			}
			//�޷� �Ϸ� -> Ȯ�ι�ư Ŭ��
			driver.findElement(By.cssSelector("#cal > div > div.dFoot > a.btn1.btn-enter")).click();
			
	}else if(flight.getTripCourse().equals("O")) { //���϶�
		 System.out.println("����???");
			// ��,�� ������ Ŭ�� :  dep
			driver.findElement(By.xpath("//*[@id=\"section0\"]/div[2]/strong/a")).click();
			synchronized (driver) {
				driver.wait(500);
			} 
			// �⵵ Ŭ�� : dep
			driver.findElement(By.xpath("//*[@id=\"0_" + year + "\"]")).click();
			synchronized (driver) {
				driver.wait(500);
			}
			// �� Ŭ�� : dep
			driver.findElement(By.cssSelector("#year_container0 > ul.moth > li:nth-child(" + month + ")")).click();
			synchronized (driver) {
				driver.wait(500);

			}
			// depDate ����
			driver.findElement(By.xpath("//*[@id=\"dd" + date + "_0\"]/a")).click();
			synchronized (driver) {
				driver.wait(1000);
			}
			//�޷� �Ϸ� -> Ȯ�ι�ư Ŭ��
			driver.findElement(By.cssSelector("#cal > div > div.dFoot > a.btn1.btn-enter")).click();
	}
			//�ο��� num ����
			driver.findElement(By.xpath("//*[@id=\"peopleChoice\"]")).click();
			if (adultNum > 0) {
				String adult = Integer.toString(adultNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Adt\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(adult);
			}else if(childNum > 0 ) {
				String child = Integer.toString(childNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Chd\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(child);
			}else if(infantNum > 0) {
				String infant = Integer.toString(infantNum);
				webElement = driver.findElement(By.xpath("//*[@id=\"Inf\"]"));
				webElement.click();
				webElement.clear();
				webElement.sendKeys(infant);
			}
			synchronized (driver) {
				driver.wait(300);
			}
			driver.findElement(By.xpath("//*[@id=\"classSel\"]/button")).click();
			synchronized (driver) {
				driver.wait(200);
			}
			//seat_grade ����
			webElement = driver.findElement(By.cssSelector("#classSel > ul > li > a").linkText(grade));
			webElement.click();
			synchronized (driver) {
				driver.wait(200);
			}
			//Ȯ�ι�ư Ŭ��
			driver.findElement(By.cssSelector("#peopleChoicePop > div.dFoot > button.btn1.btn-enter")).click();
			synchronized (driver) {
				driver.wait(200);
			}
			//�˻���ư Ŭ��
			driver.findElement(By.cssSelector("#searchButton > span")).click();

			System.out.println("============");
			System.out.println("selenium �Ϸ�");
			
			synchronized (driver) {
				driver.wait(13500);

			}
			// List�ȿ� �ʿ��� ������ �ֱ�
			List<WebElement> airline = driver.findElements(By.cssSelector("#schedule0List > li > div.t1"));
			List<WebElement> dep = driver.findElements(By.cssSelector("#schedule0List > li > div.t2"));
			List<WebElement> arr = driver.findElements(By.cssSelector("#schedule0List > li > div.t3"));
			List<WebElement> stopOver = driver.findElements(By.cssSelector("#schedule0List > li > div.t4"));
			List<WebElement> leadTime = driver.findElements(By.cssSelector("#schedule0List > li > div.t5"));
			List<WebElement> num = driver.findElements(By.cssSelector("#schedule0List > li > div.t6"));
			List<WebElement> price = driver.findElements(By.cssSelector("#schedule0List > li > div.t7"));
			
			List<String> detail = new ArrayList<String>();
			for (WebElement list : airline) {
				detail.add(list.getText());
			}
			List<String> detail2 = new ArrayList<String>();
			for (WebElement list : dep) {
				detail2.add(list.getText().substring(3));
			}
			List<String> detail3 = new ArrayList<String>();
			for (WebElement list : arr) {
				detail3.add(list.getText().substring(3).replace("+1", ""));
			}
			List<String> detail4 = new ArrayList<String>();
			for (WebElement list : stopOver) {
				detail4.add(list.getText());
			}
			List<String> detail5 = new ArrayList<String>();
			for (WebElement list : leadTime) {
				detail5.add(list.getText());
			}
			List<String> detail6 = new ArrayList<String>();
			for (WebElement list : num) {
				detail6.add(list.getText());
			}
			List<String> detail7 = new ArrayList<String>();
			for (WebElement list : price) {
					System.out.println("������.."+list.getText());
					detail7.add(list.getText().replace("��", "").substring(8,15).replace(",", "").trim());
//					detail7.add(list.getText().substring(7,12).replace(",", "").trim());
//					detail7.add(list.getText().substring(8,16).replace(",", "").trim());
				
			}
			

			for (int j = 1; j < detail.size(); j++) {
				System.out.println("==============" + j + "�� �װ���=============");
				for (int i = 1; i < 9; i++) {
					System.out.println("t1(�װ���) ::" + detail.get(i * j));
					System.out.println("t2(�������) ::" + detail2.get(i * j));
					System.out.println("t3(��������) ::" + detail3.get(i * j));
					System.out.println("t4(����) ::" + detail4.get(i * j));
					System.out.println("t5(�ҿ�ð�) ::" + detail5.get(i * j));
					System.out.println("t6(�ο�) ::" + detail6.get(i * j));
					System.out.println("t7(����) ::" + detail7.get(i * j));
				}
				
				List<Flight> flightList = new ArrayList<Flight>();
				for (int i = 0; i < detail.size(); i++) {
					//String detail8 = detail7.get(i).substring(7 , 15).replace(",", "");
					flight = new Flight();
					flight.setAirline(detail.get(i));
					flight.setDepTime(detail2.get(i));
					flight.setArrTime(detail3.get(i));
					flight.setDepDate(depDate);
					flight.setArrDate(arrDate);
					flight.setStopOver(detail4.get(i));
					flight.setLeadTime(detail5.get(i));
					flight.setAdultNum(adultNum);
					flight.setChildNum(childNum);
					flight.setInfantNum(infantNum);
					flight.setTripCourse(tripCourse);
					flight.setDepCity(depCity);
					flight.setArrCity(arrCity);
					flight.setSeatGrade(seatGrade);
					flight.setPrice(Integer.parseInt(detail7.get(i)));
					flightList.add(flight);
					
//	        		   flight.setAirline(detail.get(i));
//	        		   flight.setDeptDate(detail2.get(i));
//	        		   flightList.add(flight);
					model.addAttribute("flightList", flightList);
					System.out.println("flight : " + flight);
					//System.out.println("flightList2 : " + flightList);
				}
			}
			synchronized (driver) {
				driver.wait(13500);

			}
		} catch (IndexOutOfBoundsException ie) {
			System.out.println("IndexOutOfBounds");
			ie.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			
			driver.close();
			Runtime.getRuntime().exec("taskkill /F /IM chromedriver.exe /T");

		}

		////////////////////////////////////////////////////////////

		return "forward:/view/flight/getFlightList.jsp";

	}

	
}