# Co-Care (Collaborative Care Registry) Setup Guide

## Prerequisites

### Software Versions
- **MySQL:** 8.x.x
- **PHP:** 7.4 (minimum) or 8.x.x (recommended)
- **MySQL Collation:** `utf8mb4_general_ci`
- **Intl PHP Module:** Required

### Installation
1. **Install XAMPP:**
   Download and install XAMPP from [Apache Friends](https://www.apachefriends.org/download.html).

2. **Clone the Repository:**
   Clone the Co-Care repository from GitHub:
   ```bash
   git clone https://github.com/sathamneh/co-care.git
   ```

3. **Create/Restore the Database:**
   Use the `database.sql` file to create or restore the database in MySQL.

## XAMPP Configuration

1. **Open XAMPP Control Panel:**
   - Start XAMPP Control Panel.
   - Start Apache and MySQL modules.

2. **Locate DocumentRoot:**
   - Open the Apache config file through XAMPP Control Panel.
   - Look for `DocumentRoot` to find the path to the `htdocs` folder.

3. **Update DocumentRoot:**
   - In the code directory, right-click on the `public` folder and select "Reveal in File Explorer."
   - Copy the path address of the `public` folder.
   - Open `httpd.conf` file in Apache config and update `DocumentRoot`:
     ```apache
     DocumentRoot "path/to/your/project/public"
     ```
     - Replace backslashes with forward slashes.
     - Append `public` to the path.
     - Update the line below `DocumentRoot` with the same path.

4. **Restart Apache:**
   - Go to the XAMPP Control Panel and restart Apache.

5. **Check for Errors:**
   - Reload `localhost` in your browser to check for any errors.
   - If you encounter an error, you might be missing a `.env` file.

## Environment Configuration

1. **Create a `.env` File:**
   - In the root of the project, create a `.env` file.
   - Copy the contents of the sample environment file to the new `.env` file.

2. **Update Folder Permissions:**
   - Right-click on the project folder.
   - Go to Properties.
   - Uncheck the "Read-only" attribute for the folder and subfolders.

## Common Errors and Fixes

1. **Undefined Constant Errors:**
   - Check the log files in the XAMPP directory for more information.
   - Verify the following configuration files:
     - `app/config/App.php`
     - `app/config/Routing.php`
   - Ensure correct Apache configuration.

## Database Configuration in `.env` File

Ensure the following configurations in your `.env` file are correct:
```env
CI_ENVIRONMENT = development
app.baseURL = http://localhost/
database.default.hostname = localhost
database.default.database = <databasename>
database.default.username = <yourusername>
database.default.password = <password>
database.default.DBDriver = MySQLi
encryption.key = hex2bin:<randomkey>
```
- Replace `<databasename>`, `<yourusername>`, and `<password>` with your database details.
- Generate a random key using [RandomKeygen](https://randomkeygen.com/) for `<randomkey>`.

## Docker Configuration

### Build a Docker Image
```bash
docker build -t co-care-app .
```

### Run the Docker Container
```bash
docker run --name CoCare -d co-care-app
```
