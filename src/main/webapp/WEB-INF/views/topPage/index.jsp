<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.ForwardConst" %>

<c:set var="actTop" value="${ForwardConst.ACT_TOP.getValue()}" />
<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />

<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h2>らくらく日報くんへようこそ</h2>
        <div class = "buttuncon">
            <p id ="topbutton"><a id ="topbuttonlink" href="<c:url value='?action=${actRep}&command=${commNew}' />">新規メモ</a></p>
            <p id ="topbutton"><a id ="topbuttonlink" href="<c:url value='?action=${actRep}&command=${commNew}' />">メモ管理</a></p>
            <p id ="topbutton"><a id ="topbuttonlink" href="<c:url value='?action=${actRep}&command=${commNew}' />">新規日報</a></p>
            <p id ="topbutton"><a id ="topbuttonlink" href="<c:url value='?action=${actRep}&command=${commNew}' />">日報管理</a></p>
        </div>
    </c:param>
</c:import>