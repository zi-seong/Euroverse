package com.ksy.service.like.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.Like;
import com.ksy.service.domain.Post;
import com.ksy.service.like.LikeDao;

//==> ȸ������ DAO CRUD ����
@Repository("likeDaoImpl")
public class LikeDaoImpl implements LikeDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public LikeDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void like_check(Like like) throws Exception {
		sqlSession.update("LikeMapper.like_check", like);
	}
		
	public void like_check_cancel(Like like) throws Exception {
		sqlSession.update("LikeMapper.like_check_cancel", like);
	}

	public int countByLike(Like like) throws Exception {
		return sqlSession.selectOne("LikeMapper.countByLike", like);
	}
	
	public Like getLike(Like like) throws Exception {

		if( like.getRefId() == null ) {
			if (like.getLikeType() == "R") {
				System.out.println("refId �� null�϶� ����!&& Type �� R");
				String refId = sqlSession.selectOne("LikeMapper.getRoomRefId");
				like.setRefId(refId);
			}else {
				System.out.println("refId �� null�϶� ����!");
				String refId = sqlSession.selectOne("LikeMapper.getFlightRefId");
				like.setRefId(refId);
			}
		}
		return sqlSession.selectOne("LikeMapper.getLike", like);
	}
	
	public void addLike(Like like) throws Exception {
		sqlSession.insert("LikeMapper.addLike", like);
	}
	
	
	
	
	
	
	
	////////////////////////�������� �ű�//////////////////////////////////////
	public List<Like> getBookMarkList(String userId)throws Exception{
		System.out.println("myPageDaoImpl getBookMarkList()");
		
		return sqlSession.selectList("LikeMapper.getBookMarkList",userId);
	}
	
	
	public Post getBookMarkPost(String postId)throws Exception{
		System.out.println("myPageDaoImpl getBookMarkPost()");
		
		
		
		return sqlSession.selectOne("LikeMapper.getBookMarkPost",postId);
	}
	
	public List<Like> getLikeOrderList(String userId)throws Exception{
		
		return sqlSession.selectList("LikeMapper.getLikeOrderList",userId);
	}
	///////////////////////////////////////////////////////////////////
	
	
}