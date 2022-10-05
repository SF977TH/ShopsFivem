Config = {}
Config.OpenKey = 38
Config.Currency = "$" 
Config.ImgSource = "//qb-inventory/html/images/"


Config.ShopUpdateInterval = 900000  --- recomended 
Config.ShopSaveInterval = 900000  --- recomended 
Config.PayAccount = 'bank'
Config.PayItem = 'cash'

Config.GetFromServer = true -- bank & cash

Config.SaveAfterTransaction = true 

Config.items_sold = {  
  { name = "water", label = "Water"  },
  { name = "bread", label = "Bread"  },
  { name = "beer", label = "Beer"  },
  { name = "cola", label = "Cola"  },
  { name = "sosisli", label = "Hotdog"  },
  { name = "pizzakucuk", label = "Pizza Kucuk"  },
  { name = "atom", label = "Atom"  },
  { name = "phone", label = "Telefon"  },
  { name = "wallet", label = "Cuzdan"  },
  { name = "bankcard", label = "Banka Karti"  },
  { name = "sigarapaketi", label = "Sigara"  },
  { name = "lighter", label = "Cakmak"  },
  { name = "acetone", label = "Acetone"  },
} -- items that can be sold

Config.ShopCategory = {
  
  { name = "drinks", label = "Drinks"  },
  { name = "fruits", label = "Fruits"  },
  { name = "alcohols", label = "Alcohols"  },
  { name = "staplefoods", label = "Staple Foods"  },
  { name = "junkfoods", label = "Junk Foods"  },
  { name = "chemicals", label = "Chemicals"  }

}

l = Lang[Lang.Current]
  
