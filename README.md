# LimeSurvey
LimeSurvey LEMP Install

To install make sure your domain is pointed at a fresh instance of Ubuntu 18.04. Login with sudo access and enter:

`wget -qO lime https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/limesurveyinstall.sh && sudo bash lime`

Enter the website URL (ex: samplesurvey.com) and a name for the database.

![Enter Site Information](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/01%20-%20Enter%20Domain%20Info.PNG?raw=true "Enter site info")

Press Enter to install Let's Encrypt.

![Press Enter](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/02%20-%20Setting%20up%20SSL.PNG?raw=true "Press Enter")

Type in your email address for Let's Encrypt renewal and security notices.

![Enter Your Email Address](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/03%20-%20SSL%20Email.PNG?raw=true "Enter Your Email Address")

Accept Let's Encrypt Terms of Service by Typing A.

![Type A hit Enter](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/04%20-%20Agree.PNG?raw=true "Type A hit Enter")

Share/Don't Share your Email with Let's Encrypt.

![Type Y or N](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/05%20-%20No.PNG?raw=true "Type Y or N")

Force all traffic through SSL.

![Type 2 hit Enter](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/06%20-%20Force%20SSL.PNG?raw=true "Type 2 hit Enter")

Diffie-Hellman Algorithm will take a few minutes to run. Be patient.

![Diffie-Hellman](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/07%20-%20Diffie-Hellman.PNG?raw=true "Diffie-Hellman")

MariaDB Install - Enter Password.

![MariaDB Password](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/08%20-%20MariaDB%20Root%20PAssword.PNG?raw=true "MariaDB Password")

MariaDB Install - Change Password - Type N.

![Type N](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/09%20-%20Mariadb%20Root%20Password%20No.PNG?raw=true "Type N")

MariaDB Install - Remove Anonymous Users - Type Y.

![Remove Anonymous Users - Type Y](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/10%20-%20Mariadb%20Remove%20Anon%20Users.PNG?raw=true "Remove Anonymous Users - Type Y")

MariaDB Install - Disallow Root Login Remotely - Type Y.

![Disallow Root Login Remotely - Type Y](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/11%20-%20Mariadb%20Root%20Remote%20Login.PNG?raw=true "Disallow Root Login Remotely - Type Y")

MariaDB Install - Remove Test Database - Type Y.

![Remove Test Database - Type Y](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/12%20-%20Mariadb%20Test%20Database.PNG?raw=true "Remove Test Database - Type Y")

MariaDB Install - Reload Privileges - Type Y.

![Reload Privileges - Type Y](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/13%20-%20Mariadb%20Reload%20Privilege%20Table.PNG?raw=true "Reload Privileges - Type Y")

Server Setup Complete - Take note of Database information to properly setup LimeSurvey.

![Server Setup Complete](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/14%20-%20Installation%20Complete.PNG?raw=true "Server Setup Complete")


LimeSurvey Setup - Check all modules are properly installed.

![LimeSurvey Setup](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/16%20-%20Pre-Install%20Check.PNG?raw=true "LimeSurvey Setup")

LimeSurvey Setup - Database Properties.

![LimeSurvey Setup - Database Properties](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/17%20-%20Setup%20Database.PNG?raw=true "LimeSurvey Setup - Database Properties")

LimeSurvey Setup - Administrator Setup.

![LimeSurvey Setup - Administrator Setup](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/19%20-%20Setup%20Admin%20Logins%20and%20Site%20Settings.PNG?raw=true "LimeSurvey Setup - Administrator Setup")


**LimeSurvey Server Complete!**

![LimeSurvey Server Complete!](https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/tutorial-images/20%20-%20Welcome.PNG?raw=true "LimeSurvey Server Complete!")
