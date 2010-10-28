self.addEventListener('message', function(e) {
  var data = e.data;
  self.postMessage('saving....');
  
  var type 		= data.type;
  var seq 		= data.seq;
  
  //사파리에서는 왜 openDatabase에서 에러가 날까....
  var db;
  db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 2 * 1024 * 1024);
  db.transaction(function(tx) {
	  tx.executeSql('CREATE TABLE IF NOT EXISTS okboard (bbsid text, seq numeric, writer text, subject text, wtime text, content text)',
			  [],
			  self.postMessage('CREATE TABLE SUCCESS..'),
			  function(e){self.postMessage('CREATE TABLE ERROR:'+e.message);});
	  if(type == 'delete'){
		  tx.executeSql("DELETE FROM okboard where seq = ? "
					,[seq]
					,self.postMessage('DELETE')
					,function(e){self.postMessage('DELETE ERROR:'+e.message);});
	  }else{
		  tx.executeSql("SELECT * FROM okboard ", [], function(tx, result) {
			  if(result.rows.length == 0){
				  self.postMessage('DATABASE NOT SAVED..');
			  }else{
				  var tmp = '';
				  for (var i = (result.rows.length-1), item = null; i >= 0; i--) {
					  item = result.rows.item(i);
					  
					  tmp += '<section><article>';

					  tmp += '<h4>';
					  tmp += ((i+1) + ' ' + item['subject']);
					  tmp += '</h4>';

					  tmp += '<h3>';
					  tmp += (item['wtime'] + ', by ' + item['writer']);
					  tmp += '</h3>';

					  tmp += '<a onClick="document.getElementById(\'contents_'+item['seq']+'\').style.display=\'block\';" style="cursor:pointer">SHOW...</a>';
					  tmp += '&nbsp;&nbsp;&nbsp;';
					  tmp += '<a onClick="document.getElementById(\'contents_'+item['seq']+'\').style.display=\'none\';" style="cursor:pointer">CLOSE...</a>';
					  tmp += '&nbsp;&nbsp;&nbsp;';
					  tmp += '<a onClick="javascript:doDelete('+item['seq']+')" style="cursor:pointer">DELETE</a>';
					  tmp += ('<div id="contents_'+item['seq']+'" style="display:none">');

					  tmp += '<p><section>';
					  tmp += item['content'];
					  tmp += '</section></p>';

					  tmp += '</div>';

					  tmp += '</article></section>';
				  }
				  self.postMessage(encodeURI(tmp));
			  }
		  },function(e){self.postMessage('SELECT TABLE ERROR:'+e.message);});
	  }
  });
}, false);