Config.Shops = {

    { 
      id = 1, -- id it must be unique
      enableShopList = false,
      shop = "Market",
      coords = {
        { coord = vector3(-3249.8205566406, 1005.0204467773, 12.830714225769), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(-3243.5571289063, 1001.684753418, 12.830717086792), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(-3244.1948242188, 1002.9345703125, 12.830717086792), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(-3241.400390625, 1002.1015014648, 12.830717086792), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(-3242.1213378906, 1009.2459716797, 12.830715179443), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(-3244.1396484375, 1005.3997802734, 12.830713272095), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(-3241.9743652344, 1006.4345092773, 12.830716133118), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(-3246.5017089844, 1004.954284668, 12.830718994141), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(-3249.4067382813, 1001.6736450195, 12.830704689026), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 2, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(-3047.8798828125, 586.26348876953, 7.9089331626892), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(-3040.6545410156, 585.68566894531, 7.9089345932007), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(-3041.9597167969, 586.54913330078, 7.908935546875), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(-3038.8552246094, 586.86090087891, 7.9089345932007), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(-3042.2915039063, 592.99572753906, 7.9089336395264), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(-3042.7038574219, 588.76422119141, 7.9089345932007), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(-3041.1791992188, 590.70220947266, 7.9089345932007), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(-3042.2915039063, 592.99572753906, 7.9089336395264), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(-3046.2993164063, 583.93981933594, 7.9089288711548), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 3, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(28.784725189209, -1339.3072509766, 29.49702835083), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(26.073572158813, -1346.4768066406, 29.497026443481), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(27.444282531738, -1345.1123046875, 29.497026443481), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(26.460033416748, -1348.3395996094, 29.497026443481), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(33.703678131104, -1346.4768066406, 29.497026443481), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(32.315143585205, -1343.0914306641, 29.497026443481), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(28.858953475952, -1344.9411621094, 29.497026443481), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(28.954677581787, -1342.6644287109, 29.497026443481), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(24.961898803711, -1342.4981689453, 29.497026443481), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 4, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(-46.610809326172, -1758.5356445313, 29.421014785767), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(-48.191844940186, -1757.6519775391, 29.421012878418), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(-54.310962677002, -1748.3107910156, 29.421012878418), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(-55.150241851807, -1753.4071044922, 29.421012878418), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(-55.736267089844, -1750.7918701172, 29.42099571228), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(-50.169200897217, -1749.9233398438, 29.420999526978), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(-50.14266204834, -1753.3759765625, 29.420999526978), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(-52.17456817627, -1753.7672119141, 29.420999526978), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(-43.235572814941, -1754.2332763672, 29.451953887939), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },

    { 
      id = 5, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(-1486.4830322266, -377.68408203125, 40.163394927979), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(-1487.2694091797, -379.06573486328, 40.163436889648), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(-1485.1228027344, -381.55508422852, 40.163429260254), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(-1491.4145507813, -380.5182800293, 40.163425445557), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(-1486.361328125, -382.77322387695, 40.163425445557), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(-1488.6580810547, -380.22790527344, 40.163429260254), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(-1489.7595214844, -379.35098266602, 40.163425445557), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(-1488.5888671875, -382.6057434082, 40.163433074951), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(-1482.9591064453, -379.55514526367, 40.163433074951), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 6, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(-708.20617675781, -905.98846435547, 19.215589523315), type = 'manage', label = l.manage, icon = '' }, 
        { coord = vector3(-707.37298583984, -913.60034179688, 19.215587615967), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(-718.11047363281, -910.15893554688, 19.215587615967), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  }, 
        { coord = vector3(-715.03314208984, -915.64367675781, 19.215587615967), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(-718.18707275391, -912.91296386719, 19.215587615967), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  }, 
        { coord = vector3(-714.34020996094, -909.09802246094, 19.215587615967), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(-708.42956542969, -915.60949707031, 19.215612411499), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(-710.05438232422, -911.7109375, 19.215612411499), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(-705.74450683594, -907.79718017578, 19.21561050415), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 7, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(1161.5871582031, -315.71075439453, 69.205055236816), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(1163.4831542969, -323.26480102539, 69.205123901367), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(1152.3485107422, -321.70651245117, 69.205123901367), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(1156.2785644531, -326.17239379883, 69.205123901367), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(1152.9595947266, -325.15994262695, 69.205123901367), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(1156.5788574219, -323.07406616211, 69.205123901367), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(1157.2482910156, -319.5368347168, 69.205123901367), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(1160.3699951172, -321.56301879883, 69.205123901367), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(1163.8450927734, -316.98138427734, 69.205123901367), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 8, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = {
        { coord = vector3(2549.9982910156, 385.30108642578, 108.62296295166), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(2555.47265625, 382.17828369141, 108.62296295166), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(2555.3466796875, 390.13430786133, 108.62296295166), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(2558.2521972656, 382.65881347656, 108.62296295166), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(2555.3466796875, 390.13430786133, 108.62296295166), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(2555.8046875, 385.26931762695, 108.62296295166), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(2557.3166503906, 387.48425292969, 108.62296295166), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(2552.7536621094, 385.62094116211, 108.62296295166), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(2552.3190917969, 381.45352172852, 108.62296295166), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 9, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(545.9140625, 2663.4653320313, 42.156490325928), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(547.84967041016, 2670.8193359375, 42.156490325928), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(540.13665771484, 2668.3955078125, 42.15650177002), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(547.06384277344, 2672.0520019531, 42.15650177002), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(539.90222167969, 2670.2890625, 42.15650177002), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(544.97180175781, 2668.7780761719, 42.15650177002), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(542.10174560547, 2668.625, 42.15650177002), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(544.77514648438, 2666.0620117188, 42.15650177002), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(549.31384277344, 2665.7111816406, 42.15650177002), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }

      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 9, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(545.9140625, 2663.4653320313, 42.156490325928), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(547.84967041016, 2670.8193359375, 42.156490325928), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(540.13665771484, 2668.3955078125, 42.15650177002), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(547.06384277344, 2672.0520019531, 42.15650177002), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(539.90222167969, 2670.2890625, 42.15650177002), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(544.97180175781, 2668.7780761719, 42.15650177002), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(542.10174560547, 2668.625, 42.15650177002), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(544.77514648438, 2666.0620117188, 42.15650177002), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(549.31384277344, 2665.7111816406, 42.15650177002), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 10, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(1960.2817382813, 3748.3642578125, 32.343753814697), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(1960.2738037109, 3742.3166503906, 32.343753814697), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' },
        { coord = vector3(1965.1254882813, 3747.8569335938, 32.343788146973), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(1962.4752197266, 3740.1560058594, 32.343757629395), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  },
        { coord = vector3(1967.5588378906, 3745.25, 32.343757629395), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(1962.9689941406, 3743.806640625, 32.343753814697), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  },
        { coord = vector3(1965.3972167969, 3745.3935546875, 32.343757629395), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  },
        { coord = vector3(1961.9018554688, 3746.419921875, 32.343753814697), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  },
        { coord = vector3(1957.7553710938, 3745.57421875, 32.343753814697), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  },
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 11, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(374.77508544922, 333.72698974609, 103.56636810303), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(374.32855224609, 328.43051147461, 103.56636810303), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(380.18630981445, 326.85543823242, 103.56636810303), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  }, 
        { coord = vector3(374.47009277344, 324.83932495117, 103.56636810303), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(381.65139770508, 324.6989440918, 103.56636810303), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  }, 
        { coord = vector3(381.24798583984, 328.65133666992, 103.56636810303), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(378.99758911133, 325.11331176758, 103.56636810303), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(378.1223449707, 329.9114074707, 103.56636810303), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(377.36148071289, 332.72402954102, 103.56636810303), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 12, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(1733.5819091797, 6421.154296875, 35.037258148193), type = 'manage', label = l.manage, icon = '' },
        { coord = vector3(1729.9089355469, 6416.4887695313, 35.037220001221), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(1737.0290527344, 6412.98828125, 35.037250518799), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  }, 
        { coord = vector3(1729.7271728516, 6413.107421875, 35.037250518799), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(1736.2086181641, 6411.3369140625, 35.037250518799), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  },
        { coord = vector3(1732.6134033203, 6414.9306640625, 35.037258148193), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(1735.0700683594, 6413.3515625, 35.037254333496), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(1733.8337402344, 6417.447265625, 35.037258148193), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(1730.6242675781, 6419.8188476563, 35.037258148193), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 13, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(1697.9722900391, 4922.767578125, 42.063678741455), type = 'manage', label = l.manage, icon = '' }, 
        { coord = vector3(1698.8106689453, 4924.1118164063, 42.063678741455), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(1704.3488769531, 4929.4443359375, 42.063678741455), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  },
        { coord = vector3(1701.7362060547, 4931.5649414063, 42.063674926758), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(1705.2894287109, 4932.5317382813, 42.063674926758), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  }, 
        { coord = vector3(1707.0443115234, 4928.0439453125, 42.063674926758), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(1700.958984375, 4926.9360351563, 42.063652038574), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(1702.0390625, 4924.72265625, 42.063652038574), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(1702.6081542969, 4919.365234375, 42.063652038574), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
    { 
      id = 14, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(2672.0380859375, 3283.6171875, 55.241134643555), type = 'manage', label = l.manage, icon = '' }, 
        { coord = vector3(2676.7397460938, 3281.7900390625, 55.241134643555), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(2677.4562988281, 3282.7807617188, 55.241149902344), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  }, 
        { coord = vector3(2679.6083984375, 3281.1984863281, 55.241134643555), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(2681.8127441406, 3287.5998535156, 55.241134643555), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  }, 
        { coord = vector3(2678.3618164063, 3288.3244628906, 55.241134643555), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(2681.1069335938, 3285.1901855469, 55.241134643555), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(2676.4829101563, 3285.4724121094, 55.241134643555), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(2673.6799316406, 3287.0043945313, 55.241134643555), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    },
        { 
      id = 14, -- id it must be unique
      enableShopList = false,
      shop = "Satılık Market",
      coords = { 
        { coord = vector3(2672.0380859375, 3283.6171875, 55.241134643555), type = 'manage', label = l.manage, icon = '' }, 
        { coord = vector3(2676.7397460938, 3281.7900390625, 55.241134643555), type = 'mainshop', label = l.main , icon = 'fad fa-shopping-cart' }, 
        { coord = vector3(2677.4562988281, 3282.7807617188, 55.241149902344), type = 'drinks', label = l.drinks, icon = 'fad fa-glass'  }, 
        { coord = vector3(2679.6083984375, 3281.1984863281, 55.241134643555), type = 'fruits', label = l.fruits, icon = 'fad fa-apple-crate'  }, 
        { coord = vector3(2681.8127441406, 3287.5998535156, 55.241134643555), type = 'alcohols', label = l.alcohols, icon = 'fad fa-beer'  }, 
        { coord = vector3(2678.3618164063, 3288.3244628906, 55.241134643555), type = 'staplefoods', label = l.staplefoods, icon = 'fad fa-bread-slice'  }, 
        { coord = vector3(2681.1069335938, 3285.1901855469, 55.241134643555), type = 'junkfoods', label = l.junkfoods, icon = 'fad fa-burger-soda'  }, 
        { coord = vector3(2676.4829101563, 3285.4724121094, 55.241134643555), type = 'chemicals', label = l.chemicals, icon = 'fad fa-prescription-bottle-alt'  }, 
        { coord = vector3(2673.6799316406, 3287.0043945313, 55.241134643555), type = 'itemsales', label = l.sales, icon = 'fad fa-truck-loading'  }, 
      },
      theme = 0,
      marker = 20,
      markerColor = { r = 255, g = 255, b = 255 },
      markerY = -0.4,
      lock = false,
      items = {
        
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }
      },
      money_earned = 0,
      sales_history = {},
      owner = "",
      shop_transfer_fee = 5000,
    }
}



Config.DefaultShop =  { 
    id = 1,  
    enableShopList = false,
    shop = "Market",
    theme = 0,
    marker = 20,
    markerColor = { r = 255, g = 255, b = 255 },
    markerY = -0.4,
    lock = false,
    items = {
      
      { item = 'sosisli', price = { buy = 90, sell = 120  }, stock = 5, type = 'staplefoods' },
      { item = 'pizzakucuk', price = { buy = 80, sell = 100  }, stock = 5, type = 'staplefoods' },
      { item = 'atom', price = { buy = 50, sell = 70  }, stock = 5, type = 'drinks' },
      { item = 'phone', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'wallet', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'bankcard', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'sigarapaketi', price = { buy = 50, sell = 50  }, stock = 1000, type = 'itemsales' },
      { item = 'lighter', price = { buy = 20, sell = 20  }, stock = 1000, type = 'itemsales' }

    },
    money_earned = 0,
    sales_history = {},
    owner = "",
    shop_transfer_fee = 5000,
  }