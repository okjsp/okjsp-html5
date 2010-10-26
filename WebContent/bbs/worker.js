self.addEventListener('message', function(e) {
  var data = e.data;
  self.postMessage('saving....');
  var seq 		= data.seq;
  var bbs 		= data.bbs;
  var writer 	= data.writer;
  var subject 	= data.subject;
  var when 		= data.when;
  var content 	= data.content;
  var type 		= data.type;
  
  //사파리에서는 왜 openDatabase에서 에러가 날까....
  var db;
  db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 2 * 1024 * 1024);
  db.transaction(function(tx) {
	  tx.executeSql('CREATE TABLE IF NOT EXISTS okboard (bbsid text, seq numeric, writer text, subject text, wtime text, content text)',
			  [],
			  self.postMessage('CREATE TABLE SUCCESS..'),
			  function(e){self.postMessage('CREATE TABLE ERROR:'+e.message);});
	  tx.executeSql("SELECT * FROM okboard where seq = ?", [seq], function(tx, result) {
		  if(result.rows.length == 0){
			  if(type == 'insert'){
				  tx.executeSql("insert into okboard(bbsid,seq,writer,subject,wtime,content) "
							+"values(?,?,?,?,?,?)"
							,[bbs,seq,writer,subject,when,content]
							,self.postMessage('INSERT SUCCESS..')
							,function(e){self.postMessage('INSERT ERROR:'+e.message);});
				  self.postMessage('DATABASE SAVE SUCCESS..');
			  }else{
				  self.postMessage('DATABASE NOT SAVED..');
			  }
		  }else{
			  if(type == 'insert'){
				  self.postMessage('DATABASE SAVED..');
			  }else{
				  tx.executeSql("DELETE FROM okboard where seq = ? "
							,[seq]
							,self.postMessage('DELETE SUCCESS..')
							,function(e){self.postMessage('DELETE ERROR:'+e.message);});
			  }
		  }
	  },function(e){self.postMessage('SELECT TABLE ERROR:'+e.message);});
  });
}, false);


