<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="hx" uri="/WEB-INF/tld/hx.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title>失信联合惩戒</title>
    <link rel="stylesheet" href="/css/pub.css">
</head>
<body class="enterprise-info-bg">
<!-- 头部 -->
<jsp:include page="../../common/enterprise.jsp"></jsp:include>
<jsp:include page="../../common/basicheader.jsp"></jsp:include>

<div class="mod detail-main">
 <input type="hidden" name="encryPriPID" id="encryPriPID" value="${entBasicInfo.encryPriPID }"/>
    <div class="tab-panel">

        <!-- 行政许可信息 -->
        <div class="mod-bd-panel_company">
            <h3 class="i-title"> <i></i>失信联合惩戒信息 </h3>
            <table class="table-common table-xuke mb20">
                <thead>
                <tr>
                    <th class="col-first"> 序号 </th>
                    <th class="col-second">惩戒事由</th>
                    <th class="col-three">法律文书编号</th>
                    <th class="col-four">惩戒执行期限</th>
                    <th class="col-five">发布机关</th>
                    <th class="col-nine">状态</th>
                    <th class="col-nine">详情</th>
                </tr>
                </thead>
                <tbody id="_listData">

                </tbody>
            </table>
            <div class="notice-pagination-box clearfix">
                <span class="page-total">共查询到 <em id="_total"></em> 条信息，共 <em id="_pageNum"></em> 页</span>
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
   </div>
</div>

<form id="_params">
    <input type="hidden" name="priPID" id="priPID" value="${entBasicInfo.priPID}"/>
</form>

<%-- table 列表--%>
<script id="table-template" type="text/x-handlebars-template">
    {{#each data}}
    		<tr>
        		<td>{{num @index}}</td>
        		<td>{{punCause}}</td>
        		<td>{{legNo}}</td>
        		<td>{{exeDateStr}}</td>
        		<td>{{punReqDept}}</td>
        		<td>{{state state}}</td>
        		<td><a href='javascript:void(0)' class='details' priPID={{priPID}} batchNo={{batchNo}}>查看</a></td>
    		</tr>
    {{/each}}
</script>
<script>
    //参数的传递
    window._CONFIG = {
    		entTypeCatg:'${entBasicInfo.entTypeCatg}'
    }
</script>



<jsp:include page="../../common/footer.jsp"></jsp:include>
<script src="../../../../js/lib/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
    var jiathis_config = {
        url:'http://118.178.31.19/client/entsearch/toEntSearch?entName='+'${hx:encodeYear(entBasicInfo.entName)}',
        title:"国家企业信用信息公示系统",
        summary:'',
        desc:'',
        data_track_clickback:false
    };
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<script type="text/javascript" src="http://v3.jiathis.com/code/plugin.client.js" charset="utf-8"></script>

<script src="<c:url value="/js/lib/require.js"/>"></script>
<script src="<c:url value="/js/config.js"/>"></script>

<script src="<c:url value="/js/pub/entinfo/nocreditpunish.js"/>"></script>
<script src="<c:url value='/js/pub/entinfo/sendPdf.js'/>"></script>

<script src="/js/pub/entinfo/information_share.js"></script>
<script type="text/javascript" src="http://fwtj.gsxt.gov.cn/js/logcollector.js?nodenum=330000"></script>
<script>
    window.onload = function () {
        var sessionId = '<%=request.getSession().getId()%>';
        sessionId_gsxt = sessionId; // 正常情况JS可以拿到sessionId,但经过测试发现有些web服务器，js拿不到sessionId，这种情况需要手动对sessionId进行赋值，如sessionId_gsxt=${sessionId}
        t1Collect_gsxt(); // 收集访问信息，每个页面都需要调用该方法
        var entName = '${entBasicInfo.entName }';
        t2Collect_gsxt(entName); // 企业详情页收集被访问的企业名称，当用户进入企业详情页时，调用该方法，并将企业完整名称作为该方法的入参
    }
</script>

</body>
</html>

