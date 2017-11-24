<%--
   Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved.
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="/css/vendor/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/css/syn.css">
</head>
<body>
 
<form id="sysUserForm">
    <div class="pd20 clearfix">
        <h3 class="h3-title center"></h3>
		<input type="hidden" id="uid" name="uid" value="${codeRightType.uid}">
		<input type="hidden" id="dutyDeptName" name="dutyDeptName" value="${codeRightType.dutyDeptName}">
		<input type="hidden" id="rightCode" name="rightCode" value="${codeRightType.rightCode}">
		<input type="hidden" id="setUserUid" name="setUserUid" value="${codeRightType.setUserUid}">
		<input type="hidden" id="setDeptCode" name="setDeptCode" value="${codeRightType.setDeptCode}">
          <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table-horizontal mt10 f12"> 
             <tr>
                <td class="bg-gray right" width="30%"><span class="light">*</span>专业资格资质名称：</td>
                <td width="70%">
                    <div class="ipt-box pd0">
                        <input type="text" id="rightName" name="rightName" value="${codeRightType.rightName}" class="ipt-txt isShow" required="required"/>
                    </div>
                </td>
            </tr>
             <tr>
                <td class="bg-gray right">说明：</td>
                <td>
                    <div class="ipt-box pd0">
                        <input type="text" id="remark" name="remark"  value="${codeRightType.remark}" class="ipt-txt isShow" />
                    </div>
                </td>
            </tr>
            <tr>
               <td class="bg-gray right"><span class="light">*</span>状态：</td>
               <td>
                   <div style="font-size: 13px">
                        <label><input type="radio" id="isScVlid" name="isVlid" <c:if test="${codeRightType.isVlid == '1' || empty codeRightType.isVlid}"> checked="checked"</c:if> value="1" class="ipt-txt"/>有效&nbsp;</label>
                        <label><input type="radio" id="noScVlid" name="isVlid" <c:if test="${codeRightType.isVlid == '0'}"> checked="checked"</c:if> value="0" class="ipt-txt" />失效&nbsp;</label>
                    </div>
               </td>
            </tr>
            <tr>
               <td class="bg-gray right"><span class="light">*</span>适用部门：</td>
               <td>
                   <div class="ipt-box pd0">
                        <select id="dutyDeptCode" name="dutyDeptCode" required="required">
                        	<option value="">请选择</option>
                        	<c:forEach items="${codeDutydeptList}" var="codeDutydept">
	                        	<option value="${codeDutydept.deptCode}" <c:if test="${codeRightType.dutyDeptCode == codeDutydept.deptCode}">selected="selected"</c:if>>${codeDutydept.deptName}</option>
	                    	</c:forEach>
                        </select>
                    </div>
               </td>
            </tr>
             <tr>
                <td class="bg-gray right">创建日期：</td>
                <td>
                    <div class="ipt-box pd0">
                        <input type="text" id="creatTime" name="creatTime"  value="<fmt:formatDate value="${codeRightType.creatTime}" pattern="yyyy-MM-dd" />" class="ipt-txt isShow" readonly="readonly"/>
                    </div>
                </td>
            </tr>
             <tr>
                <td class="bg-gray right">设置人：</td>
                <td>
                    <div class="ipt-box pd0">
                        <input type="text" id="setUserName" name="setUserName"  value="${codeRightType.setUserName}" class="ipt-txt isShow" readonly="readonly"/>
                    </div>
                </td>
            </tr>
        </table>
         <p class="center mt10">
         	<c:if test="${viewFlag != '2'}">
	        <input type="submit" id="save" class="btn mr20" value="保 存"/>
	        </c:if>
	        <button id="cancel" type="button" class="btn">关闭</button>
	     </p>
    </div>
</form>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
<script src="/js/syn/system/sccheck/righttype/righttype_edit.js"></script>
</body>
</html>