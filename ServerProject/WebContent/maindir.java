 
		
		//Create a Scanner (import it above!) and ask the user how many random passwords they want generated
	 
		 
		int total = 1;
 
		int length = 10;

		//Create an array of random passwords (Strings)
		String[] randomPasswords = new String[total];

		//Randomly generate passwords total number of times
		for(int i = 0; i < total; i++) {
			//Create a variable to store the random password
			String randomPassword = "";
			//Randomly generate a character for the password length number of times
			for(int j = 0; j < length; j++) {
				//Add a random lowercase or UPPERCASE character to our randomPassword String
				randomPassword += randomCharacter();
			}
			//Add the random password to your array
			randomPasswords[i] = randomPassword;
		}

		//Print out the random passwords array
		printArray(randomPasswords);

  }


	//Create a function that prints out an array that is passed in as a parameter
	public static void printArray(String[] arr) {
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}

	//Create a function that randomly generates a letter (lowercase or uppercase) or number (0-9) using ASCII
	//'0' - '9' => 48-57 in ASCII
	//'A' - 'Z' => 65-90 in ASCII
	//'a' - 'z' => 97-122 in ASCII
	public static char randomCharacter() {
		//We multiply Math.random() by 62 because there are 26 lowercase letters, 26 uppercase letters, and 10 numbers, and 26 + 26 + 10 = 62
		//This random number has values between 0 (inclusive) and 62 (exclusive)
		int rand = (int)(Math.random()*62);
		
		//0-61 inclusive = all possible values of rand
		//0-9 inclusive = 10 possible numbers/digits
		//10-35 inclusive = 26 possible uppercase letters
		//36-61 inclusive = 26 possible lowercase letters
		//If rand is between 0 (inclusive) and 9 (inclusive), we can say it's a number/digit
		//If rand is between 10 (inclusive) and 35 (inclusive), we can say it's an uppercase letter
		//If rand is between 36 (inclusive) and 61 (inclusive), we can say it's a lowercase letter
		if(rand <= 9) {
			//Number (48-57 in ASCII)
			//To convert from 0-9 to 48-57, we can add 48 to rand because 48-0 = 48
			int number = rand + 48;
			//This way, rand = 0 => number = 48 => '0'
			//Remember to cast our int value to a char!
			return (char)(number);
		} else if(rand <= 35) {
			//Uppercase letter (65-90 in ASCII)
			//To convert from 10-35 to 65-90, we can add 55 to rand because 65-10 = 55
			int uppercase = rand + 55;
			//This way, rand = 10 => uppercase = 65 => 'A'
			//Remember to cast our int value to a char!
			return (char)(uppercase);
		} else {
			//Lowercase letter (97-122 in ASCII)
			//To convert from 36-61 to 97-122, we can add 61 to rand because 97-36 = 61
			int lowercase = rand + 61;
			//This way, rand = 36 => lowercase = 97 => 'a'
			//Remember to cast our int value to a char!
			return (char)(lowercase);
		}
 