package com.ksy.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.common.Search;
import com.ksy.service.admin.AdminDao;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.User;

@Repository("adminDaoImpl")
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public AdminDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		
		System.out.println("AdminDaoImpl getUserList");
		return sqlSession.selectList("AdminMapper.getUserList", search);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		
		System.out.println("AdminDaoImpl getTotalCount");
		return sqlSession.selectOne("AdminMapper.getTotalCount", search);
	}
	@Override
	public void updatePostReport(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl updatePostReport");
		sqlSession.update("AdminMapper.adminPostBlocked", postId);
		
	}
	@Override
	public void updateCommReport(String commId) throws Exception {
		
		System.out.println("AdminDaoImpl updateCommReport");
		sqlSession.update("AdminMapper.adminCmtBlocked", commId);
	}
	//�����ڰ� �亯�� ����� �ҷ���
	@Override
	public List<Comment> getQnaComment(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl getQnaCommList");
		
		return sqlSession.selectList("AdminMapper.getQnaCommentList", postId);
		
	}
	//�����ڰ� ����� �Է���
	@Override
	public void addQnaComment(Comment comment) throws Exception{
		
		System.out.println("AdminDaoImpl addQnaComment");
		
		sqlSession.insert("AdminMapper.addQnaComment", comment);
	}
	//������ ������ ����� �ҷ���
	@Override
	public List<Post> getAdminQnAList(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getAdminQnAList");
		
		return sqlSession.selectList("AdminMapper.getAdminQnAList", search);
	}
	//����� ����Ʈ�� �ҷ����� ���� �Խñ�count
	@Override
	public int getAdminQnaListTotalCount(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getAdminQnaListTotalCount");
		
		return sqlSession.selectOne("AdminMapper.getAdminQnaListTotalCount", search);
	}
	//������ ������ 1:1���ǿ� �������� ����� �޸��� �÷��װ� ���� grade ="Q"
	@Override
	public void updateQnaGrade(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl updateQnaGrade");
		
		sqlSession.update("AdminMapper.updateQnaGrade",postId);
	}
	//�����ڰ� ����� ����� ������
	@Override
	public void deleteQnaComm(String cmtId) throws Exception{
		
		System.out.println("AdminDaoImpl deleteQnaComm");
		
		sqlSession.update("AdminMapper.deleteQnaComm",cmtId);
	}
	//�����ڰ� �Խñ��� �����Ұ�� post_grade ���� �ٽ� ���󺹱��� �亯�������� ���������
	@Override
	public void backUpQnaGrade(String postId) throws Exception{
		
		System.out.println("AdminDaoImpl deleteUpdateQnaGrade");
		
		sqlSession.update("AdminMapper.backUpQnaGrade", postId);
	}
	
	//������ �Ű�Խ��� �Խñ� ��ȸ
	@Override
	public List<Report> getPostReportList(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getPostReportList");
		
		return sqlSession.selectList("AdminMapper.getPostReportList", search);
	}
	

	
	//������ �Ű�Խ��� �Խñ� �Ѱ���
	@Override
	public int getPostReportTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("AdminMapper.getPostReportTotalCount", search);
	}
	
	//������ �Ű�Խ��� ��� ��ȸ
	@Override
	public List<Report> getCommentReportList(Search search) throws Exception{
		
		System.out.println("AdminDaoImpl getCommentReportList");
		
		return sqlSession.selectList("AdminMapper.getCommentReportList",search);
	}
	
	// ������ �Ű�Խ��� ��� �Ѱ���
	@Override
	public int getCommentReportTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("AdminMapper.getCommentReportTotalCount", search);
	}
	
}
