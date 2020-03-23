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
import com.ksy.service.domain.Plan;
import com.ksy.service.domain.Stuff;
import com.ksy.service.domain.Todo;
import com.ksy.service.domain.User;
import com.ksy.service.plan.PlanService;
import com.ksy.service.planSub.PlanSubService;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })

public class PlanControllerTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("planServiceImpl")
	private PlanService planService;
	
	/* Plan Controller �׽�Ʈ�� ���̾ */
	@Autowired
	@Qualifier("planSubServiceImpl")
	private PlanSubService planSubService;

	
	
	//******** 		Controller �׽�Ʈ		  ********//
	@Test
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
		//List<Daily> dailyList = planSubService.getDailyList(planId);		//dailyList
		List<Stuff> stuffList = planSubService.getStuffList(planId);		//stuffList
		List<Memo> memoList = planSubService.getMemoList(planId);			//memoList
		plan.setTodoList(todoList);
		//plan.setDailyList(dailyList);
		plan.setStuffList(stuffList);
		plan.setMemoList(memoList);
		
		List<City> listCity = planSubService.getCityRouteList(planId);	
		/* */plan.setCityList(listCity);
		//model.addAttribute("listCity", listCity);	//Plan �ʵ忡 CityList ��� �𵨿� �ɾ���... :: ���� ����?
		
		//���� ����� ���� ����Ʈ : model�� �ɾ �����ֱ�
		//List<Daily> budgetOverviewList = planSubService.getBudgetOverview(planId);
		/* *///plan.setBudgetOverviewList(budgetOverviewList);
		//model.addAttribute("budgetOverviewList", budgetOverviewList);
		
		//List<Day> dayList = Util.cityListToDayList(listCity);
		//plan.setDayList(dayList);
		
		plan.setPlanDday( Util.getDday(plan.getStartDate()));		//���� D-Day
		plan.setEndDate( Util.getEndDate(plan.getStartDate(), plan.getPlanTotalDays()) );	//������������
		
		
		
		model.addAttribute("plan", plan);
		
		System.out.println("\n\n- - - - - - - - - - - - plan - - - - - - - - - - \n");
		System.out.println(plan);
		
		//String returnString = "forward:/plan/getPlan.jsp";
	}
	
	
	
	//@Test
	public void testTest() throws Exception {
		
		
	
		
		
	}
	
}
