window.addEventListener('load', function(){
  document.getElementById("hide").style.display ="none";
  document.getElementById("open")
  window.clickBtn1 = function clickBtn1(){
    const hide = document.getElementById("hide");
    if(hide.style.display=="block"){
      // noneで非表示
      hide.style.display ="none";
    }else{
      // blockで表示
      hide.style.display ="block";
    }
  }
})