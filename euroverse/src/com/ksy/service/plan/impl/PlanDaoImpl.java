package com.ksy.service.plan.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanDao;

@Repository
public class PlanDaoImpl implements PlanDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PlanDaoImpl() {
		super();
	}

	

	public List<Plan> getPlanList(String userId) throws Exception {
		return sqlSession.selectList("PlanMapper.getPlanList", userId);
	}

	public Plan getPlan(String planId) throws Exception {
		return sqlSession.selectOne("PlanMapper.getPlan", planId);
	}

	synchronized public void addPlan(Plan plan) throws Exception {
		sqlSession.insert("PlanMapper.addPlan", plan);
		
		sqlSession.insert("PlanMapper.addPlanPartyKing", plan.getPlanMaster().getUserId());
		
		String[] defaultTodos = {"�װ��� �����ϱ�", "�����Ʈ ¥��", "����ǥ �ۼ��ϱ�", "ȯ���ϱ�", "���� �����ϱ�", "�غ� ��� Ȯ���ϱ�", "������ ���� ���", "��������/���� �غ��ϱ�", "���Ϲ� ���� �˾ƺ���"};
		for (String string : defaultTodos) {
			sqlSession.insert("PlanMapper.addDefaultTodos", string);
		}
		
		String[] deafultStuffs = {"����", "�ź���", "�ſ�ī��/����", "����", "��ī��", "��Ƽ�����", "��Ų/�μ�", "���鵵��", "�ڹ���"};
		for (String string : deafultStuffs) {
			sqlSession.insert("PlanSubMapper.addDefaultStuffs", string);
		}
	}
	
	public void updatePlan(Plan plan) throws Exception {
		sqlSession.update("PlanMapper.updatePlan", plan);
	}

	public void updatePlanStatus(Plan plan) throws Exception {
		sqlSession.update("PlanMapper.updatePlanStatus", plan);
	}

	public void deletePlan(String planId) throws Exception {
		sqlSession.update("PlanMapper.deletePlan", planId);
	}

	public List<User> getPlanPartyList(String planId) throws Exception {
		return sqlSession.selectList("PlanMapper.getPlanPartyList", planId);
	}
	
	public void deletePlanParty(Party party) throws Exception {
		sqlSession.delete("PlanMapper.deletePlanParty", party);
	}

	
	public String checkUserFromParty(Party party) throws Exception {
		return sqlSession.selectOne("PlanMapper.checkUserFromParty", party);
	}

	public void addOffer(Offer offer) throws Exception {
		sqlSession.insert("PlanMapper.addOffer", offer);
	}
	
	
	@Override
	synchronized public String copyPlan(Plan plan) throws Exception {
		
		//sqlSession.insert("PlanMapper.copyPlan", planId);
		
		if( plan.getPlanMaster() != null ) {
			sqlSession.insert("PlanMapper.addPlan", plan);
			
			sqlSession.insert("PlanMapper.addPlanPartyKing", plan.getPlanMaster().getUserId() ); //�ʿ� ����..?
			
			String[] defaultTodos = {"�װ��� �����ϱ�", "�����Ʈ ¥��", "����ǥ �ۼ��ϱ�", "ȯ���ϱ�", "���� �����ϱ�", "�غ� ��� Ȯ���ϱ�", "������ ���� ���", "��������/���� �غ��ϱ�", "���Ϲ� ���� �˾ƺ���"};
			for (String string : defaultTodos) {
				sqlSession.insert("PlanMapper.addDefaultTodos", string);
			}
		}else {
			sqlSession.insert("PlanMapper.copyPlan", plan.getPlanId());
		}
		
		sqlSession.insert("PlanSubMapper.copyStuff", plan.getPlanId());
		sqlSession.insert("PlanSubMapper.copyCityRoute", plan.getPlanId());
		sqlSession.insert("PlanSubMapper.copyDaily", plan.getPlanId());
		
		String copiedPlanId = sqlSession.selectOne("PlanMapper.getPlanId");
		
		return copiedPlanId;
	}
	

	public List<Todo> getTodoList(String planId) throws Exception {
		return sqlSession.selectList("PlanMapper.getTodoList", planId);
	}

	public void checkTodo(Todo todo) throws Exception {
		sqlSession.update("PlanMapper.checkTodo", todo);
	}
	
	public void addTodo(Todo todo) throws Exception {
		sqlSession.insert("PlanMapper.addTodo", todo);
	}

	public void deleteTodo(String todoId) throws Exception {
		sqlSession.delete("PlanMapper.deleteTodo", todoId);	
	}
	
	/* �Ⱦ��� �޼ҵ� - ���߿� �����!! */
	public void updateTodoName(Todo todo) throws Exception {
		sqlSession.update("PlanMapper.updateTodoName", todo);
	}
	
	

	public List<Plan> getEndPlanList(String userId)throws Exception{
		return sqlSession.selectList("PlanMapper.getEndPlanList",userId);
	}
	
	public int getPlanCount(String userId)throws Exception{
		return sqlSession.selectOne("PlanMapper.getPlanCount",userId);
	}
		
	
	
	public int getUndoneCount(String userId) throws Exception {
		return sqlSession.selectOne("PlanMapper.getUndoneCount", userId);
	}
	
	public List<Plan> getUndonePlanId(String userId) throws Exception {
		return sqlSession.selectList("PlanMapper.getPlanIdList", userId);
	}
	
	public List<Todo> getUndoneTodo(String planId) throws Exception {
		return sqlSession.selectList("PlanMapper.getUndoneList", planId);
	}
	
	public List<Plan> getSoonPlanId(int leftDay) throws Exception {
		return sqlSession.selectList("PlanMapper.getSoonPlanId", leftDay);
	}
	
	public List<Todo> getSoonTodo(String planId) throws Exception {
		return sqlSession.selectList("PlanMapper.getSoonTodo", planId);
	}

	public List<User> getPushPhoneList(String planId) throws Exception {
		return sqlSession.selectList("PlanMapper.getPushPhoneList", planId);
	}



	
	//User Service�� �����ϴ� �޼ҵ�.... �׽�Ʈ������ ���⼭ ����� �� 
	/*
	 * public void updateUserSlot(String userId) throws Exception {
	 * sqlSession.update("PlanMapper.updateUserSlot", userId); } public String
	 * findUserId(String userId) throws Exception { return
	 * sqlSession.selectOne("PlanMapper.findUserId", userId); }
	 */

}
