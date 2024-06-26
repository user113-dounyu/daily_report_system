<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="constants.ForwardConst" %>

<c:set var="actComent" value="${ForwardConst.ACT_COMENT.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commEdt" value="${ForwardConst.CMD_EDIT.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>コメント 詳細ページ</h2>

        <table>
            <tbody>
                <tr>
                    <th>氏名</th>
                    <td><c:out value="${coment.employee.name}" /></td>
                </tr>
                <tr>
                    <th>日付</th>
                    <fmt:parseDate value="${coment.comentDate}" pattern="yyyy-MM-dd" var="comentDay" type="date" />
                    <td><fmt:formatDate value='${comentDay}' pattern='yyyy-MM-dd' /></td>
                </tr>
                <tr>
                    <th>内容（事実）</th>
                    <td><pre><c:out value="${coment.content}" /></pre></td>
                </tr>

                <tr>
                    <th>登録日時</th>
                    <fmt:parseDate value="${coment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createDay" type="date" />
                    <td><fmt:formatDate value="${createDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <fmt:parseDate value="${coment.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="updateDay" type="date" />
                    <td><fmt:formatDate value="${updateDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </tbody>
        </table>

        <c:if test="${sessionScope.login_employee.id == coment.employee.id}">
            <p>
                <a href="<c:url value='?action=${actComent}&command=${commEdt}&id=${coment.id}' />">このメモを編集する</a>
            </p>
        </c:if>

        <p>
            <a href="<c:url value='?action=${actComent}&command=${commIdx}' />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>