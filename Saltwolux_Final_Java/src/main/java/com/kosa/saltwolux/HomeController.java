package com.kosa.saltwolux;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("data", "[{country: 'USA', value: 2025}, {country: 'KOR', value: 1500}]");
		model.addAttribute("data2", "[{\r\n" + 
				"    name: 'Installation',\r\n" + 
				"    data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]\r\n" + 
				"  }, {\r\n" + 
				"    name: 'Manufacturing',\r\n" + 
				"    data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]\r\n" + 
				"  }, {\r\n" + 
				"    name: 'Sales & Distribution',\r\n" + 
				"    data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]\r\n" + 
				"  }, {\r\n" + 
				"    name: 'Project Development',\r\n" + 
				"    data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]\r\n" + 
				"  }, {\r\n" + 
				"    name: 'Other',\r\n" + 
				"    data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]\r\n" + 
				"  }]");
		return "home";
	}
	
}
