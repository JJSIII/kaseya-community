tinyMCEPopup.requireLangPack();

var SmiliesDialog = {
	init : function(ed) {
		var container = document.getElementById('SmileyContainer');	
		if (container)
		{
			var table = document.createElement('table');
			table.cellPadding = '0';
			table.cellSpacing = '0';
			table.border = '0';
			table.appendChild(document.createElement('tbody'));
			container.appendChild(table);
		
			var row = document.createElement('tr');
		
			var smilies = tinyMCEPopup.getWindowArg('smilies', new Array());
			for (var i = 0; i < smilies.length; i++)
			{
				if (i != 0 && i % 10 == 0)
				{
					table.childNodes[0].appendChild(row);
					row = document.createElement('tr');
				}
			
				var cell = document.createElement('td');
				cell.style.padding = '2px';
				
				var a = document.createElement('a');
				a.href = 'javascript:SmiliesDialog.insert(\'' + smilies[i][1].replace(/'/g, "\\'") + '\');';
				a.title = smilies[i][0] + ' - ' + smilies[i][1];
			
				var s = document.createElement('img');
				s.width = '19';
				s.height = '19';
				s.src = smilies[i][2];
				s.border = '0';
				
				a.appendChild(s);
				
				cell.appendChild(a);	
				row.appendChild(cell);
			}
			
			table.childNodes[0].appendChild(row);
		}
	},

	insert : function(code) {
		tinyMCEPopup.execCommand('mceInsertContent', false, code);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(SmiliesDialog.init, SmiliesDialog);
