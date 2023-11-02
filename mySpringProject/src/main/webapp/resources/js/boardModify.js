console.log("board modify in");


async function removeFileToServer(uuid){
   
    try {
        const url = "/board/file/"+uuid;
        const config = {
            method : "delete"
        }
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click',(e)=>{
    if(e.target.id == "fileRemoveBtn"){
        let td = e.target.closest('td');
        let uuid = td.dataset.uuid;

        removeFileToServer(uuid).then(result=>{
            if(result == "1"){
                alert("사진삭제 성공");
                e.target.closest('td').remove;
                location.reload();
            }else{
                alert("사진삭제 실패");
            }
        })
    }
})