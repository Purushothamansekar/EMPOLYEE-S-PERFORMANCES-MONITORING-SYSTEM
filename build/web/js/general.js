// JavaScript Document

var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;  

/*--Textbox Empty Validation--*/
function txt_empty(txt,errControl,msg) 
{
	if(document.getElementById(txt).value == "") 
	{ 
		document.getElementById(errControl).style.color="red";
		document.getElementById(errControl).innerHTML = msg;
		return false;
	} 
    else 
	{
		document.getElementById(errControl).innerHTML = ""; 
	} 
}		 

function chkContentLength(txt,fldlength,span,stringmsg)		 
{
	var val = document.getElementById(txt).value;
	if(val.length < fldlength){
		document.getElementById(span).style.color="red";
		document.getElementById(span).innerHTML = stringmsg; 
	}
	else{
		document.getElementById(span).innerHTML = "";
	}
}
		 
function onchange_ddl(ddl,span,msg)
{ 
	if(document.getElementById(ddl).selectedIndex==0)
	{
		document.getElementById(span).style.color="red";
		document.getElementById(span).innerHTML=msg;
		return false;
	}
	else
	{
		document.getElementById(span).innerHTML="";
	}
}
	
function val_phno(txt,spanid)
{
	var ctrlvalue=document.getElementById(txt);	
	
	if(ctrlvalue.value=='')
    {
		document.getElementById(spanid).style.color="red";
    	document.getElementById(spanid).innerHTML="Phone No Should Not Be Blank";
		return false;
	}
    if(ctrlvalue.value.length<8 || ctrlvalue.value.length>15)
	{
		document.getElementById(spanid).style.color="red";
   		document.getElementById(spanid).innerHTML="Should Be 8 To 15 Digit";
	}
	else
	{
		document.getElementById(spanid).innerHTML="";
	}
}

function val_mobile(txtctrl,span_id)
{
	var ctrlValue=document.getElementById(txtctrl);
	if(ctrlValue.value=='')
    {
		document.getElementById(span_id).style.color="red";
    	document.getElementById(span_id).innerHTML="Please enter Mobile No.";
		return false;
	}
    if(ctrlValue.value.length<10 || ctrlValue.value.length>15)
	{
		document.getElementById(span_id).style.color="red";
		document.getElementById(span_id).innerHTML="Mobile No. should be 10 to 15 digit";	
	}
	else
	{ 
		document.getElementById(span_id).innerHTML="";
		return true;
	}
}

function val_email1(txt,spanid)
{
	var email = document.getElementById(txt).value;
	if(email=='')
	{
     document.getElementById(spanid).style.color="red";	
  	 document.getElementById(spanid).innerHTML="Should Not Be Blank";
	}
   else if(!valemail1(email))
	{
     document.getElementById(spanid).style.color="red";	
  	 document.getElementById(spanid).innerHTML="Invalid Email";
	}
	else
	{
		document.getElementById(spanid).innerHTML="";
	}
}

function valemail1(email)
{
  var RegExp = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return RegExp.test(email);
}

function val_password(txtaudio,MsgControl)
{  
   var txtCtrl=document.getElementById(txtaudio);
   if(txtCtrl.value==""){
	 document.getElementById(MsgControl).style.color="red";
     document.getElementById(MsgControl).innerHTML="Enter Password";	
     return false; 
   } 
   else if (txtCtrl.value.length<6 || txtCtrl.value.length>8){
	 document.getElementById(MsgControl).style.color="red";
 	 document.getElementById(MsgControl).innerHTML="Password 6 to 8 chars";
   }
   else
   {
     document.getElementById(MsgControl).innerHTML="";
   }	
}

function pwd_compare(txt1,txt2,span_id)
{
    var pass=document.getElementById(txt1).value;
    var pass1=document.getElementById(txt2).value;
	
	if(pass1=='')
    {
		document.getElementById(span_id).style.color="red";
    	document.getElementById(span_id).innerHTML="Confirm Password Required";
		return false;
	}
    else if(pass!=pass1){
		document.getElementById(span_id).style.color="red";
   		document.getElementById(span_id).innerHTML="Passwords do not match";
	}
    else
	{
		document.getElementById(span_id).innerHTML="";
	}
}  

function trim(sStr)
{
   sStr = sStr.toString();
   sStr = sStr.replace(/(^\s*)|(\s*$)/g,"");
   sStr = sStr.replace(/\s{2,}/g," ");
   return sStr;
}

function numbersonly(e)
{
	var key = e.which || e.keyCode;
	if (key>=48 && key<=57 || key==8 || key==9) return true;
	return false;
}

function val_textArea(txt,spanid)
{
	if(txt.value.length==0) 
	{
		document.getElementById(spanid).style.color='red';
		document.getElementById(spanid).innerHTML="Required";
	}
	else if(txt.value.length<20 || txt.value.length>500) 
	{
		document.getElementById(spanid).innerHTML="20-500 chars required";
	}
	else{
		document.getElementById(spanid).innerHTML="";
	}
}

function val_zero(txt,span_id)
{
	var val=document.getElementById(txt).value;
	if(val=='0')
    {
		document.getElementById(span_id).style.color="red";
    	document.getElementById(span_id).innerHTML="Should Not Be Zero";
		return false;
	}else{
    	document.getElementById(span_id).innerHTML="";
		return true;
	}
}