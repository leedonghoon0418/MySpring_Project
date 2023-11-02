console.log('board Register in');

document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
})

const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024*1024*20;

function fileValidation(fileName, fileSize){
    if(!regExpImg.test(fileName)){
        return 0;
    }else if(regExp.test(fileName)){
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    }else{
        return 1;
    }

}


document.addEventListener('change',(e)=>{
    if(e.target.id == 'files'){
        document.getElementById('regBtn').disabled = false;

        const fileObject = document.getElementById('files').files;

        let div = document.getElementById('fileZone');

        let isOk = 1;
        let ul = `<ul class="list-group list-group-flush">`;
        for(let file of fileObject){
            let vaildResult = fileValidation(file.name,file.size);
            isOk *= vaildResult;
            ul += `<li class="list-group-item">`;
            ul += `<div class="mb-3">`;
            ul += `${vaildResult ? '<div class="mb-3" >업로드 가능</div>' : '<div class="mb-3 text-danger">업로드 불가능</div>'}`;
            ul += `${file.name}</div>`;
            ul += `<span class="badge text-bg-${vaildResult ? "success":"danger"}">${file.size}Bytes</span></li>`;
        }
        ul += `</ul>`;
        div.innerHTML += ul;
        if(isOk == 0){
            document.getElementById('regBtn').disabled = true;
        }
    }

})