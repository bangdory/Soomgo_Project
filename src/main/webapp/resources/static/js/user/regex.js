// 정규표현식 함수

// 휴대폰 000 0000 0000 하이폰 X 정규표현식
const phoneRegexp = /^\d{11}$/;

// 이메일 정규표현식 shipGosu@gosuShop.com
const emailRegexp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// 패스워드 정규표현식 [대문자 1개 이상, 특수 문자 1개 이상, 숫자 3개 이상이 포함된 8글자 ~ 16글자]
const pwdRegexp = /^(?=.*[A-Z])(?=.*\d.*\d.*\d)(?=.*[\W_]).{8,16}$/;

// 닉네임 정규표현식 [한글, 영문, 숫자 허용 / 최대 10글자]
const nameRegexp = /^[가-힣a-zA-Z0-9]{1,10}$/;

function validatePhoneRegexp(phone) {
    if (phoneRegexp.test(phone)) {
        console.log("휴대폰 번호가 유효합니다.");
        return true;
    }else{
        console.log("휴대폰 번호가 유효하지 않습니다.");
        return false;
    }
}

function validateEmailRegexp(email) {
    if (emailRegexp.test(email)) {
        console.log("이메일이 유효합니다");
        return true;
    }else{
        console.log("이메일이 유효하지 않습니다.");
        return false;
    }
}

function validatePwdRegexp(pwd) {
    if (pwdRegexp.test(pwd)) {
        console.log("비밀번호가 유효합니다");
        return true;
    }else{
        console.log("비밀번호가 유효하지 않습니다.");
        return false;
    }
}

function validateName(name) {
    if (nameRegexp.test(name)) {
        console.log("이름이 유효합니다");
        return true;
    }else{
        console.log("이름이 유효하지 않습니다.");
        return false;
    }
}

