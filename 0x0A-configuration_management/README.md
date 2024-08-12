# Configuration Management

In this project, I started working with Puppet as a configuration management tool. I practiced writing Puppet manifest files to create a file, install a package, and execute a command.

## Tasks 📃

### 0. Create a file

- **File:** `0-create_a_file.pp`
- **Description:** Puppet manifest file that creates a file named `school` in the `/tmp` directory.
- **File permissions:** `0744`
- **File group:** `www-data`
- **File owner:** `www-data`
- **File content:** `I love Puppet`

### 1. Install a package

- **File:** `1-install_a_package.pp`
- **Description:** Puppet manifest file that installs `flask` using `pip3`.

### 2. Execute a command

- **File:** `2-execute_a_command.pp`
- **Description:** Puppet manifest file that kills the process `killmenow`.
