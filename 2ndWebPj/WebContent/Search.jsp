<%@page import="java.util.ArrayList"%>
<%@page import="bean.BbsDAO"%>
<%@page import="bean.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String district = request.getParameter("district");
	String rstName = request.getParameter("rstName");
%>

<%
	BbsDTO dto = new BbsDTO();
	BbsDAO dao = new BbsDAO();
	dto.setDistrict(district);
	ArrayList<BbsDTO> list = dao.selectRst(dto.getDistrict());
%>
<%
	for (int i=0; i < list.size() ;i++){
%>
	<option value="<%=list.get(i).getRstName()%>"><%=list.get(i).getRstName()%></option>
<%		
	}
%>