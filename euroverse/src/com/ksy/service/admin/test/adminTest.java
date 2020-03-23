package com.ksy.service.admin.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
import com.ksy.service.community.CommunityService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.sun.jmx.snmp.Timestamp;


@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml", 
									"classpath:config/context-transaction.xml" })
public class adminTest {

	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService service;
	
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService comService;
	

//	@Test
	public void testGetUserList() throws Exception {

		System.out.println("getUserList Test start!");
		
		//Search�� ���������� ���̶� �Խñ۰��� �� �ֱ�
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		//search�������� �̿��ؼ� service�� getUserList�� map�� �ν��Ͻ�
		Map<String,Object> map = service.getUserList(search);
		
		//list�� map.put�� ���� get�ؿ��� list�� totalcount�� map�� �����
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		//totalcount �� IntegerŸ���� ��ü�� ����
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
//		search.setCurrentPage(1);
//		search.setPageSize(3);
//		search.setSearchCondition("0");
//		search.setSearchKeyword("");
//		map = service.getUserList(search);
//		
//		list = (List<Object>)map.get("list");
//		Assert.assertEquals(3, list.size());
		
	}
	
//	@Test
	public void testUpdatePostReport() throws Exception{
		
		System.out.println("testUpdatePostReport TEST START");
		Post post = new Post();
		
//		service.updatePostReport("90000");
		post = comService.getPost("90000", "admin", "A");
		
		System.out.println("post.getBlocked ==>"+post.getBlocked());
		Assert.assertEquals("T", post.getBlocked());
	}
	
//	@Test
	public void testUpdateCommReport() throws Exception{
		
		System.out.println("testUpdateCommReport TEST START");
		Comment comment = new Comment();
		
		service.updateCommReport("90000");
		comment = comService.getComment("90000");
//		comService.upda
		
		System.out.println("comment.getBlockd ==>"+comment.getBlocked());
		Assert.assertEquals("T", comment.getBlocked());
	}
	
//	@Test
	public void testGetQnaComment() throws Exception{
		
		System.out.println("testGetQnaComment TEST START");
		
		Comment comment = new Comment();
		
//		comment = service.getQnaComment("90000");
		
		System.out.println("comment �����  ==>"+comment);
//		Assert.assertEquals("T", comment.getBlocked());
	}
	
//	@Test
	public void testaddQnaComment() throws Exception{
		
		System.out.println("testGetQnaComment TEST START");
		
		Timestamp time = new Timestamp();
		
		
		Post post = new Post();
		Comment comment = new Comment();
//		post.setPostId("90001");
		comment.setPostId("90000");
//		comment.setCmtId("90001");
		comment.setNickName("test");
		comment.setCmtWriterId("user01");
//		comment.setCmtDate("202001121400");
		comment.setCmtContent("�ȳ��ϼ��� ��������������������");
		
		service.addQnaComment(comment);
//		comment = service.getQnaComment("90001");
		
		System.out.println("comment �����  ==>"+comment);
//		Assert.assertEquals("T", comment.getBlocked());
	}
	

}
