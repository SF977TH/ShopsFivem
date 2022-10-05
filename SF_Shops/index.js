ShopItems = null;
var rgb = null;
var manageShopsignal = null;
var config = null;
var lastType = null;

window.addEventListener('message', function(event) {
 
    switch(event.data.action) {
	 case "init":
	 initShop(event.data.shop, event.data.type, event.data.user);
	 $(".main").css("display", "block");
	 break;
	 case "update":
  //  if(lastType != null){
  //   event.data.type = lastType;
  //   lastType = null;
  //  }
	 initShop(event.data.shop, event.data.type, event.data.user);
	 break;
	 case "notify":
	 MiniNotify(event.data.data);
	 break;
	 case "acsess":
   initAcsess(event.data.data, event.data.shop, event.data.user)
	 break;
   case "config":
   config = event.data.config;
	 break;
	  
	}
});


initAcsess = (data, shop, user)  => {
	$(".buyShopbtn").prop('disabled', false);
	$(".buyShopbtn").data('id', shop.id);
	$(".buyShop").css("display", "none");
	switch(data) {
		case "manage":
			$(".manageShop").css("display", "block");
      manageShop(shop, user);
		break;
		case "buy":
            $(".buyShopbtn").html(`<i class="fad fa-store"></i> Buy Shop ${shop.shop_transfer_fee}$`);
		    $(".buyShop").css("display", "block");
		break;
		case false:
		    if(parseInt(shop.shop_transfer_fee) == 0) {
			   $(".buyShopbtn").prop('disabled', true); 
			   $(".buyShopbtn").html(`<i class="fad fa-exchange-alt"></i> Untransferable locked by owner.`);
			} else {
			   $(".buyShopbtn").html(`<i class="fad fa-exchange-alt"></i> Transfer ${shop.shop_transfer_fee}$`);
			}
			$(".buyShop").css("display", "block");
		break;
		

	}
}



manageShop = (shop, user) => {
  manageShopsignal = shop.id;
	$(".updatebtn").data("id", shop.id);

  $("#shopname").val(shop.shop);
	$("#shop_transfer_fee").val(shop.shop_transfer_fee);
	$("#marker").val(shop.marker);
	$("#markerY").val(shop.markerY);
 
	$("#lock").prop('checked', shop.lock); 
	$("#enableShopList").prop('checked', shop.enableShopList); 
    
	$("#vaultcash").html(shop.money_earned+"$");

	$("#vax").data("earn", shop.money_earned);

	rgb = shop.markerColor;

  $("#bankacc").html(user.bank+"$");

	$(".renk").css("background", `rgb(${shop.markerColor.r} ${shop.markerColor.g} ${shop.markerColor.b}  )`);
 
  $("#category").html("");
  $.each(config.ShopCategory, function (i, v) { 
    $("#category").append(`
    <option value="${v.name}">${v.label}</option>
    `);
  });

  $("#solditems").html("");
  $.each(config.items_sold, function (i, v) { 
 
    $("#solditems").append(`
    <option value="${v.name}">${v.label}</option>
    `);
  });
  
  $(".shopinvlist").html("");
  $.each(shop.items.reverse(), function (i, v) { 
      e = `
      <div class="itemkutu">
        <img src="${config.ImgSource}${v.item}.png" />
        <p>${v.item}</p>
        Buy:  <input type="number" class="g"  id="buy_${v.item}" value="${v.price.buy}" min="1"  />
        Sell: <input type="number" class="g"  id="sell_${v.item}"  value="${v.price.sell}" min="1" />
        <button class="btnbtn red" data-item="${v.item}" id="deleteitem" ><i class="fad fa-trash"></i></button>
        <button class="btnbtn" data-item="${v.item}" id="syncitem" ><i class="fad fa-sync"></i></button>
       </div>
      `;
      $(".shopinvlist").append(e);
  });

  refreshInputs();
}

