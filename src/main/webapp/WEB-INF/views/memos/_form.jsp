<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.AttributeConst" %>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>

<div class = "display_none">
    <fmt:parseDate value="${memo.memoDate}" pattern="yyyy-MM-dd" var="memoDay" type="date" />
    <label for="${AttributeConst.MEMO_DATE.getValue()}">日付</label><br />
    <input type="date" name="${AttributeConst.REP_DATE.getValue()}" id="${AttributeConst.REP_DATE.getValue()}" value="<fmt:formatDate value='${memoDay}' pattern='yyyy-MM-dd' />" />
    <br /><br />

    <label>氏名</label><br />
    <c:out value="${sessionScope.login_employee.name}" />
    <br /><br />
</div><!-- 画面上に表示しないためのdiv-->


<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.MEMO_TITLE.getValue()}">タイトル</label><br />
<input type="text" name="${AttributeConst.MEMO_TITLE.getValue()}" id="${AttributeConst.MEMO_TITLE.getValue()}" value="${memo.title}" />
<br /><br />

<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.MEMO_EMOTION_FLG.getValue()}">感情のタグ</label><br />
<select name="${AttributeConst.MEMO_EMOTION_FLG.getValue()}" id="${AttributeConst.MEMO_EMOTION_FLG.getValue()}">
    <option value="${AttributeConst.FEEL_JOY.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_JOY.getIntegerValue()}"> selected</c:if>>喜び</option>
    <option value="${AttributeConst.FEEL_ANTICIPATION.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_ANTICIPATION.getIntegerValue()}"> selected</c:if>>期待</option>
    <option value="${AttributeConst.FEEL_ANGER.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_ANGER.getIntegerValue()}"> selected</c:if>>怒り</option>
    <option value="${AttributeConst.FEEL_DISGUST.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_DISGUST.getIntegerValue()}"> selected</c:if>>嫌悪</option>
    <option value="${AttributeConst.FEEL_SADNESS.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_SADNESS.getIntegerValue()}"> selected</c:if>>悲しみ</option>
    <option value="${AttributeConst.FEEL_SURPRISE.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_SURPRISE.getIntegerValue()}"> selected</c:if>>驚き</option>
    <option value="${AttributeConst.FEEL_FEAR.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_FEAR.getIntegerValue()}"> selected</c:if>>恐れ</option>
    <option value="${AttributeConst.FEEL_TRUST.getIntegerValue()}"<c:if test="${memo.emotionFlag == AttributeConst.FEEL_TRUST.getIntegerValue()}"> selected</c:if>>信頼</option>
</select>
<br /><br />



<div class = "CONTENT">
<p class = "bluedainari">
>
</p>
事実と考えに分けてメモを残そう
<label for="${AttributeConst.MEMO_CONTENT.getValue()}"></label>
<br />
<textarea name="${AttributeConst.MEMO_CONTENT.getValue()}"
    id="${AttributeConst.MEMO_CONTENT.getValue()}" rows="10"  placeholder="事実">${memo.content}</textarea>
<br />
<br />
</div>

<div class = "CONTENT2">
<label for="${AttributeConst.MEMO_CONTENT2.getValue()}"></label>
<p class = "bluedainari">　</p>
<textarea name="${AttributeConst.MEMO_CONTENT2.getValue()}"
    id="${AttributeConst.MEMO_CONTENT2.getValue()}" rows="10" placeholder="考え">${memo.content2}</textarea>
<br />
<br />
</div>


<div class = "flexend">
</div>


<input type="hidden" name="${AttributeConst.MEMO_ID.getValue()}" value="${memo.id}" />
<input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />

<button type="submit" id = "memoSubmitButton">投稿</button><br />