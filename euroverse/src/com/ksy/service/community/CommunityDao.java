package com.ksy.service.community;

import java.util.List;

import com.ksy.common.Search;
import com.ksy.service.domain.Comment;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Post;
import com.ksy.service.domain.Report;
import com.ksy.service.domain.Tag;

public interface CommunityDao {
	
	public void addPost(Post post) throws Exception ;
	
	public void addOffer(Offer offer) throws Exception ;
	
	public void addTag(String tagContent, String postId) throws Exception ;
	
	public void updatePost(Post post) throws Exception ;
	
	public void updateTag(Tag tag) throws Exception ;
	
	public void deleteTag(String postId) throws Exception ;
	
	public void deleteOffer(String offerId) throws Exception ;
	
	public Post getPost(String postId, String userId, String boardName) throws Exception ;
	
	public Post getMainPost(String postId, String userId, String boardName) throws Exception;
	
	public List<Tag> getTagList(String postId) throws Exception ;
	
	public List<Party> getParty(String postId) throws Exception ;

	public List<Post> getPostList(Search search, String boardName) throws Exception ;
	
	public List<Post> getAllPostList(Search search) throws Exception ;
	
	public List<Post> getPlanPostList(Search search, String boardName) throws Exception ;
	
	public List<Post> getBestPostList(Search search, String boardName) throws Exception ;
	
	public List<Comment> getCommentList(Search search, String postId, String userId) throws Exception ;
	
	public List<Comment> rcmtNum(String postId, String userId) throws Exception ;
	
	public List<Party> getMyPartyList(String userId) throws Exception ;
	
	public List<Offer> getMyOfferList(Search search, String userId) throws Exception ;
	
	public int getMyOfferTotalCount(String userId) throws Exception ;
	
	public int getPostTotalCount(Search search, String boardName) throws Exception ;
	
	public int getAllPostTotalCount(Search search) throws Exception ;
	
	public int getCommentTotalCount(Search search, String postId) throws Exception ;
	
	public int getRecommentTotalCount(Search search, String postId) throws Exception ;

	public void addComment(Comment comment) throws Exception ;
	
	public void updateLike(String cmtId) throws Exception;
	
	public void updatePostLike(String postId) throws Exception;
	
	public void updateUnlike(String cmtId) throws Exception;
	
	public int selectLike(String postId) throws Exception;
	
	public Comment getComment(String cmtId) throws Exception;
	
	public int getRecommentCount(String cmtId) throws Exception;
	
	public void deleteComment2(String cmtId) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(String cmtId) throws Exception;
	
	public void addReport(Report report) throws Exception ;
	
	public void dayBestReset() throws Exception ;
	
	public void weekBestReset() throws Exception ;
	
	public void monthBestReset() throws Exception ;
	
	public void deletePost(String postId) throws Exception;
	
	public void deletePartyUser(String partyId) throws Exception;
	

	
	
	
	
	
	///////////////////////////�������������� �Űܿ�////////////////////////////
	public List<Post> getMyPostList(Search search, String userId)throws Exception;
	public int getMyPostListTotalCount(String userId)throws Exception;
	
	public List<Comment> getMyCommentList(Search search,String userId)throws Exception;
	public int getMyCommentListTotalCount(String userId)throws Exception;
	//////////////////////////////////////////////////////////////////////
}
