<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Server-Sent Event</title>
<script type="text/javascript">
function init(){
	//EventSource : 사파리만 지원되는걸로 추측...(근데 안되 킁...)
	var source = new EventSource("message.jsp");
	source.addEventListener("message", function(event){
		alert('a');
		var data = event.data.split("\n");
		var symbol = data[0];
		alert(symbol);
		var delta = parseInt(data[1],10);
		var cell = document.getElementById(symbol);
		var currentValue = parseInt(cell.textContent,10);
		cell.textContent = currentValue + delta;
		}, false);
}
</script>
</head>
<body onload="init()">
<h1>Server-Sent Event</h1>
<table border="1">
	<tr>
		<td>one</td>
		<td>two</td>
		<td>three</td>
	</tr>
	<tr>
		<td id="one">11</td>
		<td id="two">22</td>
		<td id="three">33</td>
	</tr>	
</table>
</body>
</html>