$(document).on('click', '#syncitem', function(e){
  var el = $(this);
  var id = $(".updatebtn").data("id");
  var item = el.data("item");
  el.children("i").addClass("fa-spin");
  var buyprice = $("#buy_"+item).val();
  var sellprice = $("#sell_"+item).val();
  $.post("https://s4-shops/updateShopItem", JSON.stringify({ id:id, item:item, sellprice: sellprice, buyprice:buyprice }), function (data) { });
  setTimeout(function(){  el.children("i").removeClass("fa-spin"); }, 2000);
});

$(document).on('click', '#selectitem', function(e){
  var id = $(".updatebtn").data("id");
  var sellprice = $("#sellprice").val();
  var buyprice = $("#buyprice").val();
  var category = $("#category").val();
  var solditems = $("#solditems").val();

  $.post("https://s4-shops/addShopItem", JSON.stringify({ id:id, sellprice: sellprice, buyprice:buyprice,category:category,solditems:solditems   }), function (data) { });
 
  $("#sellprice").val("");
  $("#buyprice").val("");
 
  
  if($('#sellprice').val().length > 0 && $('#buyprice').val().length > 0) {
    $("#selectitem").css("display", "unset");
   }else{
    $("#selectitem").css("display", "none");
   }
});

$(document).on('click', '#deleteitem', function(e){
   var item = $(this).data("item");
   var id = $(".updatebtn").data("id");
   $.post("https://s4-shops/removeShopItem", JSON.stringify({ id: id, item: item }), function (data) { });
});

 
$(document).on('click', '#addbalancefrombank', function(e){
    var val = $(".bankval").val();
    var id = $(".updatebtn").data("id");
    var el = $(this);
    var last = el.html();
    el.prop('disabled', true);
    el.html(`<i class="fas fa-circle-notch fa-spin"></i>`);
    setTimeout(function(){ el.html(last); el.prop('disabled', false); }, 2000);
    
    $.post("https://s4-shops/addShopMoney", JSON.stringify({ id: id, type: "money_earned", value: val  }), function (data) {
        
    });


});
 
refreshInputs();
function refreshInputs() {  
  $('.g').keypress(function (e) {
    var txt = String.fromCharCode(e.which);
    if (!txt.match(/[0-9]/)) {
        return false;
    }
 });
}
 
$('#buyprice').keypress(function (e) {
  if($('#sellprice').val().length > 0) {
    $("#selectitem").css("display", "unset");
   }else{
    $("#selectitem").css("display", "none");
   }

  var txt = String.fromCharCode(e.which);
  if (!txt.match(/[0-9]/)) {
      return false;
  }
});

$('#sellprice').keypress(function (e) {
  if($(this).val().length > 0 && $('#buyprice').val().length > 0) {
    $("#selectitem").css("display", "unset");
   }else{
    $("#selectitem").css("display", "none");
   }

  var txt = String.fromCharCode(e.which);
  if (!txt.match(/[0-9]/)) {
      return false;
  }
});




$(document).on('click', '#removebalancefrombank', function(e){
  var val = $(".shopval").val();
  var id = $(".updatebtn").data("id");
  
  var el = $(this);
  var last = el.html();
  el.prop('disabled', true);
  el.html(`<i class="fas fa-circle-notch fa-spin"></i>`);
  setTimeout(function(){ el.html(last); el.prop('disabled', false); }, 2000);
  
  $.post("https://s4-shops/removeShopMoney", JSON.stringify({ id: id, type: "money_earned", value: val  }), function (data) {
      
  });




});

