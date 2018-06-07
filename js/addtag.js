function addNewTag(event) {
  var inputnode = document.getElementById("input-tag")
  var value = stripspaces(inputnode)
  var hashtag = "#";
  if((event.keyCode == 13 || event.keyCode == 32)){
    if(value) {
      var node = document.createElement("BUTTON");
      node.onclick = function(e) { this.parentNode.removeChild(this) };
      node.className = "btn btn-addtag";
      var textnode = document.createTextNode( hashtag.concat(document.getElementById("input-tag").value));
      node.appendChild(textnode);
      document.getElementById("tagList").appendChild(node);
    }
    document.getElementById("input-tag").value = "";
  }
}

function stripspaces(input) {
  return input.value.replace(/\s/gi,"");
}

$(document).ready(function(){
    $(".btn-clear").click(function(){
        $(".btn-addtag").remove();
    });
});
