package com.ksy.service.plan.test;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import com.ksy.common.util.Util;
import com.ksy.service.domain.City;
import com.ksy.service.domain.Daily;
import com.ksy.service.domain.Day;
import com.ksy.service.domain.Memo;
import com.ksy.service.domain.Offer;
import com.ksy.service.domain.Party;
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;

/*
 *	FileName :  PlanServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class PlanServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	/* Plan Controller �׽�Ʈ�� ���̾ */
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;

	
	@Test
	public void testGetPlanListByUserId() throws Exception {
		
		String userId = "admin";
		
		List<Plan> planList = planService.getPlanList(userId);
		
		System.out.println("\n\n\n	list size : "+planList.size());
		System.out.println("\n\n\n	planList :: "+planList);
	}
	
	//@Test
	public void testGetPlanByPlanId() throws Exception {
		
		String planId = "10030";
		Plan plan = planService.getPlan(planId);
		
		System.out.println("\n\n	plan : "+plan);
		
		planId = "10002";
		plan = planService.getPlan(planId);
		
		System.out.println("\n\n	plan : "+plan);	
	}
	
	
	//******** 		Controller �׽�Ʈ		  ********//
	// ===>>> PlanControllerTest.java �� �Űܰ���������������
	//@Test
	public void testGetPlanController() throws Exception {
		Model model = new Model() {
			
			@Override
			public Model mergeAttributes(Map<String, ?> arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean containsAttribute(String arg0) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public Map<String, Object> asMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAttribute(String arg0, Object arg1) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAttribute(Object arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAllAttributes(Map<String, ?> arg0) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAllAttributes(Collection<?> arg0) {
				// TODO Auto-generated method stub
				return null;
			}
		};
		
		String planId = "10000";
		
		
		Plan plan = planService.getPlan(planId);
		//plan_id, plan_title, plan_img, plan_type, start_date, plan_status, (cr.sum - (cr.cnt-1)) plan_total_days, pt.plan_party_size 
		
		List<User> planPartyList = planService.getPlanPartyList(planId);	//planPartyList
		plan.setPlanPartyList(planPartyList);
		
		List<Todo> todoList = planService.getTodoList(planId); 				//todoList
		plan.setTodoList(todoList);
		
	
		//List<Daily> dailyList = planSubService.getDailyList(planId);		//dailyList
		List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
		List<Memo> memoList = planSubService.getMemoList(planId);			//memoList
		//plan.setDailyList(dailyList);
		plan.setStuffList(stuffList);
		plan.setMemoList(memoList);
		
		List<City> listCity = planSubService.getCityRouteList(planId);	
		/* */plan.setCityList(listCity);
		model.addAttribute("listCity", listCity);	//Plan �ʵ忡 CityList ��� �𵨿� �ɾ���... :: ���� ����?
		
		//List<Day> dayList = Util.cityListToDayList(listCity);
		//lan.setDayList(dayList);
		
		plan.setPlanDday( Util.getDday(plan.getStartDate()));		//���� D-Day
		plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//������������
		
		
		//���� ����� ���� ����Ʈ : model�� �ɾ �����ֱ�
		//List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		/* *///plan.setBudgetOverviewList(budgetOverviewList);
		//model.addAttribute("budgetOverviewList", budgetOverviewList);
		
		model.addAttribute("plan", plan);
		
		System.out.println("\n\n- - - - - - - - - - - - plan - - - - - - - - - - \n");
		System.out.println(plan);
		
		String returnString = "forward:/plan/getPlan.jsp";
	}
	
	
	
	//@Test
	public void testGetTodoListByPlanId() throws Exception {
		
		String planId = "10000";
		List<Todo> todoList = planService.getTodoList(planId);
		
		System.out.println("\n\n	todoList : "+todoList);
	}
	
	//@Test
	public void testGetPlanPartyListByPlanId() throws Exception {
		
		String planId = "10000";
		List<User> planPartyList = planService.getPlanPartyList(planId);
		
		System.out.println("\n\n	planPartyList : "+planPartyList);
	}
	
	//@Test
	public void testAddPlan() throws Exception {	//����!
		
		Plan plan = new Plan();
		User planMaster = new User();
		planMaster.setUserId("test2222");
		plan.setPlanMaster(planMaster);
		plan.setPlanTitle("�׽�Ʈ�÷�22");
		plan.setPlanImg("gooood.jpg");
		plan.setPlanType("D");
		plan.setStartDateString("20201212");	//������ ���� �������մϴ� ���� -> ���ۿ��� TO_DATE �������༭ �ذ�
		
		planService.addPlan(plan);
	}
	
	
	//@Test
	public void testUpdatePlan() throws Exception {		//����!
		
		
		Plan plan = planService.getPlan("10030");
		
		System.out.println("	before plan :: "+plan);
		
		plan = new Plan();
	
		plan.setPlanId("10030");
		plan.setPlanTitle("updatePlanTest");
		plan.setPlanImg("updateComplete.jpg");
		plan.setPlanType("C");
		plan.setStartDateString("20201212");	
		
		planService.updatePlan(plan);
		
		plan = new Plan();
		plan = planService.getPlan("10030");
		
		System.out.println("	after plan :: "+plan);	
	}
	
	//@Test
	public void testUpdatePlanStatus() throws Exception {		//����!
		
		Plan plan = planService.getPlan("10030");
		System.out.println("	before plan :: "+plan);
		
		plan = new Plan();
		plan.setPlanId("10030");
		plan.setPlanStatus("C");
		
		planService.updatePlanStatus(plan);
		
		plan = planService.getPlan("10030");
		System.out.println("	after plan :: "+plan);	
	}
	
	//@Test
	public void testDeletePlan() throws Exception {		//����!
		
		String userId = "admin";
		List<Plan> planList = planService.getPlanList(userId);
		System.out.println("\n\n\n	before planList :: "+planList);
		
		planService.deletePlan("10001");
		
		planList = planService.getPlanList(userId);
		System.out.println("\n\n\n	after planList :: "+planList);
	}
	
	//@Test
	public void testDeletePlanParty() throws Exception {		//����!
		
		String planId = "10000";
		List<User> planPartyList = planService.getPlanPartyList(planId);
		System.out.println("\n\n	planPartyList : "+planPartyList);
				
		Party party = new Party();
		party.setPartyUserId("testMember");
		party.setRefId("10000");
		
		planService.deletePlanParty(party);
		
		planPartyList = planService.getPlanPartyList(planId);
		System.out.println("\n\n	planPartyList : "+planPartyList);
	}
	
	//@Test
	public void testCheckUserFromParty() throws Exception {		//����!
		
		Party party = new Party();
		party.setPartyUserId("user01");
		party.setRefId("10000");
		
		String userId = planService.checkUserFromParty(party);
		if( userId != null ) {
			System.out.println(userId + " ���� �̹� �÷��ʿ� �������� ����Դϴ�");
		}else {
			System.out.println("user01" +"���� �ʴ��ұ��?");
		}
		
		party.setPartyUserId("testMember");
		
		String userId2 = planService.checkUserFromParty(party);
		if( userId2 != null ) {
			System.out.println(userId2 + " ���� �̹� �÷��ʿ� �������� ����Դϴ�");
		}else {
			System.out.println("testMember" +" ���� �ʴ��ұ��?");
		}
	}
	
	//@Test
	public void testAddOffer() throws Exception {		//����!
		
		Offer offer = new Offer();
		offer.setRefId("10000");
		offer.setFromUserId("admin");
		offer.setToUserId("sysy");
		offer.setOfferMsg("�޽��� ������~~");
		
		planService.addOffer(offer);
	}
	
	//@Test
	public void testCheckTodo() throws Exception {		//����!
		
		Todo todo = new Todo();
		todo.setTodoId("10023");
		todo.setTodoCheck("T");
		
		planService.checkTodo(todo);
	}
	
	//@Test
	public void testAddTodo() throws Exception {		//����!
		
		Todo todo = new Todo();
		todo.setTodoName("���γֱ� �׽�Ʈ");
		todo.setPlanId("10030");
		
		planService.addTodo(todo);
	}
	
	//@Test
	public void testUpdateTodoName() throws Exception {		//����!
		
		Todo todo = new Todo();
		todo.setTodoName("�����̸� ���� �׽�Ʈ");
		todo.setTodoId("10023");
		
		planService.updateTodoName(todo);
	}
	
	//@Test
	public void testDeleteTodo() throws Exception {		//����!
		
		planService.deleteTodo("10022");
	}
	
	
	
	
	
	/*
	 * //@Test public void testUpdateUserSlot() throws Exception { //����!
	 * 
	 * planService.updateUserSlot("testMember"); }
	 * 
	 * //@Test public void testFindUserId() throws Exception { //����!
	 * 
	 * String userId = planService.findUserId("testMember");
	 * 
	 * if( userId != null ) { System.out.println(userId + " ���� �����ϴ� ȸ���Դϴ� "); }else
	 * { System.out.println("testMember"+ " �� �������� �ʽ��ϴ�"); }
	 * 
	 * String userId2 = planService.findUserId("nonono");
	 * 
	 * if( userId2 != null ) { System.out.println(userId2 + " ���� �����ϴ� ȸ���Դϴ� ");
	 * }else { System.out.println("nonono"+ " �� �������� �ʽ��ϴ�"); } }
	 */
	
}