$(document).on('click', '.updatebtn', function(e){
	var el = $(this);
	el.html(`<i class="fas fa-circle-notch fa-spin"></i>`);
 
	$.post("https://s4-shops/updateShop", JSON.stringify({
		
id: el.data("id"), markerColor: rgb, shop: $("#shopname").val(),    
    shop_transfer_fee: parseInt($("#shop_transfer_fee").val()), marker: parseInt($("#marker").val()),
	markerY: parseFloat($("#markerY").val()), lock: $("#lock").prop('checked'), 
	enableShopList: $("#enableShopList").prop('checked')
    }), function (data) {
			
    });

    setTimeout(function () { el.html(`<i class="fad fa-pen-square"></i> Update Shop`); }, 1000)
 
});



  $(document).on('click', '.buyShopbtn', function(e){
	  var id = $(this).data("id");
      $.post("https://s4-shops/buyShop", JSON.stringify({ id: id }), function (data) {
			  
	  });
  });

  $(document).on('click', '.btn', function(e){
	el = $(this);
	$(".btn").removeClass("active");
	if(!$(el).hasClass("active")) {
		$(el).addClass("active");
	}
  lastType = $(this).data("type");
	loadItems(ShopItems, $(this).data("type"));
  });

  $(document).on('click', '.tm', function(e){
	el = $(this);
	$(".tm").removeClass("akt");
	if(!$(el).hasClass("akt")) {
		$(el).addClass("akt");
	}

	$.post("https://s4-shops/updateShop", JSON.stringify({
		
id: manageShopsignal, theme: parseInt(el.data("theme")) }), function (data) {
			
    });

  });


  $(document).on('click', '.changethemebtn', function(e){
    $(".themeselector").fadeIn();
  });
  $(document).on('click', '.shopv', function(e){
    $(".shopvault").fadeIn();
    
  });

  $(document).on('click', '.backbtn', function(e){
    $(".themeselector").fadeOut();
	  $(".shopvault").fadeOut();
    $(".itemselector").fadeOut();
  });

updateShop = (user) => {
	var moneyFormatter  = new Intl.NumberFormat(); 
	$("#wallet").html(user.cash+" $");
	$("#bank").html(moneyFormatter.format(user.bank)+" $");
}

initShop = (shop, type, user) => {
	
  $("#cats").html("");
	$.each(shop.coords, function (i, v) { 
 
		if(v.type != "manage") {
		active = '';
 
		if(shop.enableShopList == true) {
			if(type == "mainshop")	 {
          if(lastType == null) {
            if(i == 1){ active = ' active';  }	
          }else {
            if(v.type == lastType) {  active = ' active'; }
          }
				  e = `
				  <button class="btn${active}" data-type='${v.type}' > 
					  <table>
						  <tr>
							<td class="b"><i class="${v.icon}"></i>  </td> 
							<td class="i">${v.label}</td>
						  </tr>
						</table>
					 </button>
				  `;
				  $("#cats").append(e);
			  }else if(v.type == type){
			  
			  active = ' active'; 
			  e = `
			  <button class="btn${active}" data-type='${v.type}' > 
				  <table>
					  <tr>
						<td class="b"><i class="${v.icon}"></i>  </td> 
						<td class="i">${v.label}</td>
					  </tr>
					</table>
				 </button>
			  `;
			  $("#cats").append(e);
			  }
		}else {
      lastType = null;
			if(v.type == type){
			  
				active = ' active'; 
				e = `
				<button class="btn${active}" data-type='${v.type}'> 
					<table>
						<tr>
						  <td class="b"><i class="${v.icon}"></i>  </td> 
						  <td class="i">${v.label}</td>
						</tr>
					  </table>
				   </button>
				`;
				$("#cats").append(e);
			}
		}
		
		
	   } 

	});

 var moneyFormatter  = new Intl.NumberFormat(); 
   
	$("#name").html(shop.shop);
	$("#wallet").html(user.cash+" $");
	$("#bank").html(moneyFormatter.format(user.bank)+" $");
	
  loadItems(shop.items, type);
  
  $(".theme").html("");
	if(shop.theme) { SetTheme(shop.theme); }

	ShopItems = shop.items;
}



