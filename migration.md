### 1: Destination Server

1. **Update and Upgrade the Server:**

   ```bash
   sudo apt update
   sudo apt upgrade
   ```

2. **Install Apache2, PHP, and MySQL:**

   ```bash
   sudo apt install apache2 php libapache2-mod-php mysql-server
   ```

3. **Install Let's Encrypt and Certbot:**

   ```bash
   sudo apt install certbot python3-certbot-apache
   ```

4. **Install Fail2Ban:**
   ```bash
   sudo apt install fail2ban
   ```

### 2: Configure MySQL

1. **Secure MySQL Installation:**

   ```bash
   sudo mysql_secure_installation
   ```

2. **Create Database and User:**
   ```sql
   CREATE DATABASE cocare;
   CREATE USER 'cocare'@'localhost' IDENTIFIED BY 'SomeRandomPassword';
   GRANT ALL PRIVILEGES ON cocare.* TO 'cocare'@'localhost';
   FLUSH PRIVILEGES;
   ```
3. **restore the database:**
   from the SQL files folder, locate the `cocare_dev_datamodel.sql` file and either restore it with phpmyadmin (to be installed seperately), or use mysql cmd line tool.
   `mysql -u cocare -p cocare < cocare_dev_datamodel.sql` and enter the password provided in the previous step

### 3: Migrate the Website

1. **Install Git:**

   ```bash
   sudo apt install git
   ```

2. **Clone the Repository:**
   ```bash
   cd /var/www/html
   sudo git clone -b review git@github.com:sathamneh/co-care.git
   sudo chown -R www-data:www-data co-care
   sudo chmod -R 755 co-care
   ```

### Step 4: Configure Apache2

1. **Create a Virtual Host Configuration:**

   ```bash
   sudo nano /etc/apache2/sites-available/co-care.conf
   ```

   **Example Configuration:**

   ```apache
   <VirtualHost *:80>
       ServerAdmin info@vinksoftware.com
       ServerName cocare.us
       ServerAlias www.cocare.us
       DocumentRoot /var/www/html/co-care

       <Directory /var/www/html/co-care>
           Options Indexes FollowSymLinks
           AllowOverride All
           Require all granted
       </Directory>

       ErrorLog ${APACHE_LOG_DIR}/error.log
       CustomLog ${APACHE_LOG_DIR}/access.log combined
   </VirtualHost>
   ```

2. **Enable the Virtual Host and Rewrite Module:**
   ```bash
   sudo a2ensite co-care.conf
   sudo a2enmod rewrite
   sudo systemctl restart apache2
   ```

### Step 5: Secure with Let's Encrypt

1. **Obtain and Install the SSL Certificate:**

   ```bash
   sudo certbot --apache -d your_domain -d www.your_domain
   ```

2. **Verify Auto-Renewal:**
   ```bash
   sudo systemctl status certbot.timer
   ```

### Step 6: Configure Fail2Ban

1. **Create a Jail Configuration for Apache:**

   ```bash
   sudo nano /etc/fail2ban/jail.local
   ```

   **Example Configuration:**

   ```ini
   [apache-auth]
   enabled = true
   port = http,https
   filter = apache-auth
   logpath = /var/log/apache2/*error.log
   maxretry = 3

   [apache-badbots]
   enabled = true
   port = http,https
   filter = apache-badbots
   logpath = /var/log/apache2/*error.log
   maxretry = 2

   [apache-noscript]
   enabled = true
   port = http,https
   filter = apache-noscript
   logpath = /var/log/apache2/*error.log
   maxretry = 2

   [apache-overflows]
   enabled = true
   port = http,https
   filter = apache-overflows
   logpath = /var/log/apache2/*error.log
   maxretry = 2
   ```

2. **Restart Fail2Ban:**
   ```bash
   sudo systemctl restart fail2ban
   sudo systemctl enable fail2ban
   ```

### Step 7: Testing and Finalizing

1. **Verify the Website:**
   Ensure the website is accessible and functioning correctly on the destination server.

2. **Check SSL:**
   Verify that the SSL certificate is correctly installed and the site is served over HTTPS.

3. **Monitor Fail2Ban:**
   Check Fail2Ban logs to ensure it is actively monitoring and blocking malicious activity.

### Configure DNS (Domain)

- Update your DNS records to point to the new server's IP address.


### Email setup.
- Sendgrid
- postfix server setup