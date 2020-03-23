package com.ksy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.User;

public interface AdminDao {

	//�� ������ List�� page Data�� �������� ���� �޼���
	public List<User> getUserList(Search search) throws Exception;
	
	// page�� �� �������� �� �������� ���� �޼���  �� page���� �������� int �� ����
	public int getTotalCount(Search search) throws Exception;
	 
	public void updatePostReport(String postId) throws Exception;
	
	public void updateCommReport(String commId) throws Exception;
	
	//getQnaCommentList �� select*from ���� ������ �ۼ�
	public List<Comment> getQnaComment(String postId) throws Exception;
	
	public void addQnaComment(Comment comment) throws Exception;
	
	public List<Post> getAdminQnAList(Search search) throws Exception;
	
	public int getAdminQnaListTotalCount(Search search) throws Exception;
	
	public void updateQnaGrade(String postId) throws Exception;
	
	public void deleteQnaComm(String cmtId) throws Exception;
	
	public void backUpQnaGrade(String postId) throws Exception;
	
	public List<Report> getPostReportList(Search search) throws Exception;
	
	public List<Report> getCommentReportList(Search search) throws Exception;
	
	public int getPostReportTotalCount(Search search) throws Exception;
	
	public int getCommentReportTotalCount(Search search) throws Exception;
	
	
}
