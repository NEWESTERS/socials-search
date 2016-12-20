function get_socials() {
	result = document.getElementById("result");
	if(result.innerHTML == ''){
		result.innerHTML = "vk.com, facebook.com, youtube.com, twitter.com";
	}
	else{
		result.innerHTML = '';
	}
}