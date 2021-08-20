const inputs = document.querySelectorAll('input');
const patterns = {
    email: /^([a-zA-Z0-9\.-])+@([a-zA-Z])+\.([a-zA-Z]{2,8})$/ ,
    password: /^[a-zA-Z0-9 ]{6,}$/,
    phone: /^03[0-4]\d{8}$/,
    name: /^([a-zA-Z ])+$/,
    address: /^([\w-\. ])+$/,

};

const validate = (field, regex)=>{
    if(regex.test(field.value)){
        field.classList.remove('invalid')
        field.classList.add('valid')
    }else{
        field.classList.remove('valid')
        field.classList.add('invalid')
    }
}



inputs.forEach((input) => {
    input.addEventListener('keyup',(e)=>{
        validate(e.target, patterns[e.target.name])
    })
})

const handleSubmit = ()=>{
    let checkResult = true;
    try{
        const textarea = document.querySelector('textarea');
        if(textarea.value == ''){
            textarea.style.borderColor = "red";
            const parentElement = textarea.parentElement
            if(parentElement.childElementCount > 1){
                parentElement.lastChild.remove()
            }
            parentElement.innerHTML += "<p class='invalidfile'>Message field cannnot be empty</p>";
            checkResult = false;
        }
    }catch(error){
        //
    }
    const inputs = document.querySelectorAll('input');
    for(let input of inputs) {
        if(input.classList.contains('invalid')){
            checkResult = false;
        } else if(input.type != 'file'){
            if(input.value == ''){
            input.classList.add('invalid');
            checkResult = false
            }
        }
    }
    return checkResult;
}