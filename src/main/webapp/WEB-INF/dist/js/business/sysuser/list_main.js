define("component/layer",["layer1"],function(e){function t(){var e=parent.layer.getFrameIndex(window.name);return e}return parent.CALLBACK={},{dialog:function(t){var n={ltype:1,type:2},a=$.extend({},n,t),r=1===a.ltype?parent.layer:e,o=r.open({title:a.title,area:a.area,content:a.content,type:a.type,zIndex:r.zIndex,success:function(e){r.setTop(e)},end:function(){a.callback&&a.callback(parent.CALLBACK)}});return o},close:function(n){parent.CALLBACK.reload=!1;var a={ltype:1},r=$.extend({},a,n),o=1===r.ltype?parent.layer:e;r.reload&&(parent.CALLBACK.reload=r.reload);var s=1===r.ltype?t():r.index;o.close(s)},closeAll:function(t,n){var a=n&&1===n?parent.layer:e;a.closeAll(t)},alert:function(t,n,a){var r={ltype:1},o=$.extend({},r,n),s=1===o.ltype?parent.layer:e;o=$.extend(o,{zIndex:s.zIndex,success:function(e){s.setTop(e)}});var l=s.alert(t,o,a);return l},confirm:function(t,n,a,r){var o={ltype:1},s=$.extend({},o,n),l=1===s.ltype?parent.layer:e;return s=$.extend(s,{zIndex:l.zIndex,success:function(e){l.setTop(e)}}),l.confirm(t,s,a,r)},msg:function(t,n,a){var r={ltype:1},o=$.extend({},r,n),s=1===o.ltype?parent.layer:e;return o=$.extend(o,{zIndex:s.zIndex,success:function(e){s.setTop(e)}}),s.msg(t,o,a)}}}),define("component/dataTable",["jquery","jquery.dataTables","dataTables.bootstrap"],function(){return{load:function(e){var t={showIndex:!1,serverSide:!0,ordering:!1,pagingType:"full_numbers",dom:'<"wapper"t<"bottom"<"pull-left page-length"l><"pull-left"i><"pull-right"p>>>'},n=$.extend({},t,e),a=$(e.el).DataTable(n);if(n.showIndex){a.on("draw.dt",function(){a.column(0,{search:"applied",order:"applied"}).nodes().each(function(e,t){t+=1;var n=a.page.info(),r=n.page,o=n.length,s=t+r*o;e.innerHTML=s})})}return a}}}),define("common/util",["jquery"],function(){return{bindEvents:function(e){$.each(e,function(e,t){"string"==typeof t.el?$(document).on(t.event,t.el,t.handler):$(t.el).on(t.event,t.handler)})},getUrlParams:function(e){var t={},n=[];return e&&-1!==e.indexOf("?")?($.each(e.substr(e.indexOf("?")+1).split("&"),function(e,a){n=a.split("="),t[n[0]]=n[1]}),t):t},trims:function(e){var t,n=[];return $.each(e,function(e,a){t=a.replace(/ /g,""),""!=t&&n.push(t)}),n},timeInterval:function(e,t){var n=arguments[2]||new Date;switch(e){case"s":n=new Date(n.getTime()+1e3*t);break;case"n":n=new Date(n.getTime()+6e4*t);break;case"h":n=new Date(n.getTime()+36e5*t);break;case"d":n=new Date(n.getTime()+864e5*t);break;case"w":n=new Date(n.getTime()+6048e5*t);break;case"m":n=new Date(n.getFullYear(),n.getMonth()+t,n.getDate(),n.getHours(),n.getMinutes(),n.getSeconds());break;default:n=new Date(n.getFullYear()+t,n.getMonth(),n.getDate(),n.getHours(),n.getMinutes(),n.getSeconds())}return n=n.getTime()>=(new Date).getTime()?new Date:n,[n.getFullYear(),n.getMonth()+1,n.getDate()].join("/")},dateFormat:function(e,t){var n=t,a=["日","一","二","三","四","五","六"];return n=n.replace(/yy/,e.getFullYear()),n=n.replace(/y/,e.getYear()%100>9?(e.getYear()%100).toString():"0"+e.getYear()%100),n=n.replace(/mm/,e.getMonth()>9?(e.getMonth()+1).toString():"0"+(e.getMonth()+1)),n=n.replace(/m/g,e.getMonth()+1),n=n.replace(/w|W/g,a[e.getDay()]),n=n.replace(/dd/,e.getDate()>9?e.getDate().toString():"0"+e.getDate()),n=n.replace(/d/g,e.getDate()),n=n.replace(/hh/,e.getHours()>9?e.getHours().toString():"0"+e.getHours()),n=n.replace(/h/g,e.getHours()),n=n.replace(/mm/,e.getMinutes()>9?e.getMinutes().toString():"0"+e.getMinutes()),n=n.replace(/m/g,e.getMinutes()),n=n.replace(/ss/,e.getSeconds()>9?e.getSeconds().toString():"0"+e.getSeconds()),n=n.replace(/s/g,e.getSeconds())}}}),define("common/http",["jquery","component/layer"],function(e,t){function n(n){var r=e.extend({},l,n);return r.beforeSend=function(){n.beforeSend&&n.beforeSend()},r.url=a(n.url),r.success=function(e){s&&t.close(),n.success&&n.success(e)},r.error=function(e,a,r){o(e,a,r)||(n.error?n.error():t.msg("网络异常，请重试"))},r.serializable&&(r.contentType="application/json",r.data=JSON.stringify(r.data)),r}function a(t){var n={_t:(new Date).getTime()};return t+"?"+e.param(n)}function r(t){var a=e.ajax(n(t));return a}function o(e,t,n){return 401===e.status?(parent.layer.alert("您尚未登录或登录时间过长,请重新登录!",{icon:3,title:"登录提示"},function(){top.location="/"}),!0):void 0}var s,l={async:!0,dataType:"json",type:"get",serializable:!1};return{httpRequest:r,unAuthError:o}}),require(["component/layer","component/dataTable","common/util","common/http","handlebars","jquery"],function(e,t,n,a,r){function o(){s(),l()}function s(){var e=$("#tpl").html(),n=r.compile(e);i=t.load({el:"#user-table",ajax:"/admin/system/sysuser/list.json",columns:[{data:"username",width:"100px"},{data:"realName"},{data:"email"},{data:"status"},{data:"createTime",width:"150px"},{data:"lastLoginTime",width:"150px"},{data:null,width:"120px",className:"center"}],columnDefs:[{targets:6,render:function(e,t,a,r){var o={func:[{text:"编辑","class":"btn btn-xs btn-primary js-edit"},{text:"删除","class":"btn btn-xs btn-danger js-delete"}]};return n(o)}}]})}function l(){n.bindEvents([{el:".js-add",event:"click",handler:function(){e.dialog({title:"新增用户",area:["628px","500px"],content:"/admin/system/sysuser/show",callback:function(e){e.reload&&i.ajax.reload()}})}},{el:".js-edit",event:"click",handler:function(){var t=i.row($(this).closest("td")).data();e.dialog({title:"编辑用户",area:["628px","500px"],content:"/admin/system/sysuser/show?id="+t.id,callback:function(e){e.reload&&i.ajax.reload()}})}},{el:".js-delete",event:"click",handler:function(){var t=i.row($(this).closest("td")).data();e.confirm("确定要删除吗?",{icon:2,title:"提示"},function(n){a.httpRequest({url:"/admin/system/sysuser/delete",data:{id:t.id},success:function(t){"success"==t.status&&t.msg&&e.msg(t.msg,{time:500},function(){i.ajax.reload()})}})})}}])}o();var i}),define("business/sysuser/list_main",function(){});