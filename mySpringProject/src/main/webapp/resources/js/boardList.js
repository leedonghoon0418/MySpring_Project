console.log("board list in");

document.addEventListener('click',(e)=>{
    let tr = e.target.closest("tr");
    let bno = tr.dataset.bno;
    console.log(tr);
	if(tr){
	    document.getElementById(bno).click();
	}
})