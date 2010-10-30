var mainPanel;

Ext.setup({
    onReady: function() {
        
        var card1 = {
            title:	"Card1",
        	html:	"Card1",
        	cls: 	"card1"
        };
        
        var card2 = {
            title:	"Card2",
        	html:	"Card2",
        	cls: 	"card2"
        };
        
        var card3 = {
           	html: 	"Card3",
           	title:	"Card3",
           	cls:	"card3"
        };
        
        var cardMap = {
           	title:	"Card3",
           	cls:	"card3",
           	xtype:	"map"
        };
        
        var list1 = {
           	html: 	"<div onClick='mainPanel.setCard(0);'>HTML5</div>",
           	title:	"List1", height: 50
           	//xtype: "button"
        };
        
        var list2 = {
           	html: 	"<div onClick='mainPanel.setCard(1);'>JSP Tip</div>",
           	title:	"List2", height: 50
           	//xtype: "button"
        };
        
        var list3 = {
           	html: 	"<div onClick='mainPanel.setCard(2);'>JSP Q/A</div>",
           	title:	"List3", height: 50
           	//xtype: "button"
        };
        
        var listMap = {
           	html: 	"<div onClick='mainPanel.setCard(3);'>Map</div>",
           	title:	"List3", height: 50,
           	xtype: "button"
        };

        mainPanel = new Ext.Carousel({
            fullscreen: true,
            layout: 	'card',
            animation:	{type: 'fade', duration: 1000},
            items: 		[card1, card2, card3, cardMap],
            dockedItems: [{
            	html: "<img src='http://www.okjsp.pe.kr/images/okjsp.gif' height=15> Welcome OKJSP",
            	xtype:	"toolbar",
            	style: "text-align: center;color: white;",
            	dock: "top",
            	height:	25
            },{
            	html: "Left Docked Item",
                scroll: 'vertical',
            	style: "background-color: #DDDDDD; text-align: left;",
            	items: [list1, list2, list3, listMap, list1, list2, list3, list1, list2, list3],
            	dock: "left"
            }]
        });
    }
});



/*
TabPanel
var mainPanel;

Ext.setup({
    onReady: function() {
        
        var card1 = {
        	html:	"Top Menu",
        	title:	"Top",
        	cls: 	"card1"
        };
        
        var card2 = {
           	html: 	"Left Menu",
           	title:	"Left",
           	cls:	"card2"
        };
        
        var card3 = {
           	html: 	"Main Menu",
           	title:	"Main",
           	cls:	"card3"
        };

        mainPanel = new Ext.TabPanel({	//Carousel
            fullscreen: true,
            layout: 	'card',
            animation:	{type: 'fade', duration: 500},	// 'fade', 'slide', 'flip', 'cube', 'pop', 'wipe'
            // direction:	'vertical',
            items: 		[card1, card2, card3]
        });
    }
});
 */


/*
var mainPanel;

Ext.setup({
    onReady: function() {
        
        var card1 = {
        	html:	"Top Menu",
        	title:	"Top",
        	cls: 	"card1"
        };
        
        var card2 = {
           	html: 	"Left Menu",
           	title:	"Left",
           	cls:	"card2"
        };
        
        var card3 = {
           	html: 	"Main Menu",
           	title:	"Main",
           	cls:	"card3"
        };

        mainPanel = new Ext.Carousel({
            fullscreen: true,
            layout: 	'card',
            animation:	{type: 'fade', duration: 1000},
            items: 		[card1, card2, card3]
        });
    }
});
 */



/* 
Panel
var mainPanel;

Ext.setup({
    onReady: function() {
        
        var card1 = new Ext.Component ({
            title:	"Top",
        	//html:	"Top Menu",
        	//cls: 	"card1"
            tpl: ['<div><h1>Hello</h1><p> Top Menu Here!! </p></div>']
        });
        
        var card2 = {
           	html: 	"Left Menu",
           	title:	"Left",
           	cls:	"card2",
           	dock:	"left"
        };
        
        var card3 = {
           	html: 	"Main Menu",
           	title:	"Main",
           	cls:	"card3"
        };

        mainPanel = new Ext.Panel({
            fullscreen: true,
            layout: 	'card',
            animation:	{type: 'fade', duration: 1000},
            items: 		[card1, card2, card3],
            dockedItems: [{
            	html: "Welcome Docked Item",
            	style: "background-color: #999999; text-align: center;",
            	dock: "top",
            	height:	30
            },{
            	html: "Welcome Docked Item",
            	style: "background-color: #DDDDDD; text-align: left;",
            	dock: "left"
            }]
        });
    }
});
color = A0D0A0 , AADDAA

*/