function loadItems(items, type) {
   $(".right").html("");
   if(lastType == null){
     type=type;
   }else {
     type=lastType;
   }

   $.each(items, function (i, v) { 
	 
	switch(type) {
		case v.type:
			disabled = '';
			buy = `<i class="fad fa-shopping-cart"></i> Buy`;
			if(v.stock == 0) {
				disabled = 'disabled';
				buy = `<i class="fad fa-box-open"></i> Sold out`;
			}
	  
			e = `
			<div class="item">
			<span>${v.stock}</span>
			<p>${v.label}</p>
			<img src="//qb-inventory/html/images/${v.item}.png" />
			<h3>${v.price.sell} $</h3>
			<button class="buy" data-item="${v.item}" ${disabled}>${buy}</button>
			</div> 
		   
			`;
	  
			$(".right").append(e);
		break;
		case "mainshop":
			disabled = '';
			buy = `<i class="fad fa-shopping-cart"></i> Buy`;
			if(v.stock == 0) {
				disabled = 'disabled';
				buy = `<i class="fad fa-box-open"></i> Sold out`;
			}
	  
			e = `
			<div class="item">
			<span>${v.stock}</span>
			<p>${v.label}</p>
			<img src="//qb-inventory/html/images/${v.item}.png" />
			<h3>${v.price.sell} $</h3>
			<button class="buy" data-item="${v.item}" ${disabled}>${buy}</button>
			</div> 
		   
			`;
	  
			$(".right").append(e);
		break;
		case "manage":
			$(".right").html(`
			
			<div class="ybox"></div>
			
			<div class="ybox" style="margin-top:0px;"></div>
			`);
        break;
		case "itemsales":
			 
			sell = `<i class="fad fa-money-bill"></i> Sell`;
			e = `
			<div class="item">
			<span>${v.stock}</span>
			<p>${v.label}</p>
			<img src="//qb-inventory/html/images/${v.item}.png" />
			<h3>${v.price.buy} $</h3>
			 <button class="sell sol" data-item="${v.item}" data-pay="cash" ><i class="fad fa-money-bill"></i></button>
			 <button class="sell sag"  data-item="${v.item}" data-pay="bank" ><i class="fad fa-credit-card"></i></button>
 
			
			</div> 
		   
			`;
	  
			$(".right").append(e);
		break;	
	}
  });
}


$(document).on('click', '.buy', function(e){
	el = $(this);
	$.post("https://s4-shops/buy", JSON.stringify({ item: el.data('item')  }), function (data) {
	  if(data != false) {
			SenNotify(data);
		}
	});
});

$(document).on('click', '.sell', function(e){
	el = $(this);
	$.post("https://s4-shops/sell", JSON.stringify({ item: el.data('item'), pay: el.data('pay') }), function (data) {
	    if(data != false) {
			SenNotify(data);
		}
	});
});

function format(n) {
	return n.toFixed(2).replace('.', ',').replace(/\d{3}(?=(\d{3})*,)/g, function(s) {
	  return '.' + s
	})
  }



$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: 
		    if(manageShopsignal) {
		      
			   $.post("https://s4-shops/updateSignal", JSON.stringify({ id: manageShopsignal  }), function (data) {
				 
			   });
			   manageShopsignal = null;
			}
		    $(".manageShop").css("display", "none");
		    $(".buyShop").css("display", "none");
		    $(".main").css("display", "none");
            $.post("https://s4-shops/close");
        break;
    }
});

var nowNotif = false;
SenNotify = (data) => {


$(".notifManager").html(`
   <div class="item">
    <p>${data.label}</p>
    <img src="//qb-inventory/html/images/${data.item}.png" />
    <h3>${data.price.sell} $</h3>
    <button><i class="fad fa-shopping-cart"></i> Buyed</button>
   </div>
`);

if(nowNotif == false) {
  
	nowNotif = true;
$(".notifManager").css({'display':'block'}).animate({
        bottom: 130+"%",
}, 1000);

setTimeout(function() { 
 
	$(".notifManager").css({'display':'none'}).animate({
        bottom: -30+"%",
    }, 1);
	nowNotif = false;
}, 3500);

}

}

var notifOut = null;

MiniNotify = (data) => {

   if(!notifOut){
    $(".mininotify").html(`
	<div class="notif">
       <i class="${data.icon}"></i> <span>${data.text}</span>
    </div>
	`);
	$(".mininotify").css({'display':'block'}).animate({
        top: 3+"%",
    }, 1000);
 
	$(".mininotify").css({'display':'block'}).animate({
        top: -5+"%",
    }, 1000);

	notifOut = setTimeout(function(){  
	$(".mininotify").css({'display':'none'});
	clearInterval(notifOut);
	notifOut = null;
    }, 2000);
   }
}

// MiniNotify({ icon: "fad fa-bell-on", text: "selam" });

