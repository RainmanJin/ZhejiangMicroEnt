<%--
   Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved.
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8"/>
    <title>专项检查库查询</title>
    <link rel="stylesheet" href="/css/vendor/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/css/reg.server.css">
    <link rel="stylesheet" href="/js/lib/jquerymultiselect/jquery.multiselect.css">
</head>
<style type="text/css">
    .commit {
        text-decoration: none;
        color: #003399;
        cursor: pointer;
        font-size: 13px;
    }
</style>
<body class="pd10">
<div class="tabbale" data-component="tab">
	<input type="hidden" id="dutyDeptCode" value="${dutyDeptCode }"/>
    <form id="taskForm" class="form-box">
        <div class="form-list">
            <div class="form-item clearfix">
                 <div class="col-4">
                    <label class="item-name col-5">主体类别：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <label><input type="radio" name="subjectType" checked="checked" value="1">企业</label>
                            <label><input type="radio" name="subjectType" value="2">机关</label>
                            <label><input type="radio" name="subjectType" value="3">社团</label>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">企业名称：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" class="ipt-txt" name="entName" value="" placeholder="可输入关键字查询">
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">统一信用代码/注册号：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" class="ipt-txt" id="regNO" name="regNO" placeholder="可输入后四位查询"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-item clearfix">
                <div class="col-4">
                    <label class="item-name col-5">专项库：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
	                         <select name="specialCode">
                                <c:if test="${!empty codeSpecialTypeList }">
			                    	<option value="">请选择</option>
			                    	<c:forEach items="${codeSpecialTypeList}" var="codeSpecialType">
			                          <option value="${codeSpecialType.specialCode}">${codeSpecialType.specialName}</option>
			                    	</c:forEach>
		                    	</c:if>
		                    	<c:if test="${empty codeSpecialTypeList }">
		                    		<option value="">暂无专项库数据，请联系管理员</option>
		                    	</c:if>
                             </select>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">登记机关：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="hidden" class="ipt-txt" name="regOrg" id="regOrg" value=""/>
                            <input type="text" class="ipt-txt" id="regOrgName" value="" readonly="readonly" placeholder="请选择登记机关"/>
	                            <span class="add-icon" id="choseorgReg">
	                                <i></i>
	                         </span>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">检查部门：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="hidden" id="checkDeptCode" name="checkDeptCode" value="${drandomSpecialEnt.checkDeptCode}"/>
	                        <input type="text" id="checkDeptName" value="${drandomSpecialEnt.checkDeptName}" class="ipt-txt isShow" placeholder="无则输入" required="required"/>
	                        <span class="add-icon" id="checkDeptNameAdd">
	                          <i></i>
	                        </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-item clearfix">
            	<div class="col-4">
                    <label class="item-name col-5">监管标签：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                           <select name="markCode">
                                <c:if test="${!empty codeMarkTypeList }">
			                    	<option value="">请选择</option>
			                    	<c:forEach items="${codeMarkTypeList}" var="codeMarkType">
			                          <option value="${codeMarkType.markCode}">${codeMarkType.markName}</option>
			                    	</c:forEach>
		                    	</c:if>
		                    	<c:if test="${empty codeMarkTypeList }">
		                    		<option value="">暂无监管标签，请联系管理员</option>
		                    	</c:if>
                             </select>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">许可证：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" id="qzName" name="licName"  class="fl ipt-txt" placeholder="可手动输入查询">
