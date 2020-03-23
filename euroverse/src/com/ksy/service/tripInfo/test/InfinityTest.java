package com.ksy.service.tripInfo.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksy.service.domain.TripInfo;
import com.ksy.service.tripInfo.TripInfoService;
import com.ksy.web.tripInfo.InfinityClick;


@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml", 
									"classpath:config/context-transaction.xml" })
public class InfinityTest {

	@Autowired
	@Qualifier("tripInfoServiceImpl")
	private TripInfoService service;

//	@Test
	public void addinfinityTest() throws Exception {

		System.out.println("infinityClickTest ����!");
		
		Map<Integer, String> imgMap = null;
		Map<Integer, String> infoMap = null;
		
//		for (int i = 1; i < 2; i++) {
			
			//ũ�Ѹ� ������ ���� ũ�Ѹ� ����
			InfinityClick selTest = new InfinityClick();//
			
			imgMap = selTest.imgCrawl();//ũ�Ѹ� �̹�����  map�� put
			infoMap = selTest.infoCrawl();//ũ�Ѹ� info map�� put
			
			//�����
			System.out.println("imgMap ����� ==>"+imgMap.size());
			System.out.println("infoMap ����� ==>"+infoMap.size());
//		}
		

		
		//����Ͻ� ������ ���� ���ε�
		for (int i = 0; i < imgMap.size(); i++) {
			
			//ũ�Ѹ��ؿ� ������ DB�� �ֱ����� �����λ���
			TripInfo tripInfo = new TripInfo();
			
			//�����
			System.out.println("imgMap ==>"+imgMap);
			System.out.println("infoMap ==>"+infoMap);
			
			//click�� img�ּҿ� info ���ε�
//			tripInfo.setUrl(imgMap.get(i));
//			tripInfo.setInfo(infoMap.get(i));
			
			//�����
			System.out.println("tripInfo ������ ����� ==>"+tripInfo);
			
			//��� ����
            service.addUrl(tripInfo);
		}

	}

//	@Test
	public void infinityTest() throws Exception {

		TripInfo tripInfo = new TripInfo();

		List<TripInfo> list = service.getUrl("GBR");
		list.get(1);
		System.out.println("list===>"+list);

//		Assert.assertEquals(59, tripInfo.getConId());
	}
}
