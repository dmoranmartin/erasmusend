
var breakfunction = function(word, id, letter){
	if (word[0].charAt(0).toLowerCase() == letter){
		var content_div = $("#alph").html()
		$("#alph").html( '<p>'+ '<a href = "/words/'+id+'/definitions">'+word +'</a> ' + '</p>' + content_div );
	}
}
var findLetter = function(letter)  {
	var letter = letter.toLowerCase();
	for (var i = 0; i < gon.words.length; i++){
			breakfunction(gon.words[i], gon.words_id[i], letter);
		}

		
};
$(".letter").on('click', function(event){
	$("#alph").html([])
	$(".words_list").html([])
	findLetter(event.currentTarget.innerText);	
});