<!--                             <input type="hidden" id="qzCode" value="" class="hidden_input"> -->
<!-- 	                        <span class="add-icon" id="qzcodetree"> -->
<!-- 	                          <i></i> -->
<!-- 	                        </span> -->
                        </div>
                    </div>
                </div>  
                 <div class="col-4">
                    <label class="item-name col-5">许可证编号：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" class="ipt-txt" name="licNO" value="" placeholder="请输入许可证编号"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-item clearfix moresearch_oth" style="display:none">
                <div class="col-4">
                    <label class="item-name col-5">许可有效期至：</label>
                    <div class="col-7">
                        <div class="ipt-box col-575">
                            <input type="text" class="ipt-txt pointer laydate-icon" onclick="laydate()"
                                   readonly="readonly" name="licSaveEndDateStart" value=""/>
                        </div>
                        <span class="item-line col-05">-</span>
                        <div class="ipt-box col-575">
                            <input type="text" class="ipt-txt pointer laydate-icon" onclick="laydate()"
                                   readonly="readonly" name="licSaveEndDateEnd" value=""/>
                        </div>
                    </div>
                </div> 
				<div class="col-4">
                    <label class="item-name col-5">设置日期：</label>
                    <div class="col-7">
                        <div class="ipt-box col-575">
                            <input type="text" class="ipt-txt pointer laydate-icon" onclick="laydate()"
                                   readonly="readonly" name="creatTimeStart" value=""/>
                        </div>
                        <span class="item-line col-05">-</span>
                        <div class="ipt-box col-575">
                            <input type="text" class="ipt-txt pointer laydate-icon" onclick="laydate()"
                                   readonly="readonly" name="creatTimeEnd" value=""/>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">许可发证机关：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" class="ipt-txt" name="licSendDeptName" value="" placeholder="请输入许可发证机关"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-item clearfix moresearch_oth" style="display:none">
                <div class="col-4">
                    <label class="item-name col-5">主体状态：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <select name="isVlid">
                                <option value=""></option>
                                <option value="1" selected="selected">有效</option>
                                <option value="0">无效</option>
                             </select>
                        </div>
                    </div>
                </div>
				<div class="col-4">
                    <label class="item-name col-5">登记状态：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="hidden" name="regState" id="regState">
                            <select name="regStateM" id="regStateM" multiple="multiple">
                                <c:forEach var="regState" items="${regStateEnumMap}">
                                	<option value='${regState.value.code}' title='${regState.value}' ${regState.value == 'CUNXU' ? 'selected':''}>${regState.value.name}</option>
                            	</c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <label class="item-name col-5">设置人：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="text" class="ipt-txt" name="setUserName" value="" placeholder="请输入设置人"/>
                        </div>
                    </div>
                </div>
            </div>
        	<div class="form-item clearfix moresearch_oth" style="display:none">
                <div class="col-4">
                    <label class="item-name col-5">管辖单位：</label>
                    <div class="col-7">
                        <div class="ipt-box col-11">
                            <input type="hidden" class="ipt-txt" name="localAdm" id="localAdm" value=""/>
                            <input type="text" class="ipt-txt" id="localAdmName" value="" readonly="readonly" placeholder="请选择管辖单位"/>
	                            <span class="add-icon" id="choseregUnit">
	                                <i></i>
	                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="form-group clearfix">
            <div class="center mt10">
                <input type="button" id="search" value="查询" class="btn mr20">
                <input type="button" id="cancel" onclick="$('#taskForm')[0].reset();" value="重置" class="btn mr20">
                <input type="button" value="更多查询条件" status='0' id="moresearch" class="btn mr20">
            </div>
        </div>
    </form>
</div>
 
 
 <div class="mod-border investment-info js-content-show js-upload mt10" id="loadFile" style="display:none;">
    <div class="forguarantee-lead">
        <h6 class="download" style="text-align: left;">
            <a  href="<c:url value="/syn/server/sccheck/specialent/exceldownload"/>"><b class="download-ico"></b>下载本站EXCEL模版</a>
        </h6>
        <div class="state pos-rel">
            <span>说明：</span>
            <p>1、导入数据时请先下载EXCEL导入模版；</p>
            <p>2、下载导入模板后请按照导入模板格式和内容要求完成导入信息的填录；</p>
            <p>3、使用非本系统提供的导入模板或擅自修改导入模板的格式和内容会导致操作不成功。</p>
        </div>
        <div class="lead-file">
            <label>导入EXCEL文件</label>
            <form id="file_import" enctype="multipart/form-data" method="post">
                <div class="ipt-box">
                    <input type="file" id="js-file" name="file"  class="ipt-txt ipt-txt-lg">
                    
                </div>
                <input type="button" class="btn mt10 js-import" value="导入">
            </form>


        </div>
    </div>
    <div style="text-align: center;"><input type="button" class="btn btnCancel"  value="关闭"></div>
</div>
 
 

<div class="iframe-wrap">
    <button type="button" id="addBtn" class="btn btn-primary mt5">添加专项检查主体</button>
    <button type="button" id="importExcel" class="btn btn-primary mt5">导入专项检查主体名单</button>
    
	    &nbsp;&nbsp;&nbsp;查询结果:企业&nbsp;<span id="entCount" style="color: blue">0</span>&nbsp;户，
	    &nbsp;监管标签&nbsp;<span id="markCount" style="color: blue">0</span>&nbsp;类，
	    &nbsp;许可证&nbsp;<span id="licCount" style="color: blue">0</span>&nbsp;个
	           
<!--     <div class="light-info mb5 mt5"> -->
<!--         <span class="light">提示：已入库企业被设置为失效时，该企业对应本库的监管标签自动清除。同一家企业有多个对应本库的监管标签或有多个不同编号的同一类许可证时，请按照对应每个监管标签或每个许可证编号的信息分别入库该企业。</span> -->
<!--     </div> -->
    <table id="user-table" border="0" cellspacing="0" cellpadding="0" class="table-row display nowrap">
        <thead>
        <tr>
            <th>序号</th>
            <th>操作</th>
            <th>专项库类别</th>
            <th>分类监管标签</th>
            <th>名单状态</th>
            <th>统一社会信用代码/注册号</th>
            <th>主体名称</th>
            <th>检查部门</th>
            <th>主体类别</th>
            <th>许可证名称</th>
            <th>许可证编号</th>
            <th>许可批准日期</th>
            <th>有效期至</th>
            <th>许可发证机关</th>
            <th>住所</th>
            <th>登记机关</th>
            <th>管辖单位</th>
            <th>登记状态</th>
            <th>入库日期</th>
            <th>设置人</th>
        </tr>
        </thead>
    </table>
</div>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
<script src="/js/syn/system/sccheck/specialent/specialent_list.js"></script>
</body>
</html>
