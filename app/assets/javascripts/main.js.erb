//テキストエリアをクリックした時
$(document).on('click', 'textarea', function () {
    let i = $(this).attr('class');
    let j = i.substr(5);
    if($(`.input${j}`).attr('readonly') != 'readonly'){
        showIconBtn(j);
    }
});
//テキストエリアの高さを自動調整
function textAreaHeightSet(argObj){
    argObj.style.height = "10px";
    let wSclollHeight = parseInt(argObj.scrollHeight);
    argObj.style.height = wSclollHeight + "px";
}

function showIconBtn(j) {
    $(`.addElement${j}`).show();
}
function hideIconBtn(j) {
    $(`.addElement${j}`).hide();
}
$(document).on('click', '.showMenuIcon', function () {
    let i = $(this).attr('class');
    let j = i.match(/addElement[0-9]/);
    let addElementClass = j[0];
    let addElementNum = addElementClass.substr(10);
    $(`.changeElementImage${addElementNum}`).show();
    $(`.changeElementBack${addElementNum}`).show();
    $(this).hide();
    $(`.input${addElementNum}`).hide();
});
$(document).on('click', '.backMenuIcon', function () {
    let i = $(this).attr('class');
    let j = i.match(/changeElementBack[0-9]/);
    let changeMenuBackClass = j[0];
    let changeMenuBackNum = changeMenuBackClass.substr(17);
    $(`.addElement${changeMenuBackNum}`).show();
    $(`.input${changeMenuBackNum}`).show();
    $(`.changeElementImage${changeMenuBackNum}`).hide();
    $(`#url${changeMenuBackNum}`).hide();
    $(`#myfile${changeMenuBackNum}`).hide();
    $(`#nextBtn${changeMenuBackNum}`).hide();
    $(this).hide();
});

$(document).on('click', '.postIcon', function () {
    let i = $(this).attr('class');
    let j = i.match(/changeElementImage[0-9]/);
    let imgBtnClass = j[0];
    let imgBtnNum = imgBtnClass.substr(18);
    console.log(imgBtnNum);
    $(`.addElement${imgBtnNum}`).hide();
    $(`.changeElementImage${imgBtnNum}`).show();
    $(`.changeElementBack${imgBtnNum}`).show();
    $(`div#modal${imgBtnNum}`).modal('show');
    $(`#nextBtn${imgBtnNum}`).show();
});

$('textarea').attr("tabindex", "0");
$(document).on("keydown", 'textarea', function (e) {
    if (!(typeof e.keyCode === "undefined" || e.keyCode === 13)) {
        return;
    }
    let i = $(this).attr('class').substr(5);
    let j = $('.new').length + 1;
    let n = $("textarea").length;
    let Index = $('textarea').index(this);
    let nextIndex = $('textarea').index(this) + 1;
    let val = $(`.input${i}`).val();
    $(`.addElement${i}`).hide();
    let element = '<div class="new element' + j + '"><div class="addElement' + j +
        ' showMenuIcon icons" style="display: none;"><i class="fas fa-plus-circle fa-2x"></i></div><div class="changeElementBack' +
        j +
        ' backMenuIcon postIcon icons" style="display: none;"><i class="fas fa-times fa-2x"></i><p class="ex-box">テキスト入力</p></div><div class="changeElementImage' +
        j +
        ' postIcon icons imgBtn" style="display: none;"><i class="far fa-image fa-2x imgBtn' +
        j + '"></i><p class="ex-box">画像挿入</p></div><textarea type="text" placeholder="テキスト" class="input' +
        j + '" cols="50" rows="1"  oninput="textAreaHeightSet(this)" onchange="textAreaHeightSet(this)" ></textarea><img id="img' +
        j + '" style="display: none"><button id="nextBtn' + j + '" style="display: none">追加</button></div><div class="modal fade" id="modal'+
        j +'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title'+j+'" id="exampleModalLabel">画像選択</h5><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body'+j+'"></div><div class="modal-footer'+j+'"><button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button><button type="button" class="btn btn-primary">Save changes</button></div></div></div></div>';
    $(`.element${i}`).after(element);
    if (nextIndex < n) {
        $('textarea')[nextIndex].focus();
    } else {
        $('textarea')[Index].blur();
    }
    $('#sendtext').append('&lt;p&gt;' + val + '&lt;/p&gt;');
    $(`.input${i}`).attr('readonly',true);
    hideIconBtn(i);

});

$(document).on({
    "mouseenter": function () {
        $(this).next('p').show();
    },
    "mouseleave": function () {
        $(this).next('p').hide();
    }
}, "i");

$('#inputFile').change(function(e){
    //ファイルオブジェクトを取得する
    let file = e.target.files[0];
    let reader = new FileReader();
    let i = $('div[class^=changeElementImage]:visible').attr('class');
    let j = i.match(/changeElementImage[0-9]/);
    let fileClass = j[0];
    let filenum = fileClass.substr(18);

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
    }
    //アップロードした画像を設定する
    reader.onload = (function(file){
        return function(e){
            $(`.showimg${filenum}`).attr("src", e.target.result);
            $(`.showimg${filenum}`).attr("title", file.name);
        };
    })(file);
    reader.readAsDataURL(file);

});

//有料にした時のアクション
$("[name='note[price_status]']").on('click',function(){
    let num = $("[name='note[price_status]']").index(this);
    if(num == 1){
        $(".input_price").css('visibility','visible');
    }else{
        $(".input_price").css('visibility','hidden');
    }
});
