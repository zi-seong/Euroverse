package com.ksy.service.like;

import java.util.List;

import com.ksy.service.domain.Like;
import com.ksy.service.domain.Post;

public interface LikeDao {

	public void like_check(Like like) throws Exception ;
		
	public void like_check_cancel(Like like) throws Exception ;

	public int countByLike(Like like) throws Exception ;
		
	public Like getLike(Like like) throws Exception ;
	
	public void addLike(Like like) throws Exception ;
	
	
	/////////////////////////�������������� �ű�////////////////////////////////////
	public List<Like> getBookMarkList(String userId)throws Exception;
	public Post getBookMarkPost(String postId)throws Exception;
	public List<Like> getLikeOrderList(String userId)throws Exception;
	////////////////////////////////////////////
	
	
}