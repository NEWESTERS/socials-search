function get_socials() {
	result = document.getElementById("tip");
	if(result.innerHTML == ''){
		result.innerHTML = "* vk.com, facebook.com, youtube.com, twitter.com";
	}
	else{
		result.innerHTML = '';
	}
}