SetTheme = (id) => {
    $(".theme").html("");
	switch(id) {
		case 1: 
		theme = `
	
		<style>
		.header {
			width: -webkit-fill-available;
			height: 10%;
			position: relative;
			background: #1861ff;
			border-top-left-radius: 30px;
			border-top-right-radius: 30px;
		}
		
		.market {
			width: -webkit-fill-available;
			height: 90%;
			background: #dadada;
			border-bottom-left-radius: 30px;
			border-bottom-right-radius: 30px;
			position: relative;
			padding-top: 15px;
			padding-left: 35px;
		}
		
		.market .right {
			width: 78%;
			height: 95%;
			background: #fafafa;
			border-radius: 25px;
			float: left;
			margin-left: 15px;
		}
		
		.item {
			width: 200px;
			height: 250px;
			background: #dedede;
			border-radius: 15px;
			margin: 15px;
			text-align: center;
			position: relative;
			padding-top: 5px;
			float: left;
		}
		
		.item p, .item h3 {
			color: #1861ff;
			font-family: 'mainfont';
		}
		
		  </style>
		`;
		break;
		case 2: 
        theme = `
		<style>
  .header {
    width: -webkit-fill-available;
    height: 10%;
    position: relative;
    background: #cb2c32;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
  }
  
  .market {
    width: -webkit-fill-available;
    height: 90%;
    background: #dadada;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    position: relative;
    padding-top: 15px;
    padding-left: 35px;
  }
  
  .market .right {
    width: 78%;
    height: 95%;
    background: #fafafa;
    border-radius: 25px;
    float: left;
    margin-left: 15px;
  }
  
  .item {
    width: 200px;
    height: 250px;
    background: #dedede;
    border-radius: 15px;
    margin: 15px;
    text-align: center;
    position: relative;
    padding-top: 5px;
    float: left;
  }
  
  .item p, .item h3 {
    color: #cb2c32;
    font-family: 'mainfont';
  }

  .item button {
    background: #cb2c32;
    color: white;
  }
  .item button:hover {
    background: white;
    color: #cb2c32;
  }

  .item span { 

    background: #cb2c32;
    color: white;
    box-shadow: 0px 0px 9px 1px #cb2c32;
  }

  .active {
    background: #cb2c32!important;
  }

  
    </style>
	     `;
		break;
		case 3:
		theme = `
		<style>
  .header {
    width: -webkit-fill-available;
    height: 10%;
    position: relative;
    background: #cb2c32;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
  }
  
  .market {
    width: -webkit-fill-available;
    height: 90%;
     border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    position: relative;
    padding-top: 15px;
    padding-left: 35px;
  }
  
  .market .right {
    width: 78%;
    height: 95%;
     border-radius: 25px;
    float: left;
    margin-left: 15px;
  }
  
  .item {
    width: 200px;
    height: 250px;
     border-radius: 15px;
    margin: 15px;
    text-align: center;
    position: relative;
    padding-top: 5px;
    float: left;
  }
  
  .item p, .item h3 {
    color: #cb2c32;
    font-family: 'mainfont';
  }

  .item button {
    background: #cb2c32;
    color: white;
  }
  .item button:hover {
    background: white;
    color: #cb2c32;
  }

  .item span { 

    background: #cb2c32;
    color: white;
    box-shadow: 0px 0px 9px 1px #cb2c32;
  }

  .active {
    background: #cb2c32!important;
  }

  
    </style>
	`;
		break;
		case 4:
		theme = `
		<style>
  .header {
    width: -webkit-fill-available;
    height: 10%;
    position: relative;
    background: #000000;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
  }
  
  .market {
    width: -webkit-fill-available;
    height: 90%;
    background: #dadada;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    position: relative;
    padding-top: 15px;
    padding-left: 35px;
  }
  
  .market .right {
    width: 78%;
    height: 95%;
    background: #fafafa;
    border-radius: 25px;
    float: left;
    margin-left: 15px;
  }
  
  .item {
    width: 200px;
    height: 250px;
    background: #dedede;
    border-radius: 15px;
    margin: 15px;
    text-align: center;
    position: relative;
    padding-top: 5px;
    float: left;
  }
  
  .item p, .item h3 {
    color: #000000;
    font-family: 'mainfont';
  }

  .item button {
    background: #000000;
    color: white;
  }
  .item button:hover {
    background: white;
    color: #000000;;
  }

  .item span { 

    background: #000000;
    color: white;
    box-shadow: 0px 0px 9px 1px #000000;
  }

  .active {
    background: #000000!important;
  }

  
    </style>
		`;
	    break;
		case 5:
	    theme = `
		<style>
  .header {
    width: -webkit-fill-available;
    height: 10%;
    position: relative;
    background: #000000;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
  }
  
  .market {
    width: -webkit-fill-available;
    height: 90%;
    background: #1b1b1b;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
    position: relative;
    padding-top: 15px;
    padding-left: 35px;
  }
  
  .market .right {
    width: 78%;
    height: 95%;
    background: #131313;
    border-radius: 25px;
    float: left;
    margin-left: 15px;
  }
  
  .item {
    width: 200px;
    height: 250px;
    background: #030303;
    border-radius: 15px;
    margin: 15px;
    text-align: center;
    position: relative;
    padding-top: 5px;
    float: left;
  }
  
  .item p, .item h3 {
    color: #ffffff;
    font-family: 'mainfont';
  }

  .item button {
    background: #000000;
    color: white;
  }
  .item button:hover {
    background: white;
    color: #000000;;
  }

  .item span { 

    background: #000000;
    color: white;
    box-shadow: 0px 0px 9px 1px #000000;
  }

  .active {
    background: #000000!important;
  }

  
    </style>
		`;
        break;
	}
 
	$(".theme").html(theme);
}


