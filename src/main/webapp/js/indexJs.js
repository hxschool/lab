/**
 * Created by MAC on 2018/4/6.
 */
function divBlock(){
	var elm = document.getElementById('imgS1');
	if (liDiv1.style.display=="none") {
		elm.setAttribute('style', '-ms-transform:rotate(90deg);-moz-transform:rotate(90deg);-webkit-transform:rotate(90deg);-o-transform:rotate(90deg);');
		liDiv1.style.display = "block";
	}
	else{
		elm.setAttribute('style','-ms-transform:rotate(0deg);-moz-transform:rotate(0deg);-webkit-transform:rotate(0deg);-o-transform:rotate(0deg);');
		liDiv1.style.display="none";
	}

}
function divBlock2(){
	var elm = document.getElementById('imgS2');
	if (liDiv2.style.display=="none"){
		elm.setAttribute('style', '-ms-transform:rotate(90deg);-moz-transform:rotate(90deg);-webkit-transform:rotate(90deg);-o-transform:rotate(90deg);');
		liDiv2.style.display="block";
	}
	else{
		elm.setAttribute('style','-ms-transform:rotate(0deg);-moz-transform:rotate(0deg);-webkit-transform:rotate(0deg);-o-transform:rotate(0deg);');
		liDiv2.style.display="none";
	}
}
function divBlock3(){
	var elm = document.getElementById('imgS3');
	if (liDiv3.style.display=="none"){
		elm.setAttribute('style','-ms-transform:rotate(90deg);-moz-transform:rotate(90deg);-webkit-transform:rotate(90deg);-o-transform:rotate(90deg);');
		liDiv3.style.display="block";
	}
	else{
		elm.setAttribute('style','-ms-transform:rotate(0deg);-moz-transform:rotate(0deg);-webkit-transform:rotate(0deg);-o-transform:rotate(0deg);');
		liDiv3.style.display="none";
	}
}
/*负责跳转页面*/
function htmlUrl(){
	document.getElementById("bottom1").innerHTML = '<object type="text/html" data="test.html" width="100%" height="100%"></object>';
}
function firstUrl(){
	document.getElementById("bottom1").innerHTML = '<object type="text/html" data="firstPage.jsp" width="100%" height="100%"></object>';
}

