package com.ksy.web.admin;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksy.common.Page;
import com.ksy.common.Search;
import com.ksy.service.admin.AdminService;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.User;

@RestController
@RequestMapping("/admin/*")
public class AdminRestController {

	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;
	
	//������ ����� �ҷ���
	@RequestMapping(value="json/getUserList", method = RequestMethod.POST)
	public Map<String, Object> getUserList(@RequestBody Search search ) throws Exception {
		
		System.out.println("\n\n restController getUserList\n\n");
		
		User user = new User();
//		Search search = new Search();
		//���� �������� �׻� 1�� ����
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//map��  getUserList ���
		Map<String, Object> map = adminService.getUserList(search);
		
		//�������� �������� ����������� ���������� ã�ƿ��� �۾� 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ����� ==>"+map);
		
		
		return map;
	}
	
	// �����ڰ� �亯�� �����
	@RequestMapping(value="json/addQnaComment", method = RequestMethod.POST)
	public Map<String,Object> addQnaComment(@RequestBody Comment comment) throws Exception {
		
		//����� method ����
		System.out.println("\n\nAdminComtroller addQnaComment\n\n");
		//���ε����� �����
		System.out.println("comment==>"+comment);
		
		Map<String, Object> map = adminService.getQnaCommentList(comment.getPostId());
		List<String> list = (List<String>)map.get("list");//list.size �� 0�϶� add �亯�� �Ѱ��� �޼��ְ� �ϱ�����
		System.out.println("list size"+list.size());// list.size �����
		
		//add�� update�� �ϰ� �� comment�� �ٽ� map�� ������� map ����
		Map<String,Object> realMap = new HashMap<String,Object>();
		
		//list.size �� 0�϶�  ������ �亯 add ���Ǳ� ���´亯�Ϸ� ó���ϱ����� update post_grade= 'Q'
		if(list.size() == 0) {
			//comment�� update�� add�ϰ� ���� ó�������� map�� �ٸ�map�� put
			adminService.addQnaComment(comment);
			adminService.updateQnaGrade(comment.getPostId());
			realMap = adminService.getQnaCommentList(comment.getPostId());
		}// if
		
		//�亯�� �޾Ҵµ� �Ǵٴ°�� returnMap�� error�޼����� ��Ƽ� ajax�� ���������� map
		Map<String, Object> returnMap = new HashMap<String, Object>();	
		
		//�����
		System.out.println("\n\n realMap ����� "+realMap.get("list")+"\n\n");
		
		if(list.size() == 0) {
			realMap.put("returnMsg", "ok");
			return realMap;
		}//if
		else{
			returnMap.put("returnMsg", "error");
			return returnMap;
		}//else
		
	}//method
	
	//�����ڰ� �Է��� �亯�� ��ȸ
	@RequestMapping(value="json/getQnaCommentList/{postId}", method = RequestMethod.GET)
	public Map<String,Object> getQnaCommentList(@PathVariable String postId) throws Exception {
		
		System.out.println("\n\nAdminComtroller getQnaComment\n\n");
		
		System.out.println("postId==>"+postId);
		
		Map<String,Object> map = adminService.getQnaCommentList(postId);
		
		System.out.println("map ����� ==>"+map);
		
		return map;
	}
	
	// �����ڰ� �亯�� ������ �÷���ó�� deleted = "T" ���ÿ� post ������Ʈ 
	@RequestMapping(value="json/deleteQnaComm", method = RequestMethod.POST)
	public void deleteQnaComm(@RequestBody Comment comment) throws Exception {
		
		System.out.println("\n\nAdminComtroller deleteQnaComm\n\n");
		System.out.println("comment ==>"+comment);
		// cmtId, postId�� ���ε��� comment
		adminService.deleteQnaComm(comment.getCmtId());
		System.out.println("delete���� ==>"+comment);
		
		adminService.backUpQnaGrade(comment.getPostId());
		
		System.out.println("\n\ndeleteQnaComm End\n\n");
	}
	
	//�Խñ۱���
	@RequestMapping(value="json/updatePostReport/{refId}", method = RequestMethod.GET)
	public void updatePostReport(@PathVariable String refId) throws Exception {
		
		System.out.println("\n\nAdminComtroller updatePostReport\n\n");
		
		System.out.println("postId==>"+refId);
		
		adminService.updatePostReport(refId);
	}
	
	//��۱���
	@RequestMapping(value="json/updateCmtReport/{refId}", method = RequestMethod.GET)
	public void updateCmtReport(@PathVariable String refId) throws Exception {
		
		System.out.println("\n\nAdminComtroller updateCmtReport\n\n");
		
		System.out.println("cmtId==>"+refId);
		
		adminService.updateCommReport(refId);
	}
	

}
