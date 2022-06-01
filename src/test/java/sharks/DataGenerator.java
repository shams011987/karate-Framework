package sharks;

import com.github.javafaker.Faker;

public class DataGenerator {
/*
 * This method Generate random Email         ------> it mean to get email
 */
	
	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName()+faker.name().lastName()+"@gmail.com";
		return email;
	}
	
	/*
	 * This method Generate random FirstName       ------> it mean to get FirstName
	 */
	public static String getFirstName() {
		Faker faker = new Faker();
		String firstName = faker.name().firstName();
		return firstName;
	}
	/*
	 * This method Generate random lastName       ------> it mean to get lastName
	 */
	public static String getLastName() {
		Faker faker = new Faker();
		String lastName = faker.name().lastName();
		return lastName;
	}
	/*
	 * This method Generate random Title       ------> it mean to get Title
	 */
	public static String getTitle() {
		Faker faker = new Faker();
		String title = faker.name().title().toUpperCase();
		return title;
	}
	
	
	
	
}