var RGBvalues = (function() {

    var _hex2dec = function(v) {
        return parseInt(v, 16)
    };

    var _splitHEX = function(hex) {
        var c;
        if (hex.length === 4) {
            c = (hex.replace('#','')).split('');
            return {
                r: _hex2dec((c[0] + c[0])),
                g: _hex2dec((c[1] + c[1])),
                b: _hex2dec((c[2] + c[2]))
            };
        } else {
             return {
                r: _hex2dec(hex.slice(1,3)),
                g: _hex2dec(hex.slice(3,5)),
                b: _hex2dec(hex.slice(5))
            };
        }
    };

    var _splitRGB = function(rgb) {
        var c = (rgb.slice(rgb.indexOf('(')+1, rgb.indexOf(')'))).split(',');
        var flag = false, obj;
        c = c.map(function(n,i) {
            return (i !== 3) ? parseInt(n, 10) : flag = true, parseFloat(n);
        });
        obj = {
            r: c[0],
            g: c[1],
            b: c[2]
        };
        if (flag) obj.a = c[3];
        return obj;
    };

    var color = function(col) {
        var slc = col.slice(0,1);
        if (slc === '#') {
            return _splitHEX(col);
        } else if (slc.toLowerCase() === 'r') {
            return _splitRGB(col);
        } else {
            console.log('!Ooops! RGBvalues.color('+col+') : HEX, RGB, or RGBa strings only');
        }
    };

    return {
        color: color
    };
}());

 
$(document).on('click', '.renk', function(e){
	if($(".colorpicker").css("display") == "none") {
	   $(".colorpicker").css("display", "block");
	}else {
	   $(".colorpicker").css("display", "none");
	}
});



$(document).ready(function() {
    $('.colorpicker').minimalColorpicker({
        color: '#4513e9',
        onUpdateColor: function(e, color) {
		   $(".renk").css("background", "#"+color.hex)
		   rgb = color.rgb;
         }
    });
});




