package com.ksy.service.domain;

import java.sql.Timestamp;

public class Point {
	
	public Point() {
		
	}
	
	//point TABLE
	private String pointId; //point_id
	private String userId; //user_id
	private String refId; //ref_id
	private String usedType; //used_type  �⼮üũ(C) , ���Ա���(S) , �װ���,���� ����(B) , ����Ʈ���(U)
	private int usedPoint; //used_point
	private Timestamp usedDate; //used_date
	
	
	private String usedData;
	private String usedContent;
	
	
	public String getPointId() {
		return pointId;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRefId() {
		return refId;
	}
	public void setRefId(String refId) {
		this.refId = refId;
	}
	public String getUsedType() {
		return usedType;
	}
	public void setUsedType(String usedType) {
		this.usedType = usedType;
		
		if(usedType !=null&&usedType.length()!=0) {
			
			switch(usedType) {
				case "C":
					usedData = "����";
					usedContent = "�⼮üũ";
					break;
				case "F":
					usedData = "����";
					usedContent = "�װ��Ǳ���";
					break;
				case "R":
					usedData = "����";
					usedContent = "���ұ���";
					break;
				case "S":
					usedData = "����";
					usedContent = "���Ա���";
					break;
				case "U":
					usedData = "����";
					usedContent = "����Ʈ���";
					break;
			
			}
			// �⼮üũ(C) , ���Ա���(S) , �װ��Ǳ���(F),���ұ���(R) , ����Ʈ���(U)
			
			
			
			
			
			
		}
		
		
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public Timestamp getUsedDate() {
		return usedDate;
	}
	public void setUsedDate(Timestamp usedDate) {
		this.usedDate = usedDate;
	}
	
	
	
	
	public String getUsedData() {
		return usedData;
	}
	public void setUsedData(String usedData) {
		this.usedData = usedData;
	}
	public String getUsedContent() {
		return usedContent;
	}
	public void setUsedContent(String usedContent) {
		this.usedContent = usedContent;
	}
	@Override
	public String toString() {
		return "Point [pointId=" + pointId + ", userId=" + userId + ", refId=" + refId + ", usedType=" + usedType
				+ ", usedPoint=" + usedPoint + ", usedDate=" + usedDate + "]";
	}
	
	
 
	
	
	
	
	
	

}
