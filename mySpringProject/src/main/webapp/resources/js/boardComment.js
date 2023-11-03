console.log("board Comment in");

async function postCommentToServer(cmtData){
    try {
        const url = "/comment/post";
        const config = {
             method: "post",
       		 headers: {
            'Content-Type':'application/json; charset=utf-8'
        	},
            body : JSON.stringify(cmtData)
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    } catch (error) {
       console.log(error); 
    }
}

document.getElementById('postBtn').addEventListener('click',()=>{
    const cmtWriter = document.getElementById('cmtWriter').value;
    const cmtText = document.getElementById('cmtText').value;

    if(cmtText == null || cmtText==""){
        alert("댓글을 입력해주세요");
        return false;
    }else{
        let cmtData ={
            bno : bnoVal,
            writer : cmtWriter,
            content : cmtText
        }
        console.log(cmtData);
        postCommentToServer(cmtData).then(result=>{
        console.log(result);
            if(result == "1"){
                alert("댓글 등록 성공");
                document.getElementById('cmtText').value="";
            }else{
                alert("댓글 등록 실패");
            }
        })
    }
})

async function spreadComment(bno,page){
    try {
        const resp = await fetch("/comment/"+bno+"/"+page);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

function getCommentList(bno, page=1){
    spreadComment(bno,page).then(result=>{
        let div = document.getElementById('commentZone');

    })

}


