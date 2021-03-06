$().ready(function(){
    var id = document.getElementById('memId').innerHTML;
    var m_imgPath = document.getElementById('memPro').innerHTML;
    var b_imgPath = document.getElementById('busPro').innerHTML;
    var sup = document.getElementById('sup').innerHTML;
    var login = document.getElementsByClassName('login');
    var logout = document.getElementsByClassName('logout');
    var profile_img = document.getElementsByClassName('prof');
    var b_icon = document.getElementById('busk_icon');
    var s_icon = document.getElementById('sup_icon');

    /*헤더 부분필터*/
    if(id.length > 0){
        login[0].style.display = 'none';
        logout[0].style.display = 'inline';
        profile_img[0].style.display = 'inline';

        var busk_icon = document.getElementById('busk_icon');
        var sup_icon = document.getElementById('sup_icon');
        var edit_icon = document.getElementById('edit_icon');
        var user_manager = document.getElementById('user_manager');
        var user_grade = document.getElementById('user_grade');
        
        if(id == 999999){
            user_manager.style.display = 'block';
            user_grade.style.display = 'block';
            
        }
        
        edit_icon.style.display = 'block';
        
        // 프로필 이미지, accordian & iconbar 필터부분
        if(m_imgPath.length > 0 && b_imgPath.length == 0){
        	
            $('#pro_img').attr('src', '/upload/'+m_imgPath);
            if(m_imgPath.indexOf('http') >= 0){
                $('#pro_img').attr('src',m_imgPath);
            }
            busk_icon.style.display = 'none';
            sup_icon.style.display = 'none';
            // 추후에 제공자 수정해야함 지금은 none 고정
        }
        
        if(sup.length > 0){
            busk_icon.style.display = 'none';
            sup_icon.style.display = 'block';
            edit_icon.style.display = 'none';
        }

        if (b_imgPath.length > 0){
            $('#pro_img').attr('src', '/upload/'+b_imgPath);

            busk_icon.style.display = 'block';
            sup_icon.style.display = 'none';
            edit_icon.style.display = 'none';
            // 추후에 제공자 수정해야함 지금은 none 고정
        }

    } else {
        login[0].style.display = 'inline';
        logout[0].style.display = 'none';
        profile_img[0].style.display = 'none';
    }

/*    $('.myinfo').on('click',function(){

        if(id.length > 0){

            if(b_imgPath.length > 0){
                location.href = '/app/editprofile/busker/form';
            }
            if(sup.legnth > 0){
                location.href = '/app/editprofile/supporter/form';
            }
            location.href = '/app/editprofile/member/form';
        }
    });*/ 

    if(document.getElementsByClassName('fol_avi').length > 0){
        aviFilter(logout); //메인 동영상 필터
    }
});

function aviFilter(logout){
    var folAvi = document.getElementsByClassName('fol_avi');
    var recAvi = document.getElementsByClassName('rec_avi');
    var chkFol = document.getElementById('chkFol');
    if(logout[0].style.display == 'inline' && chkFol.childNodes.length > 1){
        folAvi[0].style.display = 'inline';
        recAvi[0].style.display = 'none';
    } else {
        folAvi[0].style.display = 'none';
        recAvi[0].style.display = 'inline';
    }
}
