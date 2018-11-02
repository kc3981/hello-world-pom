function validateEmail(email){
    var validEmail=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if(!validEmail.test(email)){
      return false;
    }else{
      return true;
    }
}