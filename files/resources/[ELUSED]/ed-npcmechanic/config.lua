-- ▄▄▄▄▄▄▄▄▄▄▄
--  Config
-- ▄▄▄▄▄▄▄▄▄▄▄

Config = {}

companyName = "Pumpkin Shop Mechanic"       
companyIcon = "CHAR_LS_CUSTOMS" 
spawnRadius = 120               
drivingStyle = 786603           
simplerRepair = false          
repairComsticDamage = true     
flipVehicle = true            
Config.Price = 1000
Config.RequiredItem = "helpcard"


mechPeds = {
[1] = {name = "Tamirci", icon = "CHAR_MP_MECHANIC", model = "S_M_Y_DockWork_01", vehicle = 'UtilliTruck3', colour = 111, 
	['lines'] = {
		"Yeni kadar iyi.",
		"Hepsi tamamdır.",
		"İşte buradasın, şimdi çalışıyor.",
		"Bitti.",
		"Ne diyebilirim ki, ben işimin ustasıyım.",
		"Biraz sihir serpmem gerekiyordu ama şimdi işe yaramalı.",
		"Kimi arayacaksın? Dave Mechanic!",
		"Basit!",
		"Bir dahaki sefere gaz pedalını kullanmak daha kolay, değil mi?",
		"Düzeltemeyeceğim tek şey evliliğim...",
		"Düzeltildi. İyi günler, güvenli sürün!",
		"Biraz sıkıntılı ama işe yarıyor.",
	}
},

[2] = {name = "Tamirci", icon = "CHAR_MP_BIKER_MECHANIC", model = "S_M_Y_Construct_01", vehicle = 'BobcatXL', colour = 118, 
	['lines'] = {
		"Yeehaw, şimdi üzerinde nane olan bir yastıktan daha taze!",
		"Hepsi burada yapıldı.",
		"İş bitmiş.",
		"Yapabileceğim her şeyi yaptım.",
		"Birkaç kez İngiliz anahtarıyla vurdum ve sanırım işe yaradı!",
		"Motorun kendiliğinden yanması durumunda firmamız sorumluluk kabul etmez.",
		"Bazen gerçekten ne yaptığımı bildiğimi düşünmüyorum. Her neyse, işte araban!",
		"Ahh, evet... Nargilenin değiştirilmesi gerekiyordu. Şimdi her şey yolunda.",
		"Mükemmel durumda.",
		"Bu kötü çocuk arabaya bu kadar çok vida sığdırabilir.",
		"Artık çalışmalı"
		}
	},
}



Config.Locales = {
	['you_are_not_in_the_car'] = 'You are not in the car',
	['phone'] = "You don't have a phone",

}