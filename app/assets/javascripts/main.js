$(document).on('click', 'textarea', function () {
    let i = $(this).attr('class');
    let j = i.substr(5);
    showIconBtn(j);
});
// $(document).on('blur','textarea',function () {
//     let i = $(this).attr('class');
//     let j = i.substr(5);
//     hideIconBtn(j);
// });

function textAreaHeightSet(argObj){
    argObj.style.height = "10px";
    let wSclollHeight = parseInt(argObj.scrollHeight);
    // テキストエリアの高さを設定する
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
    $(`.changeElementUrl${addElementNum}`).show();
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
    $(`.changeElementUrl${changeMenuBackNum}`).hide();
    $(`.changeElementImage${changeMenuBackNum}`).hide();
    $(`#url${changeMenuBackNum}`).hide();
    $(`#myfile${changeMenuBackNum}`).hide();
    $(`#nextBtn${changeMenuBackNum}`).hide();
    $(this).hide();
});
$(document).on('click', '.imgBtn', function () {
    let i = $(this).attr('class');
    let j = i.match(/changeElementImage[0-9]/);
    let imgBtnClass = j[0];
    let imgBtnNum = imgBtnClass.substr(18);
    $(`#myfile${imgBtnNum}`).show();
    $(`#nextBtn${imgBtnNum}`).show();
    $(`.changeElementUrl${imgBtnNum}`).hide();
    $(`.changeElementImage${imgBtnNum}`).hide();
});
$(document).on('click', '.urlBtn', function () {
    let i = $(this).attr('class');
    let j = i.match(/changeElementUrl[0-9]/);
    let urlBtnClass = j[0];
    let urlBtnNum = urlBtnClass.substr(16);
    $(`#url${urlBtnNum}`).show();
    $(`.changeElementUrl${urlBtnNum}`).hide();
    $(`.changeElementImage${urlBtnNum}`).hide();
});

$('textarea').attr("tabindex", "0");
$(document).on("keydown", 'textarea', function (e) {
    if (typeof e.keyCode === "undefined" || e.keyCode === 13) {
        let i = $(this).attr('class').substr(5);
        let j = $('.new').length + 1;
        let n = $("textarea").length;
        let Index = $('textarea').index(this);
        let nextIndex = $('textarea').index(this) + 1;
        let val = $(`.input${i}`).val();
        $(`.addElement${i}`).hide();
        let element = '<div class="new element'+j+'"><div class="addElement' + j +
            ' showMenuIcon icons" style="display: none;"><i class="fas fa-plus-circle fa-2x"></i></div><div class="changeElementBack' +
            j +
            ' backMenuIcon postIcon icons" style="display: none;"><i class="fas fa-times fa-2x"></i><p class="ex-box">テキスト入力</p></div><div class="changeElementUrl' +
            j +
            ' postIcon icons urlBtn" style="display: none;"><i class="fas fa-globe fa-2x urlBtn' + j + '"></i><p class="ex-box">URL挿入</p></div><div class="changeElementImage' +
            j +
            ' postIcon icons imgBtn" style="display: none;"><i class="far fa-image fa-2x imgBtn' + j + '"></i><p class="ex-box">画像挿入</p></div><textarea type="text" placeholder="テキスト" class="input' +
            j + '" cols="50" rows="1"  oninput="textAreaHeightSet(this)" onchange="textAreaHeightSet(this)" ></textarea><img id="img' + j + '" style="display: none"><input type="file" id="myfile' + j + '" style="display: none"><button id="nextBtn' + j + '" style="display: none">追加</button><input type="url" id="url' + j + '" style="display: none;"></div>';
        $(`.element${i}`).after(element);
        if (nextIndex < n) {
            $('textarea')[nextIndex].focus();
        } else {
            $('textarea')[Index].blur();
        }
        $('#sendtext').append('<p>' + val + '</p>');
    }
});

$(document).on({
    "mouseenter": function () {
        $(this).next('p').show();
    },
    "mouseleave": function () {
        $(this).next('p').hide();
    }
}, "i");

$('.url').attr("tabindex", "0");
$(document).on("keydown", '.url', function (e) {
    if (typeof e.keyCode === "undefined" || e.keyCode === 13) {
        let i = $(this).attr('id').substr(3);
        let j = $('.url').length + 1;
        let n = $(".url").length;
        let Index = $('.url').index(this);
        let nextIndex = $('.url').index(this) + 1;
        let val = $(`#url${i}`).val();
        $(`.addElement${i}`).hide();
        let element = '<div class="new element'+j+'"><div class="addElement' + j +
            ' showMenuIcon icons" style="display: none;"><i class="fas fa-plus-circle fa-2x"></i></div><div class="changeElementBack' +
            j +
            ' backMenuIcon postIcon icons" style="display: none;"><i class="fas fa-times fa-2x"></i><p class="ex-box">テキスト入力</p></div><div class="changeElementUrl' +
            j +
            ' postIcon icons urlBtn" style="display: none;"><i class="fas fa-globe fa-2x urlBtn' + j + '"></i><p class="ex-box">URL挿入</p></div><div class="changeElementImage' +
            j +
            ' postIcon icons imgBtn" style="display: none;"><i class="far fa-image fa-2x imgBtn' + j + '"></i><p class="ex-box">画像挿入</p></div><textarea type="text" placeholder="テキスト" class="input' +
            j + '" cols="50" rows="1"  oninput="textAreaHeightSet(this)" onchange="textAreaHeightSet(this)" ></textarea><img id="img' + j + '" style="display: none"><input type="file" id="myfile' + j + '" style="display: none"><button id="nextBtn' + j + '" style="display: none">追加</button><input class="url" type="url" id="url' + j + '" style="display: none;"></div>';
        $(`.element${i}`).after(element);
        if (nextIndex < n) {
            $('textarea')[nextIndex].focus();
        } else {
            $('textarea')[Index].blur();
        }
        $('#sendtext').append('<a href="'+val+'">' + val + '</a>');
    }
});

$(document).on('click', 'input[type=file]', function () {
    let i = $(this).attr('id').substr(6);
    $(`#myfile${i}`).on('change', function () {
        let file = this.files[0];
        if (file != null) {
            let name = file.name;
            $(`#nextBtn${i}`).on('click', function () {
                $('#sendtext').append('<img src="' + name + '">')
            })

        }
    });

});
