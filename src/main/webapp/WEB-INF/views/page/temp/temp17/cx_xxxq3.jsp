<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title>企业高级查询详情页</title>
    <link rel="stylesheet" href="/css/pub-syn.css">
</head>
<body class="outer-bg">
<div class="header mod">
    <img src="/img/pub-syn/top-img.png" alt="">
    <div class="header-tips">
        <div class="fl">
            <span><i class="icon icon1"></i>2016年12月20日</span>
            <span><i class="icon icon2"></i>您好！北京市环保局 李军</span>
        </div>
        <div class="fr">
            <a href=""><i class="icon icon3"></i>修改密码</a>
            <a href=""><i class="icon icon4"></i>用户退出</a>
        </div>
    </div>
</div>
<div class="mod clearfix">
    <div class="sidebar">
        <ul class="navbar">
            <li><a href="javascript:void(0)" class="info selected">信息提供</a>
                <ul class="subnavbar">
                    <li><a href="javascript:void(0)" class="selected">在线录入</a></li>
                    <li><a href="javascript:void(0)">批量导入</a></li>
                    <li><a href="javascript:void(0)">数据接口</a></li>
                    <li><a href="javascript:void(0)">数据交换</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0)" class="info">信息接收</a>
                <ul class="subnavbar">
                    <li><a href="javascript:void(0)">双告知</a></li>
                    <li><a href="javascript:void(0)">严重违法失信<br/>企业名单</a></li>
                    <li><a href="javascript:void(0)">经营异常名录</a></li>
                    <li><a href="javascript:void(0)">联合惩戒信息</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0)" class="info">信息管理</a>
                <ul class="subnavbar">
                    <li><a href="javascript:void(0)">本部门问题数据处理</a></li>
                    <li><a href="javascript:void(0)">本部门归集或接收<br/>信息的查询统计</a></li>
                    <li><a href="javascript:void(0)">数据应用反馈</a></li>
                    <li><a href="javascript:void(0)">批量比对</a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0)" class="info">信息查询</a>
                <ul class="subnavbar">
                    <li><a href="javascript:void(0)">企业高级查询</a></li>
                    <li><a href="javascript:void(0)">查询接口</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="main">
    <input type="hidden" name="encryPriPID" id="encryPriPID" value="${entBasicInfo.encryPriPID }"/>
    <form id="params">
        <input type="hidden" name="priPID" id="priPID" value="${entBasicInfo.priPID }"/>

    </form>
    <form id="mort_params">
        <input type="hidden" name="regNO" id="regNO" value="${entBasicInfo.regNO}"/>
        <input type="hidden" name="uniCode" id="uniCode" value="${entBasicInfo.UNICODE}"/>
    </form>
    <input type="hidden" name="entTypeCatg" id="entTypeCatg" value="${entBasicInfo.entTypeCatg }"/>
        <div class="crumbs">
            <a href="javascript:void(0)">首页</a> &gt;
            <a href="javascript:void(0)">信息查询</a> &gt;
            <a href="javascript:void(0)" class="cur">企业高级查询</a>
        </div>
        <hr>
        <div class="clearfix">
            <div class="company-basic clearfix">
                <div class="caption">
                    <div class="title clearfix">
                        <span class="fl mr5">${entBasicInfo.entName }</span>
                        <span class="icon-rectangle icon-blue fl">
                        <c:if test="${entBasicInfo.regState=='K'||entBasicInfo.regState=='A'||entBasicInfo.regState=='B'}">
                                存续
                            </c:if>
				            <c:if test="${entBasicInfo.regState=='DA'}">
                                吊销未注销
                            </c:if>
				            <c:if test="${entBasicInfo.regState=='D'}">
                                吊销
                            </c:if>
                        </span>
                    </div>
                    <p>
                        <i class="book2-icon"></i>统一社会信用代码/注册号：
                        <span><c:choose>
                                <c:when test="${!empty entBasicInfo.UNICODE}">
                                    ${entBasicInfo.UNICODE }
                                </c:when>
                                <c:otherwise>
                                    ${entBasicInfo.regNO }
                                </c:otherwise>
                        </c:choose></span>
                    </p>
                    <p>
                        <i class="person2-icon"></i>法定代表人/经营者：
                        <span>${entBasicInfo.leRep }</span>
                    </p>
                    <p>
                        <i class="local-icon"></i>登记机关：<span>${entBasicInfo.regOrgName }</span>
                    </p>
                    <p>
                        <i class="date-icon"></i>成立日期：<span>${entBasicInfo.estDateStr }</span>
                    </p>
                </div>
            </div>
            <div class="tab-header tab-detail">
                <ul class="clearfix">
                	<li><a class="tab-item" href="../../depsyn/search/baseinfo?encryPriPID=279913F3FBF463ABF21A4B194A00E128CB53B966BB008522E33737F44C63B4E7&classFlag=1">基本信息</a>
                    </li>
                    <li><a class="tab-item" href="../../entinfo/licenseinfo?encryPriPID=279913F3FBF463ABF21A4B194A00E128CB53B966BB008522E33737F44C63B4E7&amp;classFlag=1">企业年报信息</a>
                    </li>
                    <li><a class="tab-item" href="../../depsyn/search/jsinfo?encryPriPID=279913F3FBF463ABF21A4B194A00E128CB53B966BB008522E33737F44C63B4E7&classFlag=1">企业即时信息</a>
                    </li>
                    <li class="tab-selected"><a class="tab-item" href="../../depsyn/search/cfinfo?encryPriPID=279913F3FBF463ABF21A4B194A00E128CB53B966BB008522E33737F44C63B4E7&classFlag=1">处罚信息</a>
                    </li>
                    <li><a class="tab-item" href="../../depsyn/search/qtinfo?encryPriPID=279913F3FBF463ABF21A4B194A00E128CB53B966BB008522E33737F44C63B4E7&classFlag=1">其他信息</a>
                    </li>

                </ul>
            </div>
            <div class="mod-bd-panel_company no-borderlr">
                <h3 class="i-title">
                    <i></i>行政处罚信息
                </h3>
                <table class="table-common mb20">
                    <thead>
                    <tr>
                        <th width="52">序号</th>
                        <th>行政处罚决定文书</th>
                        <th width="100">违法行为类型</th>
                        <th width="150">行政处罚内容</th>
                        <th width="100">做出行政处罚决定机关名称</th>
                        <th width="100">做出行政处罚决定日期</th>
                        <th width="100">公示日期</th>
                        <th width="100">详情</th>
                    </tr>
                    </thead>
                     <tbody id="case">
                    </tbody>
                </table>
                <div class="notice-pagination-box clearfix">
        <span class="page-total">共查询到 <em id="caseCount">0</em> 条信息，共 <em id="casePageCount">0</em> 页</span>
        <div id="pagecase" class="pagination">
        <a href="javascript:void(0)" class="prev disabled">首页</a><a
        href="javascript:void(0)" class="prev"><i class="icon-triangle-left"></i>上一页</a><a
        href="javascript:void(0)">1</a><a href="javascript:void(0)" class="next">下一页<i
        class="icon-triangle-right"></i></a><a href="javascript:void(0)"
        class="prev disabled">末页</a>
        </div>
        </div>
        <script id="case-template" type="text/x-handlebars-template">
        {{#each data}}
        <tr>
        <td> {{addOne @index}}</td>
        <td>{{penDecNo}}</td>
        <td>{{illegActType}}</td>
        <td>{{penContent}}</td>
        <td>{{judAuth}}</td>
        <td>{{transDate penDecIssDate}}</td>
        <td>{{dataFormat publicDate}}</td>
		</tr>
        {{/each}}
        </script>
            </div>
            <div class="mod-bd-panel_company no-borderlr">
                <h3 class="i-title">
                    <i></i>经营异常信息
                </h3>
                <table class="table-common mb20">
                    <thead>
                    <tr>
                        <th width="52">序号</th>
                        <th width="150">列入经营异常名录原因</th>
                        <th width="150">列入日期</th>
                        <th width="150">做出决定机关(列入)</th>
                        <th width="100">移出经营异常名录原因</th>
                        <th>移出日期</th>
                        <th>做出决定机关(移出)</th>
                    </tr>
                    </thead>
                     <tbody id="abnormal">
                    </tbody>
                </table>
                <div class="notice-pagination-box clearfix">
        <span class="page-total">共查询到 <em id="abnormalCount">0</em> 条信息，共 <em id="abnormalPageCount">0</em> 页</span>
        <div id="pageabnormal" class="pagination">
        <a href="javascript:void(0)" class="prev disabled">首页</a><a
        href="javascript:void(0)" class="prev"><i class="icon-triangle-left"></i>上一页</a><a
        href="javascript:void(0)">1</a><a href="javascript:void(0)" class="next">下一页<i
        class="icon-triangle-right"></i></a><a href="javascript:void(0)"
        class="prev disabled">末页</a>
        </div>
        </div>
        <script id="abnormal-template" type="text/x-handlebars-template">
        {{#each data}}
        <tr>
        <td>{{addOne @index}}</td>
        <td>{{speCauseCN}}</td>
        <td>{{abnTime}}</td>
        <td>{{decorgCN}}</td>
        <td>{{remExcpresCN}}</td>
        <td>{{remDate}}</td>
        <td>{{reDecOrgCN}}</td>
		</tr>
        {{/each}}
        </script>
            </div>
            <div class="mod-bd-panel_company no-borderlr">
                <h3 class="i-title">
                    <i></i>严重违法信息
                </h3>
                <table class="table-common mb20">
                    <thead>
                    <tr>
                        <th width="52">序号</th>
                        <th width="150">列入严重违法企业名单原因</th>
                        <th width="100">列入日期</th>
                        <th width="100">做出决定机关(列入)</th>
                        <th>移出严重违法企业名单原因</th>
                        <th width="100">移出日期</th>
                        <th width="100">做出决定机关(移出)</th>
                    </tr>
                    </thead>
                    <tbody id="illegal">
                    </tbody>
                </table>
                <div class="notice-pagination-box clearfix">
        <span class="page-total">共查询到 <em id="illegalCount">0</em> 条信息，共 <em id="illegalPageCount">0</em> 页</span>
        <div id="pageillegal" class="pagination">
        <a href="javascript:void(0)" class="prev disabled">首页</a><a
        href="javascript:void(0)" class="prev"><i class="icon-triangle-left"></i>上一页</a><a
        href="javascript:void(0)">1</a><a href="javascript:void(0)" class="next">下一页<i
        class="icon-triangle-right"></i></a><a href="javascript:void(0)"
        class="prev disabled">末页</a>
        </div>
        </div>
        <script id="illegal-template" type="text/x-handlebars-template">
        {{#each data}}
        <tr>
        <td>{{addOne @index}}</td>
        <td>{{speCauseCN}}</td>
        <td>{{abnTime}}</td>
        <td>{{decorgCN}}</td>
        <td>{{remExcpresCN}}</td>
        <td>{{remDate}}</td>
        <td>{{reDecOrgCN}}</td>
		</tr>
        {{/each}}
        </script>
            </div>
            <!-- 抽查检查信息 -->
        <div class="mod-bd-panel_company">
            <h3 class="i-title">
                <i></i>抽查检查信息
            </h3>
            <table class="table-common mb20">
                <thead>
                <tr>
                    <th width="50">序号</th>
                    <th width="290">检查实施机关</th>
                    <th width="100">类型</th>
                    <th width="130">日期</th>
                    <th width="390">结果</th>
                </tr>
                </thead>
                <tbody id="table-pubscresult">
                </tbody>
            </table>
            <div class="notice-pagination-box clearfix">
                <span class="page-total">共查询到 <em id="_total_pubscresult"></em> 条信息，共 <em
                        id="_pageNum_pubscresult"></em> 页</span>
                <div id="pagination_pubscresult" class="pagination">
                </div>
            </div>
        </div>
        <script id="table-template-pubscresult" type="text/x-handlebars-template">
            {{#each data}}
            <tr>
                <td>{{xh @index}}</td>
                <td>{{inspectDesc}}</td>
                <td>{{scType}}</td>
                <td>{{transInspectDate inspectDate}}</td>
                <td>{{transCN scResult}}</td>
            </tr>
            {{/each}}
        </script>
        </div>
    </div>
</div>
<div class="mod">
    <div class="footer-box">
        <div class="footer">
            <p>版权所有：浙江省工商行政管理局</p>
            <p>年报公示业务咨询电话：010-82691101（年报）&nbsp;&nbsp;&nbsp;&nbsp;技术支持电话：010-82691768（公示）&nbsp;&nbsp;&nbsp;&nbsp;京备xxxxxxxxICP</p>
        </div>
    </div>
</div>
<script>
    //参数的传递
    window._CONFIG = {
        repType: '${imReportType}',
        pageType: '${pageType}',
    }
</script>
<script src="../../../../js/lib/jquery/jquery-1.12.3.min.js"></script>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
<script src="/js/depsyn/search/cx_xxxq3.js"></script>
</body>
</html>