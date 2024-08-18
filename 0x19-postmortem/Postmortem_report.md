### Postmortem: Web Application Outage Due to Database Misconfiguration

#### **Issue Summary**
**Duration:** The outage lasted for approximately 2 hours, from 3:00 PM to 5:00 PM GMT on August 18, 2024.

**Impact:** The main web application experienced a complete service outage, resulting in users being unable to access any part of the site. Approximately 85% of users were affected, as they could not load pages, submit forms, or interact with any site features. 

**Root Cause:** A database misconfiguration during a routine update caused the primary database connection to fail, leading to the application being unable to retrieve or store data.

---

#### **Timeline**

- **3:00 PM:** The issue was detected by the monitoring system, which triggered an alert indicating that the web application’s response time had spiked, and users were experiencing 500 Internal Server Errors.
  
- **3:05 PM:** The on-call engineer received the alert and began investigating the application server logs, initially suspecting an issue with the application code.
  
- **3:15 PM:** The engineering team focused on debugging the recent code deployments, considering a potential bug in the latest update as the root cause.
  
- **3:30 PM:** After finding no issues with the application code, the investigation shifted to the server environment, where a possible network issue was considered.
  
- **3:45 PM:** The issue was escalated to the database administration team after discovering that the application could not establish a connection with the database.
  
- **4:00 PM:** The database logs were reviewed, revealing that a recent update to the database configuration had incorrectly set the maximum allowed connections to a lower limit than required.
  
- **4:15 PM:** The configuration was corrected, and the database service was restarted.
  
- **4:30 PM:** The web application was tested, and normal service was confirmed to be restored.
  
- **5:00 PM:** The incident was officially closed after monitoring confirmed stable operations.

---

#### **Root Cause and Resolution**

**Root Cause:** The root cause of the outage was a database misconfiguration. During a routine update, the maximum number of allowed connections to the database was set to 50, significantly lower than the required 200 connections. This misconfiguration caused the application to hit the connection limit, leading to failed database queries and the subsequent service outage.

**Resolution:** The issue was resolved by identifying the incorrect database configuration and updating the maximum allowed connections to the appropriate value. After correcting the setting, the database service was restarted, restoring normal functionality to the web application.

---

#### **Corrective and Preventative Measures**

**Improvements and Fixes:**
- Implement stricter review protocols for database configuration changes to ensure they meet system requirements.
- Increase the monitoring system's sensitivity to detect issues related to database connections earlier.

**Tasks:**
1. **Update Database Configuration Review Process:** Implement a mandatory peer-review process for any database configuration changes.
2. **Add Connection Limit Monitoring:** Integrate a monitoring alert specifically for database connection limits to provide early warnings before reaching critical thresholds.
3. **Conduct a Post-Incident Training:** Provide a training session for engineers on identifying and troubleshooting database-related issues efficiently.
4. **Update Incident Response Documentation:** Include the steps for checking database configurations in the incident response playbook.

By addressing these tasks, we aim to prevent similar outages in the future and ensure faster recovery times in the event of a service disruption.
