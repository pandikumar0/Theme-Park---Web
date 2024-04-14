function readAjax(fileURL,changeId){
    console.log("readAjax called",fileURL,changeId);
    var request = new XMLHttpRequest();
    request.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200 ){
            document.getElementById(changeId).textContent = this.responseText;
            console.log("successful");
        }
        else{
            console.log("Error occured....");
        }
    };
    request.open("GET",fileURL);
    request.send();
}
