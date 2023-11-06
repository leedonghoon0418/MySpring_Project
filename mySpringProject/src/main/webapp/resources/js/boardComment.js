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
                getCommentList(bnoVal);
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
        if(result.cmtList.length > 0){
            if(page == 1){
                div.innerHTML = "";
            }
            for(let i=0; i<result.cmtList.length; i++){
                let str = `<tr data-cno="${result.cmtList[i].cno}" data-content="${result.cmtList[i].content}" data-writer="${result.cmtList[i].writer}">`;
                str += `<td>${result.cmtList[i].cno}</td>`;
                str += `<td>${result.cmtList[i].writer}</td>`;
                str += `<td>${result.cmtList[i].content}</td>`;
                str += `<td>${result.cmtList[i].regAt}</td>`;
                str += `<td>${result.cmtList[i].modAt}</td>`;
                str += `<td><button type="button" class="modBtn">수정</button></td>`;
                str += `<td><button type="button" class="delBtn">삭제</button></td>`;
                str += `</tr>`;
                div.innerHTML += str;
            }
            let moreBtn = document.getElementById('moreBtn');
            
            if(result.pgvo.pageNo < result.endPage || result.next){
                moreBtn.style.visibility = 'visible'; 
                moreBtn.dataset.page = page + 1;
            }else{
                moreBtn.style.visibility = 'hidden'; 
            }
        }
        
    })

}

async function removeCommentFromServer(cno){
    try {
        const url="/comment/"+cno;
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
async function editCommentFromServer(cmtModData){
    try {
        const url = "/comment/"+cmtModData.cno;
        const config = {
            method : "put",
            headers:{
                'Content-Type':'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtModData)
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('delBtn')){
        let tr = e.target.closest('tr');
        let dataCno = tr.dataset.cno;
        console.log("tr > "+tr +"  cno > "+dataCno);
        removeCommentFromServer(dataCno).then(result=>{
            if(result == "1"){
                alert("삭제 성공");
                getCommentList(bnoVal);
            }else{
                alert("삭제 실패");
            }
        })
    }else if(e.target.classList.contains('modBtn')){
        let tr = e.target.closest('tr');

        let dataCno = tr.dataset.cno;
        let dataWriter = tr.dataset.writer;
        let dataContent = tr.dataset.content;

        document.getElementById('cmtModText').value = dataContent;
        document.getElementById('cmtModCno').innerText = dataCno;
        document.getElementById('cmtModWriter').innerText = dataWriter;
        

        let mod = document.getElementById('modZone');

        mod.style.display="";
        

        document.getElementById('editBtn').addEventListener('click',()=>{
            let cmtModData = {
                cno : dataCno,
                content : document.getElementById('cmtModText').value
            }
            console.log(document.getElementById('cmtModText').value);


            editCommentFromServer(cmtModData).then(result=>{
                if(result == "1"){
                    alert("수정성공");
                    getCommentList(bnoVal);
                    mod.style.display="none";
                }else{
                    
                    alert("수정 실패");
                }
            })
        })
    }else if(e.target.id=="moreBtn"){
        getCommentList(bnoVal, parseInt(e.target.dataset.page));
    }else if(e.target.id=="exitBtn"){
        let mod = document.getElementById('modZone');
        mod.style.display="none";
    }
})

