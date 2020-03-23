package com.ksy.service.push;

import java.util.List;
import java.util.Map;

import com.ksy.common.Search;
import com.ksy.service.domain.Push;


public interface PushService {
	// �˸� ������ �߰�
	public void addPush(Push push) throws Exception;
	
	// �˸� ��� ��ȸ
	public Map<String, Object> getPushList(Search search, String userId) throws Exception;
	
	// �˸� ����
	public void readPush(String userId) throws Exception;
	
	// �˸� ����
	public void deletePush(List<String> pushId) throws Exception;
	
	// �� ���� �˸� ��
	public int getUnreadCount(String userId) throws Exception;

}
