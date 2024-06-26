<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="constants.AttributeConst"%>


<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="commUpd" value="${ForwardConst.CMD_UPDATE.getValue()}" />
<c:set var="actMemo" value="${ForwardConst.ACT_MEMO.getValue()}" />

<c:set var="actMemo" value="${ForwardConst.ACT_MEMO.getValue()}" />
<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />

<c:set var="actTop" value="${ForwardConst.ACT_TOP.getValue()}" />
<c:set var="actTop2" value="${ForwardConst.ACT_TOP2.getValue()}" />
<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="actMemo" value="${ForwardConst.ACT_MEMO.getValue()}" />

<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />


<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>

    </div>
</c:if>
<fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd"
    var="reportDay" type="date" />
<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_DATE.getValue()}">日付</label>
<br />
<input type="date" name="${AttributeConst.REP_DATE.getValue()}"
    id="${AttributeConst.REP_DATE.getValue()}"
    value="<fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' />" />
<br />
<br />

<div class = "display_none">
<label>氏名</label>
<br />
<c:out value="${sessionScope.login_employee.name}" />
<br />
<br />

</div><!-- 画面上に表示しないためのdiv-->

<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_TITLE.getValue()}">タイトル</label>
<br />
<input type="text" name="${AttributeConst.REP_TITLE.getValue()}"
    id="${AttributeConst.REP_TITLE.getValue()}" value="${report.title}" />
<br />
<br />


<div class = "CONTENT">
<p class = "bluedainari">
>
</p>
事実と考えに分けて今日を振り返ろう
<label for="${AttributeConst.REP_CONTENT.getValue()}"></label>
<br />
<textarea name="${AttributeConst.REP_CONTENT.getValue()}"
    id="${AttributeConst.REP_CONTENT.getValue()}" rows="10" cols="50" placeholder="事実">${report.content}</textarea>
<br />
<br />
</div>

<div class = "CONTENT2">
<label for="${AttributeConst.REP_CONTENT2.getValue()}"></label>
<p class = "bluedainari">　</p>
<textarea name="${AttributeConst.REP_CONTENT2.getValue()}"
    id="${AttributeConst.REP_CONTENT2.getValue()}" rows="10" cols="50" placeholder="考え">${report.content2}</textarea>
<br />
<br />
</div>

<div class = "OE1">
<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_OE1_FLG.getValue()}" >実践できたOur Eight</label>
<br />
<select name="${AttributeConst.REP_OE1_FLG.getValue()}"
    id="${AttributeConst.REP_OE1_FLG.getValue()}">
    <option value="${AttributeConst.OE_1.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_1.getIntegerValue()}"> selected</c:if>>1.目的を考え行動する</option>
    <option value="${AttributeConst.OE_2.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_2.getIntegerValue()}"> selected</c:if>>2.正しいことを正しく行う</option>
    <option value="${AttributeConst.OE_3.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_3.getIntegerValue()}"> selected</c:if>>3.臆せず大胆に挑戦する</option>
    <option value="${AttributeConst.OE_4.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_4.getIntegerValue()}"> selected</c:if>>4.当事者意識を持つ</option>
    <option value="${AttributeConst.OE_5.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_5.getIntegerValue()}"> selected</c:if>>5.相手軸を意識する</option>
    <option value="${AttributeConst.OE_6.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_6.getIntegerValue()}"> selected</c:if>>6.礼節をもって接する</option>
    <option value="${AttributeConst.OE_7.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_7.getIntegerValue()}"> selected</c:if>>7.スピードと質に拘る</option>
    <option value="${AttributeConst.OE_8.getIntegerValue()}"
        <c:if test="${report.oeFlag1 == AttributeConst.OE_8.getIntegerValue()}"> selected</c:if>>8.プロとして学び続ける</option>
</select>
<br />
<br />
<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_CONTENT_OE1.getValue()}">実践できたと感じるOur Eightを振り返ろう</label>
<br />
<textarea name="${AttributeConst.REP_CONTENT_OE1.getValue()}"
    id="${AttributeConst.REP_CONTENT_OE1.getValue()}" rows="10" cols="50" placeholder="どういった場面で実践できた？
さらにできると良かったことは？">${report.contentOe1}</textarea>
<br />
<br />
</div>

<div class = "OE2">
<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_OE2_FLG.getValue()}">実践できなかったOur Eight</label>
<br />
<select name="${AttributeConst.REP_OE2_FLG.getValue()}"
    id="${AttributeConst.REP_OE2_FLG.getValue()}">
    <option value="${AttributeConst.OE_1.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_1.getIntegerValue()}"> selected</c:if>>1.目的を考え行動する</option>
    <option value="${AttributeConst.OE_2.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_2.getIntegerValue()}"> selected</c:if>>2.正しいことを正しく行う</option>
    <option value="${AttributeConst.OE_3.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_3.getIntegerValue()}"> selected</c:if>>3.臆せず大胆に挑戦する</option>
    <option value="${AttributeConst.OE_4.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_4.getIntegerValue()}"> selected</c:if>>4.当事者意識を持つ</option>
    <option value="${AttributeConst.OE_5.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_5.getIntegerValue()}"> selected</c:if>>5.相手軸を意識する</option>
    <option value="${AttributeConst.OE_6.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_6.getIntegerValue()}"> selected</c:if>>6.礼節をもって接する</option>
    <option value="${AttributeConst.OE_7.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_7.getIntegerValue()}"> selected</c:if>>7.スピードと質に拘る</option>
    <option value="${AttributeConst.OE_8.getIntegerValue()}"
        <c:if test="${report.oeFlag2 == AttributeConst.OE_8.getIntegerValue()}"> selected</c:if>>8.プロとして学び続ける</option>
</select>
<br />
<br />

<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_CONTENT_OE2.getValue()}">実践できなかったと感じるOur Eightを振り返ろう</label>
<br />
<textarea name="${AttributeConst.REP_CONTENT_OE2.getValue()}"
    id="${AttributeConst.REP_CONTENT_OE2.getValue()}" rows="10" cols="50" placeholder="どういった場面で実践できなかった？
どうして実践できなかった？">${report.contentOe1}</textarea>
<br />
<br />
</div>


<div class = "TOMORROWGOAL">
<p class = "bluedainari">
>
</p>
<label for="${AttributeConst.REP_TOMORROWGOAL.getValue()}">明日の目標</label>
<br />
<textarea name="${AttributeConst.REP_TOMORROWGOAL.getValue()}"
    id="${AttributeConst.REP_TOMORROWGOAL.getValue()}" rows="10" cols="50" placeholder="行動に移せる目標を具体的に書こう">${report.tomorrowGoal}</textarea>
<br />
<br />
</div>


<input type="hidden" name="${AttributeConst.REP_ID.getValue()}"
    value="${report.id}" />
<input type="hidden" name="${AttributeConst.TOKEN.getValue()}"
    value="${_token}" />
<button type="submit" id = "reportSubmitButton">投稿</button>