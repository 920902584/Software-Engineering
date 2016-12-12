// JavaScript Document

//////////////////////////////////////////变量—初始化///////////////////////////////////////
var toBeColor = "#F8F9FC";
var backColor = "#FFFFFF";
var tableId = "tbData";
var table;
var tbody;
var divShowInput;
window.onload=function(){
beginListen();
table = document.getElementById(tableId);
tbody = table.getElementsByTagName("tbody")[0];
actionFill ();
otherFill();
creatDiv();
divShowInput = document.getElementById("divShowInput");
}
function creatDiv(){
var filldiv = document.createElement("div");
filldiv.setAttribute("id","divShowInput");
var barp = document.createElement("p");
barp.setAttribute("id","barTitle");
barp.onclick=hideDiv;
var defComP = document.createElement("p");
defComP.setAttribute("id","defComP");
defComP.onclick=hideDiv;
var cleara = document.createElement("a");
cleara.setAttribute("href","javascript:void 0");
cleara.onclick=clearInput;
var clearatext = document.createTextNode("清空");
cleara.appendChild(clearatext);
defComP.appendChild(cleara);
var autoP = document.createElement("P");
autoP.setAttribute("id","autoFillP");
filldiv.appendChild(barp);
filldiv.appendChild(defComP);
filldiv.appendChild(autoP);
document.body.appendChild(filldiv);
}
//////////////////////////////////////////变量—_初始化///////////////////////////////////////
//////////////////////////////////////////动作填充///////////////////////////////////////
function actionFill (){
var dbinputs = tbody.getElementsByTagName("input");
for (var i = 1;i<=dbinputs.length-1;i++){
dbinputs[i].onfocus=stopListen;
dbinputs[i].onblur=beginListen;
dbinputs[i].ondblclick=showDiv;
dbinputs[i].onmouseover=onChangTrColor;
dbinputs[i].onmouseout=outChangTrColor;
dbinputs[i].onclick=readyedit;
dbinputs[i].onkeydown=gonext;
}
}
function otherFill (){
var Bt_selectAll = document.getElementById("Bt_selectAll");
Bt_selectAll.setAttribute("href","javascript:void 0");
Bt_selectAll.onclick=selectAll;
var Bt_delSelect = document.getElementById("Bt_delSelect");
Bt_delSelect.setAttribute("href","javascript:void 0");
Bt_delSelect.onclick=delSelect;
var Bt_copySelect = document.getElementById("Bt_copySelect");
Bt_copySelect.setAttribute("href","javascript:void 0");
Bt_copySelect.onclick=copySelect;
var Bt_allclear = document.getElementById("Bt_allclear");
Bt_allclear.setAttribute("href","javascript:void 0");
Bt_allclear.onclick=allClear;
var Bt_sendData = document.getElementById("Bt_sendData");
Bt_sendData.setAttribute("href","javascript:void 0");
Bt_sendData.onclick=sendData;
}
//////////////////////////////////////////动作填充///////////////////////////////////////
//////////////////////////////////////////ajax类///////////////////////////////////////
function Ajax(url,recvT,stringS,resultF) {
this.url = url;
this.stringS = stringS;
this.xmlHttp = this.createXMLHttpRequest();
this.resultF = resultF;
this.recvT = recvT;
if (this.xmlHttp == null) {
alert("erro");
return;
}
var objxml = this.xmlHttp;
var othis = this;
objxml.onreadystatechange = function (){othis.handleStateChange()};
}
Ajax.prototype = {
createXMLHttpRequest:function() {
try { return new ActiveXObject("Msxml2.XMLHTTP");    } catch(e) {}
try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch(e) {}
try { return new XMLHttpRequest();                   } catch(e) {}
return null;
},
createQueryString:function () {
var queryString = this.stringS;
return queryString;
},
get : function () {
url = this.url;
var queryString = url+"?timeStamp=" + new Date().getTime() + "&" + this.createQueryString();
this.xmlHttp.open("GET",queryString,true);
this.xmlHttp.send(null);
},
post : function() {
url = this.url;
var url = url + "?timeStamp=" + new Date().getTime();
var queryString = this.createQueryString();
this.xmlHttp.open("POST",url,true);
this.xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
this.xmlHttp.send(queryString);
},
handleStateChange : function () {
var xmlhttp = this.xmlHttp;
var recvT = this.recvT;
var resultF = this.resultF;
if (xmlhttp.readyState == 4) {
if (xmlhttp.status == 200) {
resultF.call(this,recvT?xmlhttp.responseXML:xmlhttp.responseText);
} else {
alert("您所请求的页面有异常。");
}
}
}
}
//////////////////////////////////////////ajax类///////////////////////////////////////
//////////////////////////////////////////处理鼠标事件///////////////////////////////////////
//表格变色
function onChangTrColor(event) {
var e = event || window.event;
var obj = e.target || e.srcElement;
obj.parentNode.style.backgroundColor = toBeColor;
obj.style.backgroundColor = toBeColor;
var inputs = obj.parentNode.parentNode.getElementsByTagName("input");
for (var i = 0; i < inputs.length; i++ ){
inputs[i].style.backgroundColor = toBeColor;
inputs[i].parentNode.style.backgroundColor = toBeColor;
}
}
function outChangTrColor(event) {
var e = event || window.event;
var obj = e.target || e.srcElement;
obj.parentNode.style.backgroundColor = backColor;
obj.style.backgroundColor = backColor;
var inputs = obj.parentNode.parentNode.getElementsByTagName("input");
for (var i = 0; i < inputs.length; i++ ){
inputs[i].style.backgroundColor = backColor;
inputs[i].parentNode.style.backgroundColor = backColor;
}
}
//////////////////////////////////////////处理鼠标事件///////////////////////////////////////
//////////////////////////////////////////处理页面操作///////////////////////////////////////
//复制所选
function copySelect(){
var checkboxs = document.getElementsByName("checkbox");
for (var i=0; i<checkboxs.length; i++) {
if(checkboxs[i].checked == true){
checkboxs[i].checked = false;
copyTr(checkboxs[i]);
checkboxs[i].checked = true;
}
}
actionFill ();
}
function copyTr(obj) {
var tbody = document.getElementById("tbData").getElementsByTagName("tbody")[0];
var Str = obj.parentNode.parentNode;
var tr =  Str.cloneNode(true);
tbody.appendChild(tr);
}
//删除所选
function delSelect(){
var checkboxs = document.getElementsByName("checkbox");
var tr = table.getElementsByTagName("tr");
for (var i=0; i<checkboxs.length; i++) {
if(tr.length==2){
checkboxs[i].checked = false;
return;
}
if(checkboxs[i].checked==true){
removeTr(checkboxs[i]);
i=-1;
}
}
}
function removeTr(obj) {
var sTr = obj.parentNode.parentNode;
sTr.parentNode.removeChild(sTr);
}
//全选按钮
function selectAll() {
var checkboxs = document.getElementsByName("checkbox");
var mark = true;
for (var i=0; i<checkboxs.length; i++) {
if (checkboxs[i].checked==false){mark = false}
}
if (mark){
for (var i=0; i<checkboxs.length; i++) {
checkboxs[i].checked = false;
}
}else{
for (var i=0; i<checkboxs.length; i++) {
checkboxs[i].checked = true;
}
}
}
//鼠标点击聚焦
function readyedit(event){
var e = event || window.event;
var obj = e.target || e.srcElement;
obj.select();
}
//清空
function allClear(){
var inputs = tbody.getElementsByTagName("input");
for (var i=0;i<inputs.length;i++) {
inputs[i].value="";
}
}
//全部删除
function allDel(){
var trs = tbody.getElementsByTagName("tr");
//alert(trs.length);
for(var i=1 ;i<=trs.length ;i++) {
if(typeof(trs[i])!="undefined"){
tbody.removeChild(trs[i]);
i=0;
}
}
}
//////////////////////////////////////////处理页面操作///////////////////////////////////////
//////////////////////////////////////////处理键盘操作///////////////////////////////////////
//键盘事件
function beginListen(){
if(document.addEventListener){
document.addEventListener("keydown",keyDown,true);
}else{
document.attachEvent("onkeydown",keyDown);
}
}
function stopListen(){
if(document.removeEventListener){
document.removeEventListener("keydown",keyDown,true);
}else{
document.detachEvent("onkeydown",keyDown);
}
}
//处理键盘事件
function keyDown(event){
var e = event || window.event;
if(e.keyCode==45){addTr()}
if(e.keyCode==46){delTr()}
}
//增加表格
function addTr() {
var sTr = tbody.getElementsByTagName("tr")[0];
var tr =  sTr.cloneNode(true);
tbody.appendChild(tr);
actionFill ();
}
//删除表格
function delTr() {
var tr = table.getElementsByTagName("tr");
if(tr.length==2){return;}
var lastTr = tr[tr.length-1];
lastTr.parentNode.removeChild(lastTr);
}
//移动焦点
function gonext(event) {
var e = event || window.event;
var obj = e.target || e.srcElement;
if(e.keyCode==13){
var nextobj = obj.parentNode.parentNode.nextSibling;
var objindex = obj.parentNode.cellIndex;
if(nextobj){
if (nextobj.nodeType==3){
var nextinput = nextobj.nextSibling.getElementsByTagName("input")[objindex];
nextinput.focus();
nextinput.select();
}else{
var nextinput = nextobj.getElementsByTagName("input")[objindex];
nextinput.focus();
nextinput.select();
}
}
}
}
//////////////////////////////////////////处理键盘操作///////////////////////////////////////
//////////////////////////////////////////处理按钮事件///////////////////////////////////////
//自动填充
var currentObj;
function showDiv(event) {
var e = event || window.event;
var obj = e.target || e.srcElement;
var eX = e.clientX;
var eY = e.clientY;
var sY = document.body.parentNode.scrollTop;
var dY = eY + sY;
var divShowInput = document.getElementById("divShowInput");
divShowInput.style.top = dY + "px";
divShowInput.style.left = eX+"px";
divShowInput.style.display = "block";
hideListen();
currentObj = obj;
////智能菜单////
fixMenu();
//判断焦点位置
var tdOrder = obj.parentNode.cellIndex;
//填充标题标题
var tdTitleTr = document.getElementById("tbData").getElementsByTagName("tr")[0];
var tdTitle = tdTitleTr.getElementsByTagName("td")[tdOrder];
document.getElementById("barTitle").innerHTML = tdTitle.innerHTML;
//收集表格信息//判断重复
var trs = obj.parentNode.parentNode.parentNode.getElementsByTagName("tr");
var autoFillP = document.getElementById("autoFillP");
var bankM = true;
for (var i = 0; i <  trs.length; i++ ){
var inputValue = trs[i].getElementsByTagName("td")[tdOrder].getElementsByTagName("input")[0].value;
if (inputValue != "") {
bankM = false;
var menus = autoFillP.getElementsByTagName("a");
if(menus.length > 0) {
var beliveM = true;
for (var j = 0; j < menus.length; j++ ){
if(menus[j].firstChild.nodeValue == inputValue) {
beliveM = false;
}
}
if(beliveM){
var Svalue = document.createElement("a");
Svalue.setAttribute("href","javascript:void 0");
Svalue.onclick = function () {fillInput(this)};
var Stext = document.createTextNode(inputValue);
Svalue.appendChild(Stext);
autoFillP.appendChild(Svalue);
}
}else{
var Svalue = document.createElement("a");
Svalue.setAttribute("href","javascript:void 0");
Svalue.onclick = function () {fillInput(this)};
var Stext = document.createTextNode(inputValue);
Svalue.appendChild(Stext);
autoFillP.appendChild(Svalue);
}
}
}
if(bankM) {
var Svalue = document.createElement("a");
Svalue.setAttribute("href","javascript:void 0");
var Stext = document.createTextNode("数据空");
Svalue.appendChild(Stext);
autoFillP.appendChild(Svalue);
}
}
function fillInput(obj) {
currentObj.value = obj.innerHTML;
divShowInput.style.display = "none";
}
function clearInput() {
currentObj.value = "";
divShowInput.style.display = "none";
}
function hideDiv() {
divShowInput.style.display = "none";
stophide();
}
function hideListen(){
if(document.addEventListener){
document.addEventListener("click",hideDiv,true);
}else{
document.attachEvent("onclick",hideDiv);
}
}
function stophide(){
if(document.removeEventListener){
document.removeEventListener("click",keyDown,true);
}else{
document.detachEvent("onclick",keyDown);
}
}
//删除智能菜单已有数据
function fixMenu() {
var autoFillP = document.getElementById("autoFillP");
var values = autoFillP.getElementsByTagName("a");
for (var i = values.length-1; i >= 0; i-- ){
autoFillP.removeChild(values[i]);
}
}
//////////////////////////////////////////处理按钮事件///////////////////////////////////////
//////////////////////////////////////////数据发送///////////////////////////////////////
//////////////////////////////////////////数据发送///////////////////////////////////////
function sendData() {
var divFoltupDiv = document.getElementById("divFoltupDiv");
divFoltupDiv.style.display = "block";
var sendokinf = document.getElementById("sendokinf");
var sendokBiginf = document.getElementById("sendokBiginf");
var sendName = new Array();
var trs = tbody.getElementsByTagName("tr");
var inputNames = trs[0].getElementsByTagName("input");
for (var i = 0; i < inputNames.length-1; i++) {
sendName[i]=inputNames[i+1].getAttribute("name");
}
var trnum = trs.length;
var oknum = 0;
for (var i = 0; i < trnum; i++) {
var values = trs[i].getElementsByTagName("input");
var postStringAry = new Array();
for (var j = 0; j < values.length-1; j++) {
postStringAry[j]=sendName[j]+"="+values[j+1].value;
}
var postString = postStringAry.join("&");
function sendOk(revData){
if(revData=="ok"){
oknum++;
sendokinf.innerHTML = "已成功发送 "+oknum+" 行 共"+trnum+" 行";
sendokBiginf.innerHTML = trnum-oknum;
if (trnum-oknum==0){
divFoltupDiv.style.display = "none";
allClear();
allDel();
}
}
}
var SendAjax = new Ajax("isave.asp",0,postString,sendOk);
SendAjax.post();
}
}
//////////////////////////////////////////数据发送///////////////////////////////////////
//-->