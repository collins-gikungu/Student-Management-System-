# 🎓 Student Management System – Microsoft Dynamics 365 Business Central (AL)

A custom **Student Management System** built using **AL language** for **Microsoft Dynamics 365 Business Central**.  
This project demonstrates structured AL development, number series management, role centers, approval workflows, and clean modular design.

---

## 📌 Project Overview

This system extends standard Business Central functionality to support **student administration**, including:

- Custom Student setup
- Dedicated number series for students
- Student profiles & role centers
- Student registration and approval workflows
- Clean separation of accounting and student management features

The project is designed for **local Business Central environments** and follows Microsoft AL best practices.

---

## 🚀 Key Features

### ✅ Student Management
- Custom Student records (built as extensions on standard tables)
- Dedicated **Student Number Series (STUDNO)**
- Student Card and Student List pages

### ✅ Role Centers & Profiles
- **Student Profile**
- **Student Accountant Profile**
- Custom RoleCenters with KPIs and navigation actions
- Embedded standard accountant activities where needed

### ✅ Approval Workflow
- Custom approval workflow for **Semester Registration**
- Status-driven process (Open → Pending Approval → Approved / Rejected)
- Integrated with standard Business Central approval mechanisms

### ✅ AL Development Best Practices
- Modular AL objects (Tables, Pages, Codeunits)
- Validation triggers
- Clean naming conventions
- Extensible architecture

---

## 🛠️ Technology Stack

- **Microsoft Dynamics 365 Business Central**
- **AL Language**
- **Visual Studio Code**
- **Business Central Local Server**
- **Windows Authentication**

---

## ⚙️ Environment Setup (High Level)

> ⚠️ This repository focuses on the **AL solution only**.

Prerequisites:
- Business Central Local Environment
- Visual Studio Code
- AL Language Extension
- Local server instance (e.g. BC240)

Steps:
1. Clone the repository
2. Open the project in VS Code
3. Update `launch.json` if needed
4. Publish the extension to your local Business Central environment

---

## 📂 Project Structure


Each folder represents a logical AL layer for maintainability and clarity.

---


---

## 📄 License

This project is licensed under the **MIT License** — feel free to use, learn from, or extend it.

---

## 🙌 Author

**Collins Gikungu**  
Business Central | AL Developer | Software Engineer  

🔗 GitHub: https://github.com/collins-gikungu

---

## ⭐ If you like this project
Give it a ⭐ — it helps a lot!