jQuery.fn.minimalColorpicker = function(options) {

    var defaults = {
        color: '#000000'
    };

    var settings = $.extend({}, defaults, options);

    return this.each(function() {
        var self = $(this);
        var hue = $('<div />').addClass('hue');
        var hueDrag = $('<div />').addClass('drag');
        var field = $('<div />').addClass('field');
        var fieldOverlay = $('<div />').addClass('fieldOverlay');
        var fieldDrag = $('<div />').addClass('drag');
        var input = $('<input />').val('#ffffff');
        var rgbList = $('<ul />');
        rgbList.append($('<li />').html('<strong>255</strong>R'));
        rgbList.append($('<li />').html('<strong>255</strong>G'));
        rgbList.append($('<li />').html('<strong>255</strong>B'));

        if(tinycolor(settings.color).isValid()) {
            self.color = tinycolor(settings.color).toHsl();
        }

        if(tinycolor(self.data('color')).isValid()) {
            self.color = tinycolor(self.data('color')).toHsl();
        }

        hue.append(hueDrag);
        self.append(hue);
        fieldOverlay.append(fieldDrag);
        field.append(fieldOverlay);
        self.append(field);
 
        self.hue = hue.get(0);
        self.hue.drag = hueDrag.get(0);

        self.fieldBase = field.get(0);
        self.field = fieldOverlay.get(0);
        self.field.drag = fieldDrag.get(0);

        self.updateHue = function(e) {
            self.setHue(e.offsetY / hue.outerHeight() * 360);
            if(self.hue.onmousemove === null) {
                self.hue.onmousemove = function(e) {
                    if(e.target === self.hue) {
                        self.setHue(e.offsetY / hue.outerHeight() * 360);
                        e.stopPropagation();
                    }
                }
            }
            self.clearMousemove('hue');
        }

        self.updateColor = function(e) {
            self.setColorPos(e.offsetX, e.offsetY);
            if(self.field.onmousemove === null) {
                self.field.onmousemove = function(e) {
                    if(e.target === self.field) {
                        self.setColorPos(e.offsetX, e.offsetY);
                        e.stopPropagation();
                    }
                }
            }
            self.clearMousemove('field');
        }

        self.setColorPos = function(x, y) {
            self.field.drag.style.setProperty('--x', x);
            self.field.drag.style.setProperty('--y', y);
            self.color = tinycolor({
                h: self.color.h,
                s: ((x / (field.outerWidth() - 1)) * 100),
                v: ((1 - y / (field.outerHeight() - 1)) * 100)
            }).toHsl();
            self.setColor();
        }

        self.setHue = function(a) {
            self.color.h = a;
            self.setColor();
        }

        self.setColor = function(e) {
            var c = tinycolor(self.color);
            chsv = c.toHsv();
            c = c.toHslString();
            self.field.drag.style.setProperty('--x', Math.round((chsv.s) * (field.outerWidth() - 1)) + 'px');
            self.field.drag.style.setProperty('--y', Math.round((1 - chsv.v) * (field.outerHeight())) + 'px');
            self.hue.drag.style.setProperty('--y', self.color.h / 360 * hue.outerHeight() + 'px');
            self.fieldBase.style.setProperty('--backgroundHue', self.color.h);
            if(options.onUpdateColor !== undefined) {
                options.onUpdateColor(e, {
                    hex: tinycolor(self.color).toHex(),
                    rgb: tinycolor(self.color).toRgb(),
                    rgbString: tinycolor(self.color).toRgbString()
                });
            }
            self.setOutput();
        }

        self.setOutput = function(e) {
            input.val('#' + tinycolor(self.color).toHex());
            rgbList.find('li:nth-child(1) strong').text(tinycolor(self.color).toRgb().r);
            rgbList.find('li:nth-child(2) strong').text(tinycolor(self.color).toRgb().g);
            rgbList.find('li:nth-child(3) strong').text(tinycolor(self.color).toRgb().b);
        }

        self.updateOutput = function(e) {
            if(input.val().length == 7 && tinycolor(input.val()).isValid()) {
                var c = tinycolor(input.val());
                self.color = c.toHsl();
                self.setColorPos(Math.round((c.toHsv().s) * (field.outerWidth() - 1)), Math.round((1 - c.toHsv().v) * (field.outerHeight())));
                self.setColor();
                self.setOutput();
            }
        }

        self.clearMousemove = function(m) {
            if(document.onmouseup === null) {
                document.onmouseup = function(e) {
                    self[m].onmousemove = null;
                    document.onmouseup = null;
                }
            }
        }

        //input.on('change keyup', self.updateOutput);
        field.on('mousedown', self.updateColor);
        hue.on('mousedown', self.updateHue);

        self.setColor();
        self.setHue(self.color.h);
        self.setOutput();

